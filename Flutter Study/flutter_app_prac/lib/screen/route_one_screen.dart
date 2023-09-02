// Section 14 : Navigation
// MainLayout 적용
import 'package:flutter/material.dart';
import 'package:flutter_application_prac/layout/main_layout.dart';

class RouteOneScreen extends StatelessWidget {
  const RouteOneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Route One', 
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          }, 
          child: Text('Pop')
        )
      ],
    );
  }
}