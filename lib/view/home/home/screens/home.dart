import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../../../../test.dart';
import '../home_widgets/home_card_widget.dart';
import '../home_widgets/home_welcome_widget.dart';
import 'assessment/screens/patients_list.dart';
import 'athar_course/course_player.dart';

class homeScreen extends StatelessWidget {
  homeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          homeWelcomeWidget(
            name: '',
            imageUrl: 'images/my_pic.jpg',
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
                              imageUrl: 'images/athar.jpg',
                              videoUrl:
                                  // 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
                                  "https://firebasestorage.googleapis.com/v0/b/athar-pediatric.appspot.com/o/lv_0_20240602033101.mp4?alt=media&token=6aad518d-c200-446f-861c-9239e237bd55",
                              lectureNum: 1,
                              description: 'Basics of CP',
                              presenter: 'presenter',
                              fileUrl:
                                  'https://firebasestorage.googleapis.com/v0/b/athar-pediatric.appspot.com/o/Theraputic%20exercises%20for%20pregnant%20woman.pptx?alt=media&token=30879d7c-160b-41d3-ae1f-db69184cf2a3',
                              fileName: "Women health",
                              lectureName: 'One',
                            ),
                          ),
                        );
                      },
                      cardMainText: 'Athar course for pediatric',
                      cardbuttonText: S.of(context).enrolNow,
                      cardImage: "images/athar.jpg",
                      cardDescription: 'Ongoing courses',
                    ),
                    homeCardWidget(
                      cardbuttonFunction: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TestAdd()),
                        );
                      },
                      cardMainText: 'Most common clinical cases',
                      cardbuttonText: S.of(context).learnMore,
                      cardImage: "images/cases.jpeg",
                      cardDescription:
                          'Learn about most common pediatric disorders that you can deal with',
                    ),
                    homeCardWidget(
                      cardbuttonFunction: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PatientList(),
                          ),
                        );
                      },
                      cardMainText: 'Full pediatric assessment',
                      cardbuttonText: S.of(context).startNow,
                      cardImage: "images/history.jpeg",
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

// class homeScreen extends StatelessWidget {
//   homeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final userCubit = BlocProvider.of<UserCubit>(context)..getUsersData();
//
//     return Scaffold(
//       body: BlocBuilder<UserCubit, UserState>(
//         builder: (context, state) {
//           if (state is GetUsersLoadingState) {
//             return Center(child: CircularProgressIndicator());
//           } else if (state is SuccessGetUsersDataState) {
//             final user = state.userModel;
//             return Column(
//               children: [
//                 if (user != null) Text(user.firstName ?? ''),
//                 // Other UI components
//               ],
//             );
//           } else if (state is FailedToGetMyDataState) {
//             return Center(child: Text("Failed to load user data"));
//           } else {
//             return Center(child: Text("No user data available"));
//           }
//         },
//       ),
//     );
//   }
// }
