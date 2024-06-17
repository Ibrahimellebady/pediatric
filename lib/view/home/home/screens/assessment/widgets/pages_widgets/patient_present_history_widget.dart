import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../controller/cubit/patients_cubit/patient_cubit.dart';
import '../../../../../../../core/models/patient_model.dart';
import '../../../../../settings/screens/edit_account_screen.dart';
import '../previous_page_button_widget.dart';
import '../update_patient_sheet_widget.dart';

//
class PatientPresentHistoryWidget extends StatefulWidget {
  final PatientModel patientModel;
  final VoidCallback onNextPressed;
  final VoidCallback onPreviousPressed;

  const PatientPresentHistoryWidget(
      {required this.patientModel,
        required this.onNextPressed,
        required this.onPreviousPressed});

  @override
  State<PatientPresentHistoryWidget> createState() =>
      _PatientPresentHistoryWidgetState();
}

class _PatientPresentHistoryWidgetState
    extends State<PatientPresentHistoryWidget> {
  final TextEditingController height = TextEditingController();

  final TextEditingController weight = TextEditingController();

  final TextEditingController headCircumference = TextEditingController();

  final TextEditingController armCircumference = TextEditingController();

  final TextEditingController medication = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PatientCubit, PatientState>(
      listener: (context, state) {},
      builder: (context, state) {
        String patientID = widget.patientModel.patientId!;
        height.text = widget.patientModel.height ?? "";
        weight.text = widget.patientModel.weight ?? "";
        headCircumference.text = widget.patientModel.headCircumference ?? "";
        armCircumference.text = widget.patientModel.armCircumference ?? "";
        medication.text = widget.patientModel.medication ?? "";

        return SingleChildScrollView(
          child: Column(
            children: [
              textField(
                fieldWidth: MediaQuery.of(context).size.width,
                fieldName: "height",
                controller: height,
              ),
              textField(
                fieldWidth: MediaQuery.of(context).size.width,
                fieldName: "weight",
                controller: weight,
              ),
              textField(
                fieldWidth: MediaQuery.of(context).size.width,
                fieldName: "head Circumference",
                controller: headCircumference,
              ),
              textField(
                fieldWidth: MediaQuery.of(context).size.width,
                fieldName: "arm Circumference",
                controller: armCircumference,
              ),
              textField(
                fieldWidth: MediaQuery.of(context).size.width,
                fieldName: "medication",
                controller: medication,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PreviousPageButtonWidget(
                      onPreviousPressed: widget.onPreviousPressed),
                  // PreviousPageButtonWidget(widget: widget),
                  GestureDetector(
                    onTap: () {
                      context.read<PatientCubit>().updatePatientPresentHistory(
                        patientId: patientID,
                        height: height.text,
                        weight: weight.text,
                        headCircumference: headCircumference.text,
                        armCircumference: armCircumference.text,
                        medication: medication.text,
                      );
                      widget.onNextPressed();
                    },
                    child: UpdatePatientSheetWidget(),
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              )
            ],
          ),
        );
      },
    );
  }
}