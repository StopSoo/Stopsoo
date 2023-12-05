// Section 14 : Navigation
// MainLayout 적용
import 'package:flutter/material.dart';
import 'package:flutter_application_prac/layout/main_layout.dart';
import 'package:flutter_application_prac/screen/route_one_screen.dart';

class HomeScreenS14 extends StatelessWidget {
  const HomeScreenS14({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // 안드로이드에서 시스템 상 뒤로가기 버튼을 통해 강제로 앱을 종료하는 일이 없게 방지
      onWillPop: () async {
        // true : pop 가능
        // false : pop 불가능

        // Pop이 가능한 경우는 true를 반환, 불가능한 경우는 false를 반환하게 설정 
        final canPop = Navigator.of(context).canPop();

        return canPop;
      },
      child: MainLayout(
        title: 'Home Screen', 
        children: [
          ElevatedButton(
            onPressed: () {
              // maybePop : 더 이상 뒤로 갈 페이지가 없을 때 pop되지 않음
              Navigator.of(context).maybePop();
            },
            child: Text('Maybe Pop'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Pop'),
          ),
          ElevatedButton(
            onPressed: () async {
              final result = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => RouteOneScreen(
                    number: 123,
                  ),
                )
              );
    
              print(result);
            }, 
            child: Text('Push')
          )
        ],
      ),
    );
  }
}