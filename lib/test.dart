import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pediatric_pt/core/theming/colors.dart';

import 'controller/cubit/course_cubit/course_cubit.dart';

class TestAdd extends StatelessWidget {
  const TestAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CourseCubit, CourseState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    BlocProvider.of<CourseCubit>(context)
                        .addVideoDataToFireStore(
                      lectureName: "lectureName",
                      lectureDescription: "lectureDescription",
                      presenter: "presenter",
                      lectureNum: 10,
                    );
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => CourseListScreen()),
                    // );
                  },
                  child: Container(
                    color: ColorManager.mainColor,
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "Add video to course",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                if (state is GetCourseLoadingState) CircularProgressIndicator(),
              ],
            ),
          );
        },
      ),
    );
  }
}

// class CourseListScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocProvider(
//         create: (context) => CourseCubit()..getCourseVideos(),
//         child: BlocConsumer<CourseCubit, CourseState>(
//           listener: (context, state) {
//             if (state is FailedToGetCourseDataState) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(content: Text('Failed to fetch courses')),
//               );
//             }
//           },
//           builder: (context, state) {
//             if (state is GetCourseLoadingState) {
//               return Center(child: CircularProgressIndicator());
//             } else if (state is GetCourseDataSuccessState) {
//               var courses = context.read<CourseCubit>().courseVideos;
//               return ListView.builder(
//                 itemCount: courses.length,
//                 itemBuilder: (context, index) {
//                   var course = courses[index];
//                   return ListTile(
//                     title: Text(course.lectureName ?? 'No Title'),
//                     subtitle:
//                         Text(course.lectureDescription ?? 'No Description'),
//                   );
//                 },
//               );
//             } else {
//               return Center(child: Text('No courses available'));
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
