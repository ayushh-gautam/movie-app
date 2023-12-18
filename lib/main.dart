import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movie_app/utils/constants.dart';
import 'package:movie_app/screens/Home/home_page.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 957),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          theme: ThemeData(
              appBarTheme: const AppBarTheme(backgroundColor: kBackgroundcolor),
              scaffoldBackgroundColor: kBackgroundcolor),
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          home: const HomePage(),
        );
      },
    );
  }
}
