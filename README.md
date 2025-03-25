

# **🚀 Flutter & Python GenAI App**
A cross-platform AI-powered mobile application built with **Flutter** (frontend) and **FastAPI** (backend), integrating **Google Gemini APIs** and **TensorFlow** for real-time text generation and sentence translation.

---

## **📌 Features**
✅ AI-powered text & image generation using **Google Gemini API**  
✅ Real-time **sentence translation** using a **TensorFlow model**  
✅ Secure API communication via **FastAPI**  
✅ Cross-platform support (Android & iOS)

---

## **🛠 Installation & Setup**

### **1️⃣ Clone the Repository**
```bash
git clone https://github.com/cygon23/gen_ai.git
cd yourproject
```

---

## **🔹 Backend Setup (Python - FastAPI, Gemini API, TensorFlow)**

### **2️⃣ Install Dependencies**
```bash
cd backend
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
pip install -r requirements.txt
```

### **3️⃣ Install Required Packages**
Ensure the following dependencies are installed in **requirements.txt** or install them manually:
```bash
pip install fastapi pydantic "pydantic[email]" uvicorn google-generativeai tensorflow
```
- **FastAPI** - The web framework
- **Pydantic** - For request validation (`pydantic_models.chat_body`)
- **Uvicorn** - For running the API server
- **Google Generative AI SDK** - For using the **Gemini API**
- **TensorFlow** - For sentence translation

---

### **4️⃣ Configure Environment Variables**
Create a `.env` file in `backend/` with your API keys:
```env
GEMINI_API_KEY=your_gemini_api_key
TRANSLATION_MODEL_PATH=models/translation_model.h5
DEBUG=True
```

**📌 How to Get a Gemini API Key:**
1. Visit [Google AI Studio](https://aistudio.google.com).
2. Sign in with your **Google account**.
3. Go to **API Keys** and generate a new key.
4. Copy the key and paste it into your `.env` file as `GEMINI_API_KEY`.

---

### **5️⃣ Run the FastAPI Server**
```bash
uvicorn main:app --reload
```
The backend will be available at:  
🔗 `http://127.0.0.1:8000/`

---

## **🔹 Frontend Setup (Flutter)**

### **6️⃣ Install Dependencies**
```bash
cd frontend
flutter pub get
```

### **7️⃣ Configure API Endpoint**
Edit `lib/config.dart` and update the **API URL**:
```dart
const String API_URL = "http://127.0.0.1:8000/";
```

### **8️⃣ Run the App**
For **Android Emulator** or **Connected Device**:
```bash
flutter run
```
For a **Release APK**:
```bash
flutter build apk --release
```
📂 **Generated APK is in:**  
`build/app/outputs/flutter-apk/app-release.apk`

---

## **📝 API Endpoints (FastAPI)**
### **🔹 Text Generation using Gemini API**
```http
POST /generate_text
```
#### **Request Body:**
```json
{
  "prompt": "Write a short poem about AI"
}
```
#### **Response:**
```json
{
  "response": "AI writes, thinks, and dreams anew..."
}
```

---

### **🔹 Sentence Translation using TensorFlow**
```http
POST /translate
```
#### **Request Body:**
```json
{
  "text": "Hello, how are you?",
  "target_language": "fr"
}
```
#### **Response:**
```json
{
  "translated_text": "Bonjour, comment ça va?"
}
```

---

## **📂 Project Structure**
```
/yourproject
│── backend/          # FastAPI backend
│   ├── main.py       # FastAPI entry point
│   ├── pydantic_models/chat_body.py  # Pydantic model definitions
│   ├── services/
│   │   ├── llm_service.py  # Handles Gemini API calls
│   │   ├── sort_source_service.py  # Custom sorting service
│   │   ├── search_services.py  # Custom search engine integration
│   ├── requirements.txt
│   ├── .env
│   ├── models/        # TensorFlow models
│── frontend/         # Flutter mobile app
│   ├── lib/
│   ├── pubspec.yaml
│   ├── android/
│── .gitignore
│── README.md
```

---

## **💡 Contributing**
Pull requests are welcome! Follow the contribution guidelines before submitting.

---

## **📄 License**
This project is licensed under the **MIT License**.
