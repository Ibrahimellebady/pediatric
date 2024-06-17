import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pediatric_pt/core/theming/colors.dart';
import 'package:pediatric_pt/view/home/home/screens/assessment/screens/patient_profile.dart';

import '../../../../../../controller/cubit/patients_cubit/patient_cubit.dart';
import '../widgets/add_patient_bottom_sheet.dart';
import '../widgets/patient_card_widget.dart';

class PatientList extends StatefulWidget {
  const PatientList({Key? key}) : super(key: key);

  @override
  State<PatientList> createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
  final TextEditingController surgery = TextEditingController();
  bool? isSurgery;

  @override
  Widget build(BuildContext context) {
    final patientCubit = BlocProvider.of<PatientCubit>(context)..getPatients();
    return BlocConsumer<PatientCubit, PatientState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: ColorManager.mainColor.withOpacity(0.9),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (context) => AddPatientBottomSheet(),
              );
            },
            child: Icon(
              Icons.add,
              size: 32,
              color: Colors.white,
            ),
          ),
          body: State is GetPatientsLoadingState
              ? const Center(child: CircularProgressIndicator())
              : patientCubit.patients.isNotEmpty
                  ? SafeArea(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: SearchBar(
                              leading: Icon(Icons.search_outlined),
                            ),
                          ),
                          Flexible(
                            child: GridView.builder(
                              itemCount: patientCubit.patients.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return PatientProfile(
                                            patientModel:
                                                patientCubit.patients[index],
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  child: PatientCardWidget(
                                    name:
                                        "${patientCubit.patients[index].name ?? ""}",
                                    diagnosis:
                                        "${patientCubit.patients[index].diagnosis ?? ""}",
                                    patientPicUrl:
                                        "${patientCubit.patients[index].patientPicUrl ?? "images/cases.jpeg"}",
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(
                      child: Center(
                        child: Text("No patients yet"),
                      ),
                    ),
        );
      },
    );
  }
}

// boolenQuestion(
// onChanged: (bool? value) {
// isSurgery = value;
// },
// question: 'Did child or mother have surgery?',
// fieldController: surgery,
// fieldName: 'Surgery',
// )
