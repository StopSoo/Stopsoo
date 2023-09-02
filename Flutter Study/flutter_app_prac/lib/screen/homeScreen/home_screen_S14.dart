// Section 14 : Navigation
// MainLayout 적용
import 'package:flutter/material.dart';
import 'package:flutter_application_prac/layout/main_layout.dart';
import 'package:flutter_application_prac/screen/route_one_screen.dart';

class HomeScreenS14 extends StatelessWidget {
  const HomeScreenS14({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Home Screen', 
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => RouteOneScreen(),
              )
            );
          }, 
          child: Text('Push')
        )
      ],
    );
  }
}