import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'common/routes/routes.dart';
import 'common/utils/constants.dart';

void main() {
  runApp(const ProviderScope(child: TodoApp()));
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    // flutter screen responsiveness
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(375, 825),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Dev.Scientist',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              scaffoldBackgroundColor: AppConst.kBkDark,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.black45),
              useMaterial3: true),
          initialRoute: homeRoute,
          themeMode: ThemeMode.dark,
          routes: routes,
        );
      },
    );
  }
}
