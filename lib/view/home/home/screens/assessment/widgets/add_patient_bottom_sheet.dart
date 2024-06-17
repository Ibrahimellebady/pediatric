import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../controller/cubit/patients_cubit/patient_cubit.dart';
import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/theming/colors.dart';

class AddPatientBottomSheet extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController diagnosisController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Add New Patient",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: ColorManager.mainColor,
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: diagnosisController,
              decoration: InputDecoration(
                labelText: 'Diagnosis',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                String name = nameController.text;
                String diagnosis = diagnosisController.text;
                if (name.isNotEmpty && diagnosis.isNotEmpty) {
                  context.read<PatientCubit>().addPatientToFirestore(
                        name: name,
                        diagnosis: diagnosis,
                        userId: Constants.userID!,
                      );

                  print("========== added");
                  Navigator.pop(context);
                }
              },
              child: Text("Add Patient"),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
