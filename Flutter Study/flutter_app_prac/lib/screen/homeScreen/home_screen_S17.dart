// Section 17 : StreamBuilder and FutureBuilder
// FutureBuilder : future 속성에 future 함수 넣어주기
// StreamBuilder : stream 속성에 stream 함수 넣어주기
// 둘 다 generic 선언 가능 => snapshot에 대한 자료형을 선언해준다.
// snapshot은 AsyncSnapshot<>와 같이 선언한다.
// StreamBuilder는 stream을 다 쓰고 닫는 것까지 알아서 해준다.
import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreenS17 extends StatefulWidget {
  const HomeScreenS17({super.key});

  @override
  State<HomeScreenS17> createState() => _HomeScreenS17State();
}

class _HomeScreenS17State extends State<HomeScreenS17> {
  final textStyle = TextStyle(
    fontSize: 16.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        // FutureBuilder
        child: StreamBuilder<int>(
          stream: streamNumbers(),
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            // 아래 항목들은 FutureBuilder에서 적용됨

            // // 데이터가 있을 때 위젯 렌더링
            // // hot reload 말고 reload 시에만 실행됨
            // if(!snapshot.hasData) {
            //   return Center(
            //     child: CircularProgressIndicator()
            //   );
            // }

            // if(snapshot.hasError) {
            //   // 에러가 났을 때 위젯 렌더링
            // }

            // // 로딩 중일 때 위젯 렌더링

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'StreamBuilder',
                  // 기본 스타일을 유지하면서 새로운 스타일을 추가
                  style: textStyle.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 20.0,
                  )
                ),
                Text(
                  // future가 없으면 snapshot.connectionState는 none이 출력됨
                  'ConState : ${snapshot.connectionState}',
                  style: textStyle,
                ),
                Text(
                  'Data : ${snapshot.data}',
                  style: textStyle
                ),
                Text(
                  'Error : ${snapshot.error}',
                  style: textStyle
                ),
                ElevatedButton(
                  onPressed: () {
                    // 한 번 빌드한 후 setState() 함수를 실행하면 
                    // 다시 null로 돌아가는 것이 아닌 기존 값을 기억하고 가지고 있는다.
                    setState(() {});
                  }, 
                  child: Text('setState'),
                )
              ],
            );
          },
        ),
      )
    );
  }

  Future<int> getNumber() async {
    await Future.delayed(Duration(seconds: 3));

    final random = Random();

    // throw Exception('에러가 발생했습니다.');

    return random.nextInt(100); // 최대 숫자 = 100
  }

  // waiting - active - done
  // active 상태일 때 아래 Stream 함수에서 작성해놓은 것처럼 0~9까지 출력된다.
  Stream<int> streamNumbers() async* {
    for (int i = 0; i < 10; i++) {
      // if (i == 5) {
      //   throw Exception('i = 5');
      // }

      await Future.delayed(Duration(seconds: 1));

      yield i;
    }
  }
}