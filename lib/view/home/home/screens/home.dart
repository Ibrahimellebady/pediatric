import 'package:flutter/material.dart';
import 'package:pediatric_pt/view/home/home/screens/athar_course/course_player.dart';

import '../../../../generated/l10n.dart';
import '../home_widgets/home_card_widget.dart';
import '../home_widgets/home_welcome_widget.dart';

class homeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          homeWelcomeWidget(
            name: 'Ibrahim',
            imageUrl: 'images/4.png',
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(
                    bottom: 16, left: 16, right: 16, top: 6),
                child: Column(
                  children: [
                    homeCardWidget(
                      cardbuttonFunction: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const coursePlayer(
                              imageUrl: 'images/3.png',
                              videoUrl:
                                  'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
                              lectureNum: 1,
                              description: 'Basics of CP',
                              presenter: 'presenter',
                              fileUrl: 'women file',
                              fileName:
                                  "https://firebasestorage.googleapis.com/v0/b/athar-pediatric.appspot.com/o/Theraputic%20exercises%20for%20pregnant%20woman.pptx?alt=media&token=30879d7c-160b-41d3-ae1f-db69184cf2a3",
                            ),
                          ),
                        );
                      },
                      cardMainText: 'Athar course for pediatric',
                      cardbuttonText: S.of(context).enrolNow,
                      cardImage: "images/1.png",
                      cardDescription: 'Ongoing courses',
                    ),
                    homeCardWidget(
                      cardbuttonFunction: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => coursePlayer(
                        //       imageUrl: 'images/3.png',
                        //       videoUrl:
                        //           'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
                        //       lectureNum: 1,
                        //       description: 'Basics of CP',
                        //       presenter: 'presenter',
                        //     ),
                        //   ),
                        // );
                      },
                      cardMainText: 'Most common clinical cases',
                      cardbuttonText: S.of(context).learnMore,
                      cardImage: "images/1.png",
                      cardDescription:
                          'Learn about most common pediatric disorders that you can deal with',
                    ),
                    homeCardWidget(
                      cardbuttonFunction: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => coursePlayer(
                        //       imageUrl: 'images/3.png',
                        //       videoUrl:
                        //           'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
                        //       lectureNum: 1,
                        //       description: 'Basics of CP',
                        //       presenter: 'presenter',
                        //     ),
                        //   ),
                        // );
                      },
                      cardMainText: 'Full pediatric assessment',
                      cardbuttonText: S.of(context).startNow,
                      cardImage: "images/1.png",
                      cardDescription:
                          'Record and keep your patients data in a good way',
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

// S.of(context).learnMore,
