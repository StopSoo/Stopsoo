import 'package:flutter/material.dart';
import 'package:flutter_application_prac/prac/test.dart';
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
      debugShowCheckedModeBanner: false,
      home: HomeScreenS8(),
    )
  );
}
