import 'package:flutter/material.dart';

import '../../../../../../core/theming/colors.dart';
import '../course_player.dart';

class lectureCardWidget extends StatelessWidget {
  final String imageUrl;
  final String videoUrl;
  final int lectureNum;
  final String lectureName;
  final String description;
  final String presenter;
  final String fileUrl;
  final String fileName;

  const lectureCardWidget(
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
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => coursePlayer(
                    imageUrl: imageUrl,
                    videoUrl: videoUrl,
                    lectureNum: lectureNum,
                    description: description,
                    presenter: presenter,
                    fileUrl: fileUrl,
                    fileName: fileName,
                    lectureName: lectureName,
                  )),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12, right: 16, left: 16),
        height: 80,
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 80, width: 100, child: Image.asset(imageUrl)),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lecture $lectureNum',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: ColorManager.mainColor.withOpacity(0.9),
                        ),
                      ),
                      Text(
                        description,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withOpacity(0.55),
                            fontStyle: FontStyle.italic),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 8, right: 16),
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: ColorManager.mainColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
