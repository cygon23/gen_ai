import 'package:aipowered/services/chat_web_services.dart';
import 'package:aipowered/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SourcesSection extends StatefulWidget {
  const SourcesSection({super.key});

  @override
  State<SourcesSection> createState() => _SourcesSectionState();
}

class _SourcesSectionState extends State<SourcesSection> {
  bool isLoading = true;
  List searchResults = [
    {
      "title": "Cristiano Ronaldo - Wikipedia",
      "url": "https://en.wikipedia.org/wiki/Cristiano_Ronaldo"
    },
    {
      "title": "Cristiano Ronaldo - Stats, Career & Biography",
      "url":
          "https://www.transfermarkt.com/cristiano-ronaldo/profil/spieler/8198"
    },
    {
      "title": "Cristiano Ronaldo - Official Instagram",
      "url": "https://www.instagram.com/cristiano/"
    },
  ];

  @override
  void initState() {
    super.initState();
    ChatWebService().searchResultStream.listen((data) {
      setState(() {
        searchResults = data['data'];
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Icon(
              Icons.source_outlined,
              color: Colors.white70,
            ),
            SizedBox(width: 8),
            Text(
              "Sources",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        const SizedBox(height: 16),
        Skeletonizer(
          enabled: isLoading,
          child: Wrap(
            spacing: 16,
            runSpacing: 16,
            children: searchResults.map((res) {
              return Container(
                width: 150,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: AppColors.cardColor,
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    Text(
                      res['title'],
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      res['url'],
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}
