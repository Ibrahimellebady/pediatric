import 'package:flutter/material.dart';

import '../../../../../../core/theming/colors.dart';

class UpdatePatientSheetWidget extends StatelessWidget {
  const UpdatePatientSheetWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.mainColor,
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Save and Next",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18),
          ),
          SizedBox(
            width: 16,
          ),
          Icon(
            Icons.arrow_forward_ios_outlined,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
