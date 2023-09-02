// Section 11 : Const constructor
// Q. const는 언제 사용할까 ?
// A. build 타임에 모든 변수들의 값들을 다 알 수 있을 때 사용 !
// 앱이 실행되는 동안 build 함수는 한 번만 실행된다는 뜻
// const로 선언한 위젯이 많을 수록 더욱 효율적이다.

import 'package:flutter/material.dart';

class HomeScreenS11 extends StatefulWidget {
  const HomeScreenS11({super.key});

  @override
  State<HomeScreenS11> createState() => _HomeScreenS11State();
}

class _HomeScreenS11State extends State<HomeScreenS11> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 아래 두 TestWidget은 const 키워드를 사용하였으므로 build를 여러 번 눌러도 한 번만 생성된다. 
            const TestWidget(label: 'test1'),
            const TestWidget(label: 'test2'),
            // ElevatedButton은 const로 선언 불가능 (!)
            // setState() 함수에 뭐가 들어갈지 모르기 때문
            ElevatedButton(
              onPressed: () {
                // setState()를 실행하면 build가 다시 실행된다. 
                setState(() {});
              }, 
              child: const Text(
                'Build !'
              )
            )
          ],
        ),
      )
    );
  }
}

class TestWidget extends StatelessWidget {
  final String label;

  const TestWidget({
    required this.label, 
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
        )
      )
    );
  }
}