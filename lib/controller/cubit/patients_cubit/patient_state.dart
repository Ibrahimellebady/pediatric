part of 'patient_cubit.dart';

@immutable
sealed class PatientState {}

final class PatientInitial extends PatientState {}

class SuccessAddPatientToFirebase extends PatientState {}

class FailedAddPatientToFirebase extends PatientState {}

class FailedToGetPatientsDataState extends PatientState {}

class GetPatientsDataSuccessState extends PatientState {}

class GetPatientsLoadingState extends PatientState {}

class FailedToUpdatePatientDataState extends PatientState {}

class successToUpdatePatientDataState extends PatientState {}
