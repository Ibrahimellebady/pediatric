import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../controller/cubit/user_cubit/user_cubit.dart';
import '../../../../../../core/shared/clip_path.dart';
import '../../../../../../core/theming/colors.dart';

class QuizScreen extends StatefulWidget {
  final List<Map<String, dynamic>> Quiz;
  final int lecNumber;
  final String lecDescription;
  final String userId;
  final String lecureName;

  const QuizScreen(
      {super.key,
      required this.Quiz,
      required this.lecNumber,
      required this.lecDescription,
      required this.userId,
      required this.lecureName});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _questionIndex = 0;
  int _score = 0;

  void _answerQuestion(String selectedAnswer) {
    if (widget.Quiz[_questionIndex]['correctAnswer'] == selectedAnswer) {
      setState(() {
        _score++;
      });
    }
    setState(() {
      _questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _questionIndex < widget.Quiz.length
          ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipPath(
                  clipper: CustomClipPath(),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    height: 175,
                    width: MediaQuery.of(context).size.width,
                    color: ColorManager.mainColor.withOpacity(0.9),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Lecture ${widget.lecNumber} quiz',
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 24,
                              color: Colors.white),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${widget.lecDescription}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.white.withOpacity(0.75),
                                ),
                              ),
                              Text(
                                'Question ${_questionIndex + 1}/${widget.Quiz.length}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: Colors.white.withOpacity(0.75),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    widget.Quiz[_questionIndex]['question'],
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                ...(widget.Quiz[_questionIndex]['options'] as List<String>)
                    .map((option) {
                  return GestureDetector(
                    onTap: () => _answerQuestion(option),
                    child: Container(
                      margin: const EdgeInsetsDirectional.symmetric(
                          horizontal: 16, vertical: 8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Center(
                        child: Text(
                          option,
                          style: const TextStyle(),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ],
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Quiz Completed!',
                    style: TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Your Score: $_score/${widget.Quiz.length}',
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(
                    'Your Score: ${widget.userId}',
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(
                    'Your Score: ${widget.lecureName}',
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(
                    'Your Score: $_score/${widget.Quiz.length}',
                    style: const TextStyle(fontSize: 20),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Call the method to update the user's quiz score
                      context.read<UserCubit>().updateUserQuizScore(
                            userId: widget.userId,
                            lecureName: widget.lecureName,
                            score: _score,
                          );
                    },
                    child: const Text('Save Score'),
                  ),
                ],
              ),
            ),
    );
  }
}
