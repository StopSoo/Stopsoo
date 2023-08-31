import 'package:flutter/material.dart';
import 'package:flutter_application_prac/prac/test.dart';
import 'package:flutter_application_prac/screen/home_screen_S10.dart';
import 'package:flutter_application_prac/screen/home_screen_S11.dart';
import 'package:flutter_application_prac/screen/home_screen_S5.dart';
import 'package:flutter_application_prac/screen/home_screen_S6.dart';
import 'package:flutter_application_prac/screen/home_screen_S7.dart';
import 'package:flutter_application_prac/screen/home_screen_S8.dart';

void main() {
  // Flutter가 앱을 실행할 준비가 될 때까지 기다린다.
  WidgetsFlutterBinding.ensureInitialized();

  // runApp 플러터의 진입 포인트
  runApp(
    // Widget - 클래스의 일종
    MaterialApp(
      theme: ThemeData(
        // Section 10 : 기본 font 설정
        fontFamily: 'sunflower',
        // Section 10 : 테마 적용해보기
        textTheme: TextTheme(
          headline1: TextStyle(
            color: Colors.white,
            fontFamily: 'parisienne',
            fontSize: 80.0
          ),
          headline2: TextStyle(
            color: Colors.white,
            fontSize: 50.0,
            fontWeight: FontWeight.w700
          ),
          bodyText1: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
          ),
          bodyText2: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          )
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreenS11(),
    ),
  );
}
