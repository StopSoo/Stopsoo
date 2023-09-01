// Section 12 : 쓸데없이 예쁜 랜덤 숫자 생성기
import 'package:flutter/material.dart';
import 'package:flutter_application_prac/constant/colors.dart';

class HomeScreenS12 extends StatefulWidget {
  const HomeScreenS12({super.key});

  @override
  State<HomeScreenS12> createState() => _HomeScreenS12State();
}

class _HomeScreenS12State extends State<HomeScreenS12> {
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
              Row(
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
                    onPressed: () {},
                    icon: Icon(
                      Icons.settings,
                      color: RED_COLOR,
                    ),
                  )
                ]
              ),
              // 랜덤 숫자 나오는 부분
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // 코드의 효율성을 위해서 이런 식으로 map 쓰는 것 익숙해지기 !
                  children: [
                    123,
                    456,
                    789,
                  ].asMap()
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
              ),
              // 생성하기 버튼
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  // ElevatedButton : style 지정 방법 체크 (!)
                  style: ElevatedButton.styleFrom(
                    primary: RED_COLOR,
                  ),
                  onPressed: () {}, 
                  child: const Text(
                    '생성하기!',
                  )
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}