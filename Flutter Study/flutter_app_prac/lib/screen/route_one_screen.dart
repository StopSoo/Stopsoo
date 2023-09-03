// Section 14 : Navigation
// MainLayout 적용
// argument 전달 방법 1 : 변수 설정해서 전달 후 받는 페이지에서는 async-await으로 받기
// argument 전달 방법 2 : MaterialPageRoute 안에서 settings 설정하기
import 'package:flutter/material.dart';
import 'package:flutter_application_prac/layout/main_layout.dart';
import 'package:flutter_application_prac/screen/route_two_screen.dart';

class RouteOneScreen extends StatelessWidget {
  final int? number;  // 필수 X

  const RouteOneScreen({
    this.number, 
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Route One', 
      children: [
        // argument 전달 방법 1
        Text(
          'arguments: ${number.toString()}',
          textAlign: TextAlign.center,
        ),
        ElevatedButton(
          // pop으로 argument 전달 시, async-await 적용 (!)
          onPressed: () {
            Navigator.of(context).pop(456);
          }, 
          child: Text('Pop')
        ),
        ElevatedButton(
          onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => RouteTwoScreen(),
                // argument 전달 방법 2
                settings: RouteSettings(
                  arguments: 789,
                )
              ),
            );
          }, 
          child: Text('Push')
        )
      ],
    );
  }
}