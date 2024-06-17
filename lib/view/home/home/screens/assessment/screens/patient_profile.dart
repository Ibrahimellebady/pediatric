import 'package:flutter/material.dart';
import 'package:pediatric_pt/core/models/patient_model.dart';
import 'package:pediatric_pt/view/home/home/screens/assessment/screens/patient_sheet.dart';

class PatientProfile extends StatelessWidget {
  final PatientModel patientModel;

  const PatientProfile({super.key, required this.patientModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: MediaQuery.sizeOf(context).width,
                child: Image.asset(
                  'images/cases.jpeg',
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(patientModel.name!),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return PatientSheet(patientModel: patientModel);
                            },
                          ),
                        );
                      },
                      child: Text(
                        'Edit sheet',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              AssessmentSummary(
                patientModel: patientModel,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CheckAttributeWidget extends StatelessWidget {
  final dynamic value;
  final String result;

  const CheckAttributeWidget({required this.value, required this.result});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: value != null && value != "" && value != false,
      child: Container(
        child: Text(result),
      ),
    );
  }
}

class AssessmentSummary extends StatelessWidget {
  final PatientModel patientModel;

  const AssessmentSummary({Key? key, required this.patientModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Assessment Summary for ${patientModel.name ?? "Unknown"}',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          _generateSummary(patientModel),
        ],
      ),
    );
  }

  Widget _generateSummary(PatientModel patientModel) {
    List<Widget> summaryWidgets = [];

    // Adding checks for each attribute
    summaryWidgets.addAll(
      [
        CheckAttributeWidget(
          value: patientModel.diagnosis,
          result: 'Diagnosis: ${patientModel.diagnosis}',
        ),
        CheckAttributeWidget(
          value: patientModel.isVitaminDeficiency,
          result:
              'Vitamin Deficiency: ${patientModel.vitaminDeficiency ?? "Not specified"}',
        ),
        CheckAttributeWidget(
          value: patientModel.isPregnancyDifficult,
          result:
              'Difficult Pregnancy: ${patientModel.isPregnancyDifficult == true ? "Yes" : "No"}',
        ),
        CheckAttributeWidget(
          value: patientModel.isMotherSurgery,
          result:
              'Mother had Surgery: ${patientModel.motherSurgery ?? "No details provided"}',
        ),
        CheckAttributeWidget(
          value: patientModel.isChildSurgery,
          result:
              'Child Surgery: ${patientModel.childSurgery ?? "No details provided"}',
        ),
        CheckAttributeWidget(
          value: patientModel.isHospitalized,
          result:
              'Hospitalization Cause: ${patientModel.hospitalizationCause ?? "Not specified"}',
        ),
        CheckAttributeWidget(
          value: patientModel.isJaundice,
          result: 'Jaundice: ${patientModel.isJaundice == true ? "Yes" : "No"}',
        ),
        CheckAttributeWidget(
          value: patientModel.isIncubated,
          result:
              'Incubated: ${patientModel.isIncubated == true ? "Yes" : "No"}',
        ),
        CheckAttributeWidget(
          value: patientModel.isDigestiveProblem,
          result:
              'Digestive Problems: ${patientModel.isDigestiveProblem == true ? "Yes" : "No"}',
        ),
        CheckAttributeWidget(
          value: patientModel.isStomachPain,
          result:
              'Stomach Pain: ${patientModel.isStomachPain == true ? "Yes" : "No"}',
        ),
        CheckAttributeWidget(
          value: patientModel.isDiarrhea,
          result: 'Diarrhea: ${patientModel.isDiarrhea == true ? "Yes" : "No"}',
        ),
        CheckAttributeWidget(
          value: patientModel.isConstipation,
          result:
              'Constipation: ${patientModel.isConstipation == true ? "Yes" : "No"}',
        ),
        CheckAttributeWidget(
          value: patientModel.isSwallowingProblem,
          result:
              'Swallowing Problems: ${patientModel.isSwallowingProblem == true ? "Yes" : "No"}',
        ),
        CheckAttributeWidget(
          value: patientModel.isVomitingProblem,
          result:
              'Vomiting Problems: ${patientModel.isVomitingProblem == true ? "Yes" : "No"}',
        ),
        CheckAttributeWidget(
          value: patientModel.isRespiratoryProblem,
          result:
              'Respiratory Problems: ${patientModel.respiratoryProblemDetails ?? "No details provided"}',
        ),
        CheckAttributeWidget(
          value: patientModel.isBloodProblem,
          result:
              'Blood Problems: ${patientModel.bloodProblemDetails ?? "No details provided"}',
        ),
        CheckAttributeWidget(
          value: patientModel.isKidneyProblem,
          result:
              'Kidney Problems: ${patientModel.kidneyProblemDetails ?? "No details provided"}',
        ),
        CheckAttributeWidget(
          value: patientModel.isLiverProblem,
          result:
              'Liver Problems: ${patientModel.liverProblemDetails ?? "No details provided"}',
        ),
        CheckAttributeWidget(
          value: patientModel.isMetabolicProblem,
          result:
              'Metabolic Problems: ${patientModel.metabolicProblemDetails ?? "No details provided"}',
        ),
        CheckAttributeWidget(
          value: patientModel.isCardiacProblem,
          result:
              'Cardiac Problems: ${patientModel.cardiacProblemDetails ?? "No details provided"}',
        ),
        CheckAttributeWidget(
          value: patientModel.height,
          result: 'Height: ${patientModel.height ?? "Unknown"}',
        ),
        CheckAttributeWidget(
          value: patientModel.weight,
          result: 'Weight: ${patientModel.weight ?? "Unknown"}',
        ),
        CheckAttributeWidget(
          value: patientModel.headCircumference,
          result:
              'Head Circumference: ${patientModel.headCircumference ?? "Unknown"}',
        ),
        CheckAttributeWidget(
          value: patientModel.armCircumference,
          result:
              'Arm Circumference: ${patientModel.armCircumference ?? "Unknown"}',
        ),
        CheckAttributeWidget(
          value: patientModel.medication,
          result: 'Medication: ${patientModel.medication ?? "Not specified"}',
        ),
        CheckAttributeWidget(
          value: patientModel.isInvoluntaryMovement,
          result:
              'Involuntary Movements: ${patientModel.involuntaryMovementType ?? "No details provided"}',
        ),
        CheckAttributeWidget(
          value: patientModel.isEpileptic,
          result:
              'Epileptic: ${patientModel.isEpileptic == true ? "Yes" : "No"}',
        ),
        CheckAttributeWidget(
          value: patientModel.isOrthosis,
          result: 'Orthosis: ${patientModel.orthosisType ?? "Not specified"}',
        ),
        CheckAttributeWidget(
          value: patientModel.isCerebralPalsy,
          result:
              'Cerebral Palsy: ${patientModel.cerebralPalsyType ?? "Not specified"}',
        ),
        CheckAttributeWidget(
          value: patientModel.isBrachialInjury,
          result:
              'Brachial Plexus Injury: ${patientModel.brachialPlexusType ?? "Not specified"}',
        ),
        CheckAttributeWidget(
          value: patientModel.isSpinaBifida,
          result:
              'Spina Bifida: ${patientModel.spinaBifidaType ?? "Not specified"}',
        ),
        CheckAttributeWidget(
          value: patientModel.isMyopathy,
          result: 'Myopathy: ${patientModel.myopathyType ?? "Not specified"}',
        ),
        CheckAttributeWidget(
          value: patientModel.isNeuropathy,
          result:
              'Neuropathy: ${patientModel.isNeuropathy == true ? "Yes" : "No"}',
        ),
        CheckAttributeWidget(
          value: patientModel.isDownSyndrome,
          result:
              'Down Syndrome: ${patientModel.isDownSyndrome == true ? "Yes" : "No"}',
        ),
        CheckAttributeWidget(
          value: patientModel.isHydrocephalus,
          result:
              'Hydrocephalus: ${patientModel.isHydrocephalus == true ? "Yes" : "No"}',
        ),
        CheckAttributeWidget(
          value: patientModel.isMicrocephalus,
          result:
              'Microcephalus: ${patientModel.isMicrocephalus == true ? "Yes" : "No"}',
        ),
        CheckAttributeWidget(
          value: patientModel.isMeningitis,
          result:
              'Meningitis: ${patientModel.isMeningitis == true ? "Yes" : "No"}',
        ),
        CheckAttributeWidget(
          value: patientModel.isTorticollis,
          result:
              'Torticollis: ${patientModel.isTorticollis == true ? "Yes" : "No"}',
        ),
        CheckAttributeWidget(
          value: patientModel.isFascialPalsy,
          result:
              'Fascial Palsy: ${patientModel.isFascialPalsy == true ? "Yes" : "No"}',
        ),
        CheckAttributeWidget(
          value: patientModel.isAmputee,
          result:
              'Amputee: ${patientModel.amputatedLimbs ?? "No details provided"}',
        ),
        CheckAttributeWidget(
            value: patientModel.isDDH,
            result:
                'Developmental Dysplasia of the Hip: ${patientModel.isDDH == true ? "Yes" : "No"}')
        // More checks...
      ],
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: summaryWidgets,
    );
  }
}
