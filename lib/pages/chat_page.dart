import 'package:aipowered/theme/colors.dart';
import 'package:aipowered/widgtes/answer_section.dart';
import 'package:aipowered/widgtes/sidebar.dart';
import 'package:aipowered/widgtes/sources_section.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String question;
  const ChatPage({
    super.key,
    required this.question,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          kIsWeb ? const Sidebar() : const SizedBox(),
          kIsWeb ? const SizedBox(width: 100) : const SizedBox(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      question,
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24),
                    //sources
                    const SourcesSection(),
                    const SizedBox(height: 24),
                    //answer section
                    const AnswerSection()
                  ],
                ),
              ),
            ),
          ),
          //otherside where pictures can be displayed
          kIsWeb
              ? const Placeholder(
                  strokeWidth: 0,
                  color: AppColors.background,
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
