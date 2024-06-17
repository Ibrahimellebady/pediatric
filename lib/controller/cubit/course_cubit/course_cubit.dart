import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/models/video_model.dart';

part 'course_state.dart';

class CourseCubit extends Cubit<CourseState> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  CourseCubit() : super(CourseInitial());

  VideoModel? videoModel;

  // add video to firebase [admin UI]
  Future<void> addVideoDataToFireStore(
      {required String lectureName,
      required String lectureDescription,
      required String presenter,
      required int lectureNum}) async {
    VideoModel videoModel = VideoModel(
      lectureName: lectureName,
      lectureDescription: lectureDescription,
      presenter: presenter,
      lectureNum: lectureNum,
    );

    try {
      await FirebaseFirestore.instance
          .collection('course')
          .doc()
          .set(videoModel.toJson());
      emit(SaveVideoDataOnFirestoreSuccessState());
    } on FirebaseException catch (e) {
      print("Error adding video: $e");
      emit(FailedToSaveVideoDataOnFirestoreState());
    }
  }

  // get videos of the course
  List<VideoModel> courseVideos = [];

  Future<void> getCourseVideos() async {
    courseVideos.clear();
    emit(GetCourseLoadingState());
    try {
      var snapshot = await FirebaseFirestore.instance
          .collection('course')
          .orderBy('lectureNum')
          .get();
      for (var item in snapshot.docs) {
        courseVideos.add(VideoModel.fromJson(item.data()));
      }
      emit(GetCourseDataSuccessState());
    } catch (e) {
      print("Error fetching course videos: $e");
      courseVideos = [];
      emit(FailedToGetCourseDataState());
    }
  }
}

// // get list of videos of the course
// Future<void> getCourseData() async {
//   try {
//     var doc =
//         await FirebaseFirestore.instance.collection('course').doc().get();
//     if (doc.exists) {
//       videoModel = VideoModel.fromJson(doc.data()!);
//       emit(SuccessGetCourseDataState(videoModel));
//     } else {
//       emit(FailedToGetCourseDataState());
//     }
//   } catch (e) {
//     print("Error fetching course data: $e");
//     emit(FailedToGetCourseDataState());
//   }
// }
