import 'package:aipowered/services/chat_web_services.dart';
import 'package:aipowered/theme/colors.dart';
import 'package:aipowered/widgtes/search_section.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../widgtes/sidebar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    ChatWebService().connect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Side navbar
          kIsWeb ? const Sidebar() : const SizedBox(),
          Expanded(
            // Prevent overflow
            child: Padding(
              padding: !kIsWeb ? const EdgeInsets.all(8.0) : EdgeInsets.zero,
              child: Column(
                children: [
                  // Search section
                  const Expanded(
                    child: SearchSection(),
                  ),

                  // Footer
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: const Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            "Career",
                            style: TextStyle(
                                fontSize: 14, color: AppColors.footerGrey),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            "Digital",
                            style: TextStyle(
                                fontSize: 14, color: AppColors.footerGrey),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            "blog",
                            style: TextStyle(
                                fontSize: 14, color: AppColors.footerGrey),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
