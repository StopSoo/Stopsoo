import 'package:flutter/material.dart';
import 'package:flutter_application_prac/prac/test.dart';
import 'package:flutter_application_prac/screen/home_screen_S5.dart';
import 'package:flutter_application_prac/screen/home_screen_S6.dart';

void main() {
  // runApp 플러터의 진입 포인트
  runApp(
    // Widget - 클래스의 일종
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreenS6(),
    )
  );
}
