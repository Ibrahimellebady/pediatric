import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pediatric_pt/view/home/chat_bot/chat_bot.dart';
import 'package:pediatric_pt/view/home/home/screens/home.dart';
import 'package:pediatric_pt/view/home/settings/screens/settings.dart';

import '../../core/theming/colors.dart';
import '../../generated/l10n.dart';

class navigationBar extends StatefulWidget {
  const navigationBar({super.key});

  @override
  _navigationBarState createState() => _navigationBarState();
}

class _navigationBarState extends State<navigationBar> {
  int _selectedIndex = 1;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static List<Widget> _widgetOptions = <Widget>[
    SettingScreen(),
    homeScreen(),
    chatBot()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: GNav(
            rippleColor: Colors.grey[300]!,
            hoverColor: Colors.grey[100]!,
            gap: 12,
            activeColor: ColorManager.mainColor,
            tabBorderRadius: 50,
            iconSize: 24,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            duration: const Duration(milliseconds: 500),
            // curve: Curves.easeOutExpo,
            tabBackgroundColor: Colors.white,
            color: Colors.white,
            backgroundColor: ColorManager.mainColor,
            tabs: [
              GButton(
                icon: Icons.settings,
                text: S.of(context).settings,
                margin: const EdgeInsets.all(12),
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: ColorManager.mainColor,
                ),
              ),
              GButton(
                icon: FontAwesomeIcons.home,
                text: S.of(context).home,
                margin: const EdgeInsets.all(12),
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: ColorManager.mainColor,
                ),
              ),
              GButton(
                icon: FontAwesomeIcons.robot,
                text: S.of(context).chatBot,
                margin: const EdgeInsets.all(12),
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: ColorManager.mainColor,
                ),
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(
                () {
                  _selectedIndex = index;
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
