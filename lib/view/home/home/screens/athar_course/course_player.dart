import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:pediatric_pt/routes.dart';
import 'package:pediatric_pt/view/home/home/screens/athar_course/widgets/course_button_widget.dart';
import 'package:video_player/video_player.dart';

import '../../../../../controller/features/download_file_function.dart';
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
      required this.fileName});

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

  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          courseButtonWidget(
                            buttonText: S.of(context).downloadPdf,
                            buttonOnTap: () async {
                              await downloadFile(
                                  context, widget.fileUrl, widget.fileName);
                            },
                          ),
                          courseButtonWidget(
                            buttonText: S.of(context).quiz,
                            buttonOnTap: () {
                              Navigator.pushNamed(context, AppRoute.quizScreen);
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
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: const Column(
                  children: [
                    lectureCardWidget(
                      imageUrl: 'images/3.png',
                      videoUrl:
                          "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
                      lectureNum: 1,
                      description: 'Basics of CP',
                      presenter: 'mohamed',
                      fileUrl:
                          "https://firebasestorage.googleapis.com/v0/b/athar-pediatric.appspot.com/o/Theraputic%20exercises%20for%20pregnant%20woman.pptx?alt=media&token=30879d7c-160b-41d3-ae1f-db69184cf2a3",
                      fileName: 'Theraputic_exercises_for_pregnant_woman.pptx',
                    ),
                    lectureCardWidget(
                      imageUrl: 'images/2.png',
                      videoUrl:
                          "https://storage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
                      lectureNum: 2,
                      description: 'Diagnosis of CP',
                      presenter: 'ahmed',
                      fileUrl:
                          "https://firebasestorage.googleapis.com/v0/b/athar-pediatric.appspot.com/o/Theraputic%20exercises%20for%20pregnant%20woman.pptx?alt=media&token=30879d7c-160b-41d3-ae1f-db69184cf2a3",
                      fileName: 'pla pla.pptx',
                    ),
                    lectureCardWidget(
                      imageUrl: 'images/3.png',
                      videoUrl:
                          "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
                      lectureNum: 1,
                      description: 'Basics of CP',
                      presenter: 'mohamed',
                      fileUrl:
                          "https://firebasestorage.googleapis.com/v0/b/athar-pediatric.appspot.com/o/Theraputic%20exercises%20for%20pregnant%20woman.pptx?alt=media&token=30879d7c-160b-41d3-ae1f-db69184cf2a3",
                      fileName: 'Theraputic_exercises_for_pregnant_woman.pptx',
                    ),
                    lectureCardWidget(
                      imageUrl: 'images/2.png',
                      videoUrl:
                          "https://storage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
                      lectureNum: 2,
                      description: 'Diagnosis of CP',
                      presenter: 'ahmed',
                      fileUrl:
                          "https://firebasestorage.googleapis.com/v0/b/athar-pediatric.appspot.com/o/Theraputic%20exercises%20for%20pregnant%20woman.pptx?alt=media&token=30879d7c-160b-41d3-ae1f-db69184cf2a3",
                      fileName: 'pla pla.pptx',
                    ),
                    lectureCardWidget(
                      imageUrl: 'images/3.png',
                      videoUrl:
                          "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
                      lectureNum: 1,
                      description: 'Basics of CP',
                      presenter: 'mohamed',
                      fileUrl:
                          "https://firebasestorage.googleapis.com/v0/b/athar-pediatric.appspot.com/o/Theraputic%20exercises%20for%20pregnant%20woman.pptx?alt=media&token=30879d7c-160b-41d3-ae1f-db69184cf2a3",
                      fileName: 'Theraputic_exercises_for_pregnant_woman.pptx',
                    ),
                    lectureCardWidget(
                      imageUrl: 'images/2.png',
                      videoUrl:
                          "https://storage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
                      lectureNum: 2,
                      description: 'Diagnosis of CP',
                      presenter: 'ahmed',
                      fileUrl:
                          "https://firebasestorage.googleapis.com/v0/b/athar-pediatric.appspot.com/o/Theraputic%20exercises%20for%20pregnant%20woman.pptx?alt=media&token=30879d7c-160b-41d3-ae1f-db69184cf2a3",
                      fileName: 'pla pla.pptx',
                    ),
                    SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
