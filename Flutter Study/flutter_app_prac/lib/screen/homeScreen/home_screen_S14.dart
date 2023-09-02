// Section 14 : Navigation
import 'package:flutter/material.dart';
import 'package:flutter_application_prac/screen/route_one_screen.dart';

class HomeScreenS14 extends StatelessWidget {
  const HomeScreenS14({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen')
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
        ),
      )
    );
  }
}