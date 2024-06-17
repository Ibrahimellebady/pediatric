import 'package:flutter/material.dart';

import '../../../../../../core/theming/colors.dart';

class PatientCardWidget extends StatelessWidget {
  final String name;
  final String diagnosis;
  final String patientPicUrl;

  const PatientCardWidget(
      {super.key,
      required this.name,
      required this.diagnosis,
      required this.patientPicUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 32,
      margin: EdgeInsets.all(16),
      child: Card(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 2 - 32,
              child: Image.asset(patientPicUrl),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2 - 32,
              padding: EdgeInsets.symmetric(
                horizontal: 8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: ColorManager.mainColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    diagnosis,
                    style: TextStyle(
                        color: Colors.black26.withOpacity(0.8),
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.italic),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
