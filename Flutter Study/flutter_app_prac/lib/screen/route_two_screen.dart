// Section 14 : Navigation
import 'package:flutter/material.dart';
import 'package:flutter_application_prac/layout/main_layout.dart';
import 'package:flutter_application_prac/screen/route_three_screen.dart';

class RouteTwoScreen extends StatelessWidget {
  const RouteTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ModalRoute : 자신과 가장 가까운 full screen
    //              여기서는 RouteTwoScreen을 말한다.
    // !를 붙이는 이유 : ModalRoute.of(context)에서 arguments를 가져올 게 확실하기 때문
    final arguments = ModalRoute.of(context)!.settings.arguments;

    return MainLayout(
      title: 'Route Two',
      children: [
        // Route One 페이지에서 받아온 arguments를 페이지에 띄운다.
        Text(
          'arguments: ${arguments}',
          textAlign: TextAlign.center,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          }, 
          child: Text('Pop'),
        ),
        ElevatedButton(
          onPressed: () {
            // pushNamed : main.dart에 routes로 설정한 키 값들 중 하나를 string 값으로 넣어준다.
            //             MaterialPageRoute에서 사용할 수 있었던 settings 설정을 통한 arguments 전달 불가능
            //             => pushNamed 안에 존재하는 arguments 설정을 통해 직접 전달 가능 ! 
            Navigator.of(context).pushNamed(
              '/three',
              arguments: 999,
            );
          }, 
          child: Text('Push Named')
        ),
        ElevatedButton(
          onPressed: (){
            // pushReplacement : push와 비슷하나, 스택처럼 쌓는 push와 달리 넘어간 페이지가 전 페이지를 대체한다.
            //                   push) [HP(), R1(), R2(), R3()] / pushReplacement) [HP(), R1(), R3()]
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) => RouteThreeScreen(),
              )
            );
          }, 
          child: Text('Push Replacement'),
        ),
        ElevatedButton(
          onPressed: (){
            // pushReplacementNamed : pushNamed와 비슷하나, 스택처럼 쌓는 push와 달리 넘어간 페이지가 전 페이지를 대체한다.
            Navigator.of(context).pushReplacementNamed(
              '/three'
            );
          }, 
          child: Text('Push Replacement Named'),
        ),
        ElevatedButton(
          onPressed: () {
            // pushAndRemoveUntil : 넘어가는 화면만 push하고 나머지는 다 삭제한다.
            //                      이를 이용하여 pop했을 때 바로 넘어갈 페이지를 설정할 수 있다. 
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (_) => RouteThreeScreen()
              ), 
              // (route) => false : 지금까지 스택에 쌓인 모든 페이지들 다 삭제
              // (route) => true : 지금까지 스택에 쌓인 모든 페이지들을 삭제하지 않고 놔둔다.
              // (route) => route.settings.name == '이동할 페이지 route key' : pop 시 바로 그 페이지로 이동
              //            원리 : 스택에 쌓인 페이지들의 route key가 설정한 route key와 일치하는지 확인 후 false인 것들은 삭제
              (route) => route.settings.name == '/');
          },
          child: Text('Push And Remove Until')
        ),
        ElevatedButton(
          onPressed: () {
            // pushNamedAndRemoveUntil : 위 pushAndRemoveUntil과 같으나 스크린의 route key 값 설정하는 부분만 다름 
            Navigator.of(context).pushNamedAndRemoveUntil(
              '/three',
              // (route) => false : 지금까지 스택에 쌓인 모든 페이지들 다 삭제
              // (route) => true : 지금까지 스택에 쌓인 모든 페이지들을 삭제하지 않고 놔둔다.
              // (route) => route.settings.name == '이동할 페이지 route key' : pop 시 바로 그 페이지로 이동
              //            원리 : 스택에 쌓인 페이지들의 route key가 설정한 route key와 일치하는지 확인 후 false인 것들은 삭제
              (route) => route.settings.name == '/');
          },
          child: Text('Push Named And Remove Until')
        )
      ]
    );
  }
}