// Section 13 : Buttons
import 'package:flutter/material.dart';

class HomeScreenS13 extends StatelessWidget {
  const HomeScreenS13({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buttons'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {},
              // styleFrom을 사용하지 않고 ButtonStyle을 사용해보자 
              style: ButtonStyle(
                // 속성에 바로 Colors를 적용할 수 없다.
                // => MaterialStateProperty.all / .resolveWith 사용
                backgroundColor: MaterialStateProperty.all(Colors.black),
                foregroundColor: MaterialStateProperty.all(Colors.red),
              ),
              child: Text(
                'ButtonStyle'
              )
            ),
            ElevatedButton(
              onPressed: () {}, 
              style: ElevatedButton.styleFrom(
                // 메인 컬러
                primary: Colors.red,
                // 글자색 + 클릭 시 스플래쉬 색깔
                onPrimary: Colors.white,
                // 버튼 밑쪽 그림자 색깔
                shadowColor: Colors.black,
                // 3D 입체감의 높이
                elevation: 10.0,
                // 글자 속성
                textStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0,
                ),
                // 글자 주변 패딩 설정
                padding: EdgeInsets.all(20.0),
                // 테두리 속성 설정
                side: BorderSide(
                  color: Colors.orange,
                  width: 3.0,
                )
              ),
              child: Text(
                'ElevatedButton'
              )
            ),
            OutlinedButton(
              onPressed: () {},
              // ElevatedButton과 모든 속성이 같으나, onPrimary만 없음
              style: OutlinedButton.styleFrom(
                // 글자색 + 클릭 시 스플래쉬 색깔
                primary: Colors.green
                // 배경색을 바꾸고 싶다면 backgroundColor 속성을 이용해 변경 가능
                // but, 그렇게 한다면 OutlinedButton을 사용하는 이유 존재 X
              ), 
              child: Text(
                'OutlinedButton'
              )
            ),
            TextButton(
              onPressed: () {},
              // ElevatedButton과 모든 속성이 같으나, onPrimary만 없음
              style: TextButton.styleFrom(
                // 글자색 + 클릭 시 스플래쉬 색깔
                primary: Colors.brown,
                // 배경색을 바꾸고 싶다면 backgroundColor 속성을 이용해 변경 가능
                // but, 그렇게 한다면 TextButton을 사용하는 이유 존재 X
              ),
              child: Text(
                'TextButton'
              )
            ),
          ],
        ),
      )
    );
  }
}