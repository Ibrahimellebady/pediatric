import 'package:flutter/cupertino.dart';
import 'package:pediatric_pt/view/home/home/screens/athar_course/quiz/quiz.dart';
import 'package:pediatric_pt/view/home/navigation_bar.dart';

import 'auth/login.dart';
import 'auth/signup.dart';
import 'view/home/settings/screens/acount_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoute.login: (context) => const Login(),
  AppRoute.signUp: (context) => const SignUp(),
  AppRoute.homepage: (context) => const navigationBar(),
  AppRoute.Account: (context) => const AccountScreen(),
  AppRoute.quizScreen: (context) => const QuizScreen(),
};

//
class AppRoute {
  static const String login = "/login";

  static const String signUp = "/signUp";

  static const String homepage = "homepage";

  static const String Account = "Account";
  static const String quizScreen = "QuizScreen";
}
