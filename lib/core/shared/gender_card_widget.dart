import 'package:flutter/material.dart';

import '../theming/colors.dart';

class genderCardWidget extends StatelessWidget {
  const genderCardWidget({
    super.key,
    required this.gender,
    required this.Sex,
  });

  final String gender;
  final String Sex;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: gender == Sex ? 6 : 2,
      shadowColor: gender == Sex
          ? ColorManager.secondaryColor.withOpacity(0.3)
          : Colors.grey,
      borderRadius: BorderRadius.all(
        Radius.circular(12),
      ),
      child: Container(
        width: gender == Sex ? 150 : 120,
        decoration: BoxDecoration(
            color: gender == Sex
                ? ColorManager.mainColor.withOpacity(0.9)
                : Colors.grey.shade200,
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            )),
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            Icon(
              Icons.male,
              color:
                  gender == Sex ? Colors.white : Colors.black.withOpacity(0.85),
              size: gender == Sex ? 65 : 50,
            ),
            Center(
              child: Text(
                Sex,
                style: gender == Sex
                    ? TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Lato")
                    : TextStyle(
                        fontFamily: "Lato",
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Colors.black.withOpacity(0.8),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
