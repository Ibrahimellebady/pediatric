import 'package:flutter/material.dart';

import '../../../../../../core/theming/colors.dart';

class PreviousPageButtonWidget extends StatelessWidget {
  const PreviousPageButtonWidget({
    super.key,
    required this.onPreviousPressed,
  });

  final VoidCallback onPreviousPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPreviousPressed();
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
          size: 35,
          color: ColorManager.mainColor,
        ),
      ),
    );
  }
}
