import 'package:firebase_auth/firebase_auth.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pediatric_pt/view/home/home/screens/athar_course/quiz/quiz.dart';
import 'package:pediatric_pt/view/home/home/screens/athar_course/widgets/course_button_widget.dart';
import 'package:video_player/video_player.dart';

import '../../../../../controller/cubit/course_cubit/course_cubit.dart';
import '../../../../../controller/features/download_file_function.dart';
import '../../../../../core/constants/quiz_manager.dart';
import '../../../../../core/shared/clip_path.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../generated/l10n.dart';
import 'widgets/lecture_card_widget.dart';
import 'widgets/video_details_widget.dart';

class coursePlayer extends StatefulWidget {
  final String imageUrl;
  final String videoUrl;
  final String fileUrl;
  final String fileName;
  final String lectureName;
  final int lectureNum;
  final String description;
  final String presenter;

  const coursePlayer(
      {super.key,
      required this.imageUrl,
      required this.videoUrl,
      required this.lectureNum,
      required this.description,
      required this.presenter,
      required this.fileUrl,
      required this.fileName,
      required this.lectureName});

  @override
  State<coursePlayer> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<coursePlayer> {
  late FlickManager flickManager;

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.networkUrl(
        Uri.parse(widget.videoUrl),
      ),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> getQuizData(int lectureNum) {
    switch (lectureNum) {
      case 1:
        return LecOneQuiz;
      case 2:
        return LecTwoQuiz;
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => CourseCubit()..getCourseVideos(),
          child: BlocConsumer<CourseCubit, CourseState>(
            listener: (context, state) {
              if (state is FailedToGetCourseDataState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Failed to fetch courses'),
                  ),
                );
              }
            },
            builder: (context, state) {
              var courses = context.read<CourseCubit>().courseVideos;
              return Column(
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: FlickVideoPlayer(
                      flickManager: flickManager,
                    ),
                  ),
                  Stack(
                    children: [
                      ClipPath(
                        clipper: CustomClipPath(),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          color: ColorManager.mainColor.withOpacity(0.9),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              videoDetailsWidget(widget: widget),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  courseButtonWidget(
                                    buttonText: S.of(context).downloadPdf,
                                    buttonOnTap: () async {
                                      await downloadFile(context,
                                          widget.fileUrl, widget.fileName);
                                    },
                                  ),
                                  courseButtonWidget(
                                    buttonText: S.of(context).quiz,
                                    buttonOnTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => QuizScreen(
                                            Quiz:
                                                getQuizData(widget.lectureNum),
                                            lecNumber: widget.lectureNum,
                                            lecDescription: widget.description,
                                            userId: FirebaseAuth
                                                .instance.currentUser!.uid,
                                            lecureName: widget.lectureName,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 8,
                        left: 16,
                        child: Text(
                          S.of(context).coursePlaylist,
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 24,
                            color: ColorManager.mainColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: courses.length,
                      itemBuilder: (context, index) {
                        var course = courses[index];
                        return lectureCardWidget(
                          imageUrl: course.imageUrl ?? 'No Title',
                          videoUrl: course.videoUrl ?? 'No Title',
                          fileUrl: course.fileUrl ?? 'No Title',
                          lectureNum: course.lectureNum ?? 0,
                          fileName: course.fileName ?? 'No Title',
                          description: course.lectureDescription ?? 'No Title',
                          presenter: course.presenter ?? 'No Title',
                          lectureName: course.lectureName ?? 'One',
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
