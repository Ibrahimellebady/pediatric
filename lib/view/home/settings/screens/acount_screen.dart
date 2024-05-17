import 'package:flutter/material.dart';

import '../../../../core/shared/gender_card_widget.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<AccountScreen> {
  String gender = "Male";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: Hero(
                    tag: "userImage",
                    child: Image.asset(
                      "images/1.png",
                    ),
                  ),
                ),
                Positioned(
                  right: 24,
                  bottom: 16,
                  child: Icon(
                    Icons.photo_camera,
                    size: 32,
                  ),
                )
              ],
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: EdgeInsets.all(8),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        gender = "Male";
                      });
                    },
                    child: genderCardWidget(
                      gender: gender,
                      Sex: 'Male',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(8),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        gender = "Female";
                      });
                    },
                    child: genderCardWidget(
                      gender: gender,
                      Sex: 'Female',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
