import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../core/theming/colors.dart';
import '../../../../routes.dart';
import '../widgets/setting_card_widget.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: ColorManager.mainColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                  height: 125,
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  color: Colors.white,
                )
              ],
            ),
            Positioned(
              top: 70,
              left: MediaQuery.of(context).size.width / 2 - 55,
              child: Column(
                children: [
                  Positioned(
                    child: CircleAvatar(
                      radius: 55,
                      child: Hero(
                          tag: "userImage", child: Image.asset('images/1.png')),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Positioned(
                left: 16,
                top: 185,
                child: Column(
                  children: [
                    Text(
                      'Dr. Ibrahim Magid',
                      style: TextStyle(fontSize: 24),
                    ),
                    setting_card_widget(
                      card_icon: Icon(
                        Icons.person,
                        color: ColorManager.secondaryColor,
                      ),
                      card_title: 'Account',
                      card_finction: () {
                        Navigator.pushNamed(context, AppRoute.Account);
                      },
                    ),
                    setting_card_widget(
                      card_icon: Icon(
                        Icons.info_sharp,
                        color: ColorManager.secondaryColor,
                      ),
                      card_title: 'About',
                      card_finction: () {},
                    ),
                    setting_card_widget(
                      card_icon: Icon(
                        Icons.question_mark_sharp,
                        color: ColorManager.secondaryColor,
                      ),
                      card_title: 'Help',
                      card_finction: () {},
                    ),
                    setting_card_widget(
                      card_icon: Icon(
                        Icons.phone,
                        color: ColorManager.secondaryColor,
                      ),
                      card_title: 'Contact ',
                      card_finction: () {},
                    ),
                    setting_card_widget(
                      card_icon: Icon(
                        Icons.logout,
                        color: ColorManager.secondaryColor,
                      ),
                      card_title: 'log out ',
                      card_finction: () async {
                        GoogleSignIn googleSignIn = GoogleSignIn();
                        googleSignIn.disconnect();
                        await FirebaseAuth.instance.signOut();
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            AppRoute.login, (route) => false);
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
