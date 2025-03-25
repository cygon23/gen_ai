import 'package:aipowered/services/chat_web_services.dart';
import 'package:aipowered/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AnswerSection extends StatefulWidget {
  const AnswerSection({super.key});

  @override
  State<AnswerSection> createState() => _AnswerSectionState();
}

class _AnswerSectionState extends State<AnswerSection> {
  bool isLoading = true;
  String fullResponse = '''
  Here’s a full response with a short answer and relevant links:  

**Cristiano Ronaldo** is a Portuguese professional footballer, widely regarded as one of the greatest players of all time. He has won multiple Ballon d'Or awards, played for clubs like Manchester United, Real Madrid, and Juventus, and holds numerous goal-scoring records.  

For more details, check these sources:  
1. [Cristiano Ronaldo - Wikipedia](https://en.wikipedia.org/wiki/Cristiano_Ronaldo)  
2. [Cristiano Ronaldo - Stats & Career](https://www.transfermarkt.com/cristiano-ronaldo/profil/spieler/8198)  
3. [Cristiano Ronaldo - Official Instagram](https://www.instagram.com/cristiano/)  

Let me know if you need more info! ⚽🔥
''';

  @override
  void initState() {
    super.initState();
    ChatWebService().contentStream.listen((data) {
      if (isLoading) {
        fullResponse = "";
      }
      setState(() {
        fullResponse += data['data'];
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "careerNamimi",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        // const SizedBox(height: 16),
        Skeletonizer(
          enabled: isLoading,
          child: Markdown(
            data: fullResponse,
            shrinkWrap: true,
            styleSheet:
                MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
              codeblockDecoration: BoxDecoration(
                color: AppColors.cardColor,
                borderRadius: BorderRadius.circular(10),
              ),
              code: const TextStyle(fontSize: 16),
            ),
          ),
        )
      ],
    );
  }
}
