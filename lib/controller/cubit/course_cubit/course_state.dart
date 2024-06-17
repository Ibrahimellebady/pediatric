part of 'course_cubit.dart';

@immutable
sealed class CourseState {}

final class CourseInitial extends CourseState {}

// Add to firtestore
final class SaveVideoDataOnFirestoreSuccessState extends CourseState {}

final class FailedToSaveVideoDataOnFirestoreState extends CourseState {}

final class GetCourseLoadingState extends CourseState {}

final class GetCourseDataSuccessState extends CourseState {}

final class FailedToGetCourseDataState extends CourseState {}

class SuccessGetCourseDataState extends CourseState {
  final VideoModel? videoModel;

  SuccessGetCourseDataState(this.videoModel);
}
