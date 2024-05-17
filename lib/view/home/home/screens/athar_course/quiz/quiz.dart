import 'package:flutter/material.dart';

import '../../../../../../core/shared/clip_path.dart';
import '../../../../../../core/theming/colors.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _questionIndex = 0;
  int _score = 0;

  void _answerQuestion(String selectedAnswer) {
    if (_questions[_questionIndex]['correctAnswer'] == selectedAnswer) {
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
      body: _questionIndex < _questions.length
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
                        const Text(
                          'Lecture 1 Quiz',
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
                                'Basic of CP',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.white.withOpacity(0.75),
                                ),
                              ),
                              Text(
                                'Question ${_questionIndex + 1}/${_questions.length}',
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
                    _questions[_questionIndex]['question'],
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                ...(_questions[_questionIndex]['options'] as List<String>)
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
                    'Your Score: $_score/${_questions.length}',
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
    );
  }
}

final List<Map<String, dynamic>> _questions = [
  {
    'question': 'What is the capital of France?',
    'options': ['Paris', 'London', 'Berlin', 'Rome'],
    'correctAnswer': 'Paris',
  },
  {
    'question': 'What is the capital of Italy?',
    'options': ['Paris', 'London', 'Berlin', 'Rome'],
    'correctAnswer': 'Rome',
  },
  {
    'question': 'What is the capital of England?',
    'options': ['Paris', 'London', 'Berlin', 'Rome'],
    'correctAnswer': 'London',
  },
  {
    'question': 'is London the capital of England?',
    'options': ['True', 'False'],
    'correctAnswer': 'True',
  },
];
