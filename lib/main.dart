import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'common/routes/routes.dart';
import 'common/utils/constants.dart';
import 'package:dynamic_color/dynamic_color.dart';

void main() {
  runApp(const ProviderScope(child: TodoApp()));
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  static final defaultLightColorScheme =
      ColorScheme.fromSwatch(primarySwatch: Colors.blue);
  static final defaultDarkColorScheme = ColorScheme.fromSwatch(
      brightness: Brightness.dark, primarySwatch: Colors.blue);
  @override
  Widget build(BuildContext context) {
    // flutter screen responsiveness
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(375, 825),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return DynamicColorBuilder(
            builder: (lightColorScheme, darkColorScheme) {
          return MaterialApp(
            title: 'Dev.Scientist',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                scaffoldBackgroundColor: AppConst.kBkDark,
                colorScheme: lightColorScheme ?? defaultLightColorScheme,
                useMaterial3: true),
            darkTheme: ThemeData(
              scaffoldBackgroundColor: AppConst.kBkDark,
                colorScheme: darkColorScheme ?? defaultDarkColorScheme,
                useMaterial3: true),
            themeMode: ThemeMode.dark,
            initialRoute: homeRoute,
            routes: routes,
          );
        });
      },
    );
  }
}
