
import asyncio
from fastapi import FastAPI, WebSocket
from fastapi.websockets import WebSocketState

from pydantic_models.chat_body import ChatBody
from services.llm_service import LLMService
from services.sort_source_service import SortSourceService
from services.search_services import SearchService

app = FastAPI()

search_service = SearchService()
sort_source_service = SortSourceService()
llm_service = LLMService()

#chat websocket for real time events 

@app.websocket("/ws/chat")
async def websocket_chat_endpoint(websocket: WebSocket):
    await websocket.accept()

    try:
        while True:  # Keep listening for multiple messages
            await asyncio.sleep(0.1)
            data = await websocket.receive_json()
            query = data.get("query")

            # Search the web and find appropriate sources
            search_results = search_service.web_search(query)
            sorted_results = sort_source_service.sort_sources(query, search_results)

            # Send data back to the user
            await websocket.send_json({
                "type": "search_result", 
                "data": sorted_results
            })

            # Generate the response using LLM
            for chunk in llm_service.generate_response(query, sorted_results):
                await asyncio.sleep(0.1)
                await websocket.send_json({"type": "content", "data": chunk})
          
    # except WebSocketDisconnect:
    #     print("Client disconnected")  
    except Exception as e:
        print(f"Unexpected error occurred: {e}")  # Print detailed error
    finally:
        try:
            if websocket.client_state == WebSocketState.CONNECTED:
                await websocket.close()
        except RuntimeError:
            pass 
 
@app.post("/chat")
def chat_endpoint(body: ChatBody):
    # searach the eb and find appropriate sources
    search_results = search_service.web_search(body.query)
    # sort sources
    sorted_results = sort_source_service.sort_sources(body.query, search_results)
    print(sorted_results)
    # generate the response using LLM
    response = llm_service.generate_response(body.query, sorted_results)

    return response
