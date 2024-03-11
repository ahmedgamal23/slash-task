import 'package:flutter/material.dart';
import 'package:slash_internship_task/core/constant/app_color.dart';
import 'package:slash_internship_task/main_content/presentation/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: AppColor.primaryColor,
      ),
      home: const HomePage(),
    );
  }
}

