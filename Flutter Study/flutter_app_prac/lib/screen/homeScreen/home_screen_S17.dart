// Section 17 : StreamBuilder and FutureBuilder
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
        child: FutureBuilder(
          // future 속성 필히 설정 !!
          future: getNumber(),
          builder: (context, snapshot) {
            // 데이터가 있을 때 위젯 렌더링
            // hot reload 말고 reload 시에만 실행됨
            if(!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator()
              );
            }

            if(snapshot.hasError) {
              // 에러가 났을 때 위젯 렌더링
            }

            // 로딩 중일 때 위젯 렌더링

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'FutureBuilder',
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
}