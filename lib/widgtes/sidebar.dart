import 'package:aipowered/theme/colors.dart';
import 'package:aipowered/widgtes/side_bar_button.dart';
import 'package:flutter/material.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  bool isCollapsed = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      width: isCollapsed ? 64 : 150,
      color: AppColors.sideNav,
      child: Column(
        children: [
          const SizedBox(height: 16),
          Icon(
            Icons.auto_awesome_mosaic,
            color: AppColors.whiteColor,
            size: isCollapsed ? 30 : 60,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment:
              isCollapsed ? CrossAxisAlignment.center : CrossAxisAlignment.start,
              children: [

                const SizedBox(height: 16),
                SideBarButton(isCollapsed: isCollapsed, icon: Icons.add_sharp, text: "Home"),
                SideBarButton(isCollapsed: isCollapsed, icon: Icons.search, text: "Search"),
                SideBarButton(isCollapsed: isCollapsed, icon: Icons.language, text: "Spaces"),
                SideBarButton(isCollapsed: isCollapsed, icon: Icons.auto_awesome, text: "Discovery"),
                SideBarButton(isCollapsed: isCollapsed, icon: Icons.cloud_outlined, text: "Library"),
                const Spacer(),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isCollapsed = !isCollapsed;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              margin: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
              child: Icon(
                isCollapsed
                    ? Icons.keyboard_arrow_right_sharp
                    : Icons.keyboard_arrow_left,
                color: AppColors.iconGrey,
                size: 22,
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),



    );
  }
}

