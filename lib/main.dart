import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sample_mvvm/Utils/constant.dart';
import 'package:sample_mvvm/view/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    double screenWidth = window.physicalSize.width;
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: COLOR_WHITE, accentColor: COLOR_DARK_BLUE, textTheme: screenWidth < 500 ? TEXT_THEME_DEFAULT : TEXT_THEME_SMALL),
      home: HomePage(),
    );
  }
}
