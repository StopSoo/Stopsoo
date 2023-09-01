// Section 12 : 쓸데없이 예쁜 랜덤 숫자 생성기
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_prac/constant/colors.dart';
import 'package:flutter_application_prac/screen/settings_screen.dart';

class HomeScreenS12 extends StatefulWidget {
  const HomeScreenS12({super.key});

  @override
  State<HomeScreenS12> createState() => _HomeScreenS12State();
}

class _HomeScreenS12State extends State<HomeScreenS12> {
  List<int> randomNumbers = [
    123,
    456,
    789,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        // Padding widget으로 감싼다는 점 (!)
        child: Padding(
          // EdgeInsets
          // 1. .all : L, T, R, B 모두 적용
          // 2. .only : named parameter를 이용하여 적용
          // 3. .symmetric : 가로 대칭(horizontal), 세로 대칭(vertical)으로 적용
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 헤더
              _Header(),
              // 랜덤 숫자 나오는 부분
              _Body(
                randomNumbers: randomNumbers
              ),
              // 생성하기 버튼
              _Footer(
                onPressed: onRandomNumberGenerater,
              )
            ],
          ),
        ),
      )
    );
  }

  void onRandomNumberGenerater() {
    // 랜덤 생성기
    final rand = Random();
    // 새로운 리스트 => 집합으로 변경해서 중복 제거 !
    final Set<int> newNumbers = {};

    // 중복이 제거되더라도 숫자의 개수는 3개가 될 수 있게 => 버그 가능성 제거
    while (newNumbers.length != 3) {
      final number = rand.nextInt(1000);
      newNumbers.add(number);
    }

    // 리스트 덮어쓰기
    // setState() 함수 사용 체크 (!)
    setState(() {
      randomNumbers = newNumbers.toList();
    });
  } 
}

class _Header extends StatelessWidget {
  const _Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '랜덤 숫자 생성기',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.w700
          )
        ),
        IconButton(
          onPressed: () {
            // 스크린 이동하기 : 방법 알아둘 것 (!)
            // [HomeScreenS12(), SettingsScreen()] 개념
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return SettingsScreen();
                },
              )
            );
          },
          icon: Icon(
            Icons.settings,
            color: RED_COLOR,
          ),
        )
      ]
    );
  }
}

class _Body extends StatelessWidget {
  // 코드 정리 시, randomNumbers 리스트를 외부에서 받아올 수 있게 설정해준다. 
  final List<int> randomNumbers;

  const _Body({required this.randomNumbers, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // 코드의 효율성을 위해서 이런 식으로 map 쓰는 것 익숙해지기 !
        children: randomNumbers
        .asMap()
        .entries  // key, value로 저장됨
        .map((e) => Padding(
          padding: EdgeInsets.only(
            // 마지막 Row에는 아래 패딩을 넣지 않는다 (!)
            bottom: e.key == 2 ? 0.0 : 16.0
          ),
          child: Row(
            children: e.value // value가 들어와야 함 체크 !
              .toString()
              .split('')
              .map((x) => Image.asset(
                'asset/img/$x.png',
                height: 80.0,
                )
              ).toList(),
          ),
        )).toList()
      )
    );
  }
}

class _Footer extends StatelessWidget {
  // Stateful -> Stateless 변경 시, setState() 오류 해결하는 방법 (!)
  final VoidCallback onPressed;

  const _Footer({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        // ElevatedButton : style 지정 방법 체크 (!)
        style: ElevatedButton.styleFrom(
          primary: RED_COLOR,
        ),
        // 버튼을 누르면 난수 생성
        onPressed: onPressed,
        child: const Text(
          '생성하기',
        )
      ),
    );
  }
}