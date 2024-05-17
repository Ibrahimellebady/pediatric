import 'package:flutter/material.dart';

import '../../../../../../core/theming/colors.dart';

class courseButtonWidget extends StatelessWidget {
  final String buttonText;
  final Function buttonOnTap;

  const courseButtonWidget({
    super.key,
    required this.buttonText,
    required this.buttonOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        buttonOnTap();
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 2.6,
        margin: const EdgeInsets.only(top: 12),
        padding: const EdgeInsets.symmetric(
          vertical: 4,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: const TextStyle(
              color: ColorManager.mainColor,
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}
