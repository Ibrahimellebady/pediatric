

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../controller/cubit/patients_cubit/patient_cubit.dart';
import '../../../../../../../core/models/patient_model.dart';
import '../../../../../../../core/shared/gender_card_widget.dart';
import '../../../../../settings/screens/edit_account_screen.dart';
import '../update_patient_sheet_widget.dart';

class PatientPersonalHistoryWidget extends StatefulWidget {
  final PatientModel patientModel;
  final VoidCallback onNextPressed;
  final VoidCallback onPreviousPressed;

  PatientPersonalHistoryWidget(
      {super.key,
        required this.patientModel,
        required this.onNextPressed,
        required this.onPreviousPressed});

  @override
  State<PatientPersonalHistoryWidget> createState() =>
      _PatientPersonalHistoryWidgetState();
}

class _PatientPersonalHistoryWidgetState
    extends State<PatientPersonalHistoryWidget> {
  String? sex;

  final TextEditingController name = TextEditingController();

  final TextEditingController diagnosis = TextEditingController();

  final TextEditingController patientPicUrl = TextEditingController();

  final TextEditingController address = TextEditingController();

  final TextEditingController guardingPhone = TextEditingController();

  final TextEditingController normalAge = TextEditingController();

  final TextEditingController correctiveAge = TextEditingController();

  final TextEditingController physician = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.patientModel.sex != null) {
      sex = widget.patientModel.sex!;
    } else {
      sex = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PatientCubit, PatientState>(
      listener: (context, state) {},
      builder: (context, state) {
        String patientID = widget.patientModel.patientId!;
        name.text = widget.patientModel.name ?? "";
        diagnosis.text = widget.patientModel.diagnosis ?? "";
        patientPicUrl.text = widget.patientModel.patientPicUrl ?? "";
        address.text = widget.patientModel.address ?? "";
        guardingPhone.text = widget.patientModel.guardingPhone ?? "";
        normalAge.text = widget.patientModel.normalAge ?? "";
        correctiveAge.text = widget.patientModel.correctiveAge ?? "";
        physician.text = widget.patientModel.physician ?? "";
        return SingleChildScrollView(
          child: Column(
            children: [
              textField(
                fieldWidth: MediaQuery.of(context).size.width,
                fieldName: "name",
                controller: name,
              ),
              textField(
                fieldWidth: MediaQuery.of(context).size.width,
                fieldName: "diagnosis",
                controller: diagnosis,
              ),
              Text("${widget.patientModel.diagnosis}"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.all(8),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          sex = "Male";
                        });
                      },
                      child: genderCardWidget(
                        gender: sex!,
                        Sex: 'Male',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(8),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          sex = "Female";
                        });
                      },
                      child: genderCardWidget(
                        gender: sex!,
                        Sex: 'Female',
                      ),
                    ),
                  ),
                ],
              ),
              textField(
                fieldWidth: MediaQuery.of(context).size.width,
                fieldName: "address",
                controller: address,
              ),
              textField(
                fieldWidth: MediaQuery.of(context).size.width,
                fieldName: "Guarding Phone",
                controller: guardingPhone,
              ),
              textField(
                fieldWidth: MediaQuery.of(context).size.width,
                fieldName: "normal Age",
                controller: normalAge,
              ),
              textField(
                fieldWidth: MediaQuery.of(context).size.width,
                fieldName: "corrective Age",
                controller: correctiveAge,
              ),
              textField(
                fieldWidth: MediaQuery.of(context).size.width,
                fieldName: "physician",
                controller: physician,
              ),
              // patientID
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // PreviousPageButtonWidget(widget: widget),
                  GestureDetector(
                      onTap: () {
                        context
                            .read<PatientCubit>()
                            .updatePatientPersonalHistory(
                            patientId: patientID,
                            name: name.text,
                            diagnosis: diagnosis.text,
                            patientPicUrl: patientPicUrl.text,
                            address: address.text,
                            sex: sex ?? "",
                            guardingPhone: guardingPhone.text,
                            normalAge: normalAge.text,
                            correctiveAge: correctiveAge.text,
                            physician: physician.text);
                        widget.onNextPressed();
                        print('clicked');
                      },
                      child: UpdatePatientSheetWidget()),
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
