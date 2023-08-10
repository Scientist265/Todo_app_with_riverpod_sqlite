import 'package:flutter/material.dart';
import 'package:todo_app_withapi/features/auth/pages/test_page.dart';
import 'package:todo_app_withapi/features/onboarding/pages/onboarding.dart';
import 'package:todo_app_withapi/features/todo/pages/home_page.dart';
import 'package:todo_app_withapi/main.dart';

Map<String, Widget Function(BuildContext context)> routes = {
  homeRoute: (context) => const HomePage(),
  todoRoute: (context) => const TodoApp(),
  onboardingRoute: (context) => const OnBoarding(),
  testPage: (context) => TestPage()
};

String homeRoute = '/home_page';
String todoRoute = '/tode_page';
String onboardingRoute = '/onboarding';
String testPage = '/test';
