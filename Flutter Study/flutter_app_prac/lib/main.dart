import 'package:flutter/material.dart';

void main() {
  // runApp 플러터의 진입 포인트
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,  // debug banner 제거
      home: HomeScreen(),
    ),
  );
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // color picker를 통한 hex 코드 검색 가능
      backgroundColor: Color(0xFFF99231),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'asset/img/logo.png',
          ),
          CircularProgressIndicator(
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
