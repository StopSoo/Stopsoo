// Section 14 : Navigation
// MainLayout : 공통 레이아웃을 빼내서 따로 파일로 만듬
import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const MainLayout({
    required this.title, 
    required this.children, 
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title)
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: children
        ),
      )
    );
  }
}