import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:pediatric_pt/core/constants/constants.dart';

import '../../../core/models/patient_model.dart';

part 'patient_state.dart';

class PatientCubit extends Cubit<PatientState> {
  PatientCubit() : super(PatientInitial());

  // methode for primary adding patient to firebase
  Future<void> addPatientToFirestore({
    required String name,
    required String diagnosis,
    required String userId,
  }) async {
    PatientModel patientModel = PatientModel(
      name: name,
      diagnosis: diagnosis,
      userId: userId,
    );
    try {
      DocumentReference docRef = await FirebaseFirestore.instance
          .collection('patients')
          .add(patientModel.toJson());
      print("Patient added successfully");
      String docId = docRef.id;
      patientModel.patientId = docId;
      await docRef.update({'patientId': docId});
      print("Patient added successfully with ID: $docId");
      emit(SuccessAddPatientToFirebase());
    } catch (e) {
      print("Error adding patient: $e");
      emit(FailedAddPatientToFirebase());
    }
  }

  // methode to get only the patients of the current user
  List<PatientModel> patients = [];

  void getPatients() async {
    patients.clear();
    emit(GetPatientsLoadingState());
    try {
      await FirebaseFirestore.instance
          .collection('patients')
          .where('userId', isEqualTo: Constants.userID)
          .get()
          .then((value) {
        print("Fetched Documents: ${value.docs.length}");
        value.docs.forEach(
          (doc) {
            print("Document Data: ${doc.data()}");
          },
        );
        for (var item in value.docs) {
          patients.add(
            PatientModel.fromJson(
              data: item.data(),
            ),
          );
        }
        emit(GetPatientsDataSuccessState());
      });
    }
    // on FirebaseException
    catch (e) {
      print("Failed to fetch patients: $e");
      patients = [];
      emit(FailedToGetPatientsDataState());
    }
  }

// methods for updating patient data according to assessment section

  // update only personal history
  Future<void> updatePatientPersonalHistory({
    required String patientId,
    required String name,
    required String diagnosis,
    required String patientPicUrl,
    required String address,
    required String sex,
    required String guardingPhone,
    required String normalAge,
    required String correctiveAge,
    required String physician,
  }) async {
    try {
      await FirebaseFirestore.instance
          .collection('patients')
          .doc(patientId)
          .update({
        'name': name,
        'diagnosis': diagnosis,
        'patientPicUrl': patientPicUrl,
        'address': address,
        'guardingPhone': guardingPhone,
        'sex': sex,
        'normalAge': normalAge,
        'correctiveAge': correctiveAge,
        'physician': physician,
        'patientId': patientId,
      });
      print("============= updated patient data");
      emit(successToUpdatePatientDataState()); // Emit success state
    } catch (e) {
      print("============= can't update patient data");
      emit(FailedToUpdatePatientDataState()); // Emit failure state
    }
  }

// update only present history
  Future<void> updatePatientPresentHistory({
    required String patientId,
    required String height,
    required String weight,
    required String headCircumference,
    required String armCircumference,
    required String medication,
  }) async {
    try {
      await FirebaseFirestore.instance
          .collection('patients')
          .doc(patientId)
          .update({
        'height': height,
        'weight': weight,
        'headCircumference': headCircumference,
        'armCircumference': armCircumference,
        'medication': medication,
        'patientId': patientId,
      });
      print("============= updated patient data");
      emit(successToUpdatePatientDataState()); // Emit success state
    } catch (e) {
      print("============= can't update patient data");
      emit(FailedToUpdatePatientDataState()); // Emit failure state
    }
  }
}
