import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,  // 아래 쪽은 적용 해제
        child: Container(
          color: Colors.black,
          // MediaQuery.of(context) : size(width, height)를 가져올 수 있다.
          // width: MediaQuery.of(context).size.width,
          child: Column(
            // MainAxisAlignment - 주축 정렬
            // start - 시작 | center - 중심 | end - 끝
            // spaceBetween - 위젯과 위젯 사이의 간격이 동일하게 배치됨, 위젯이 먼저 시작
            // spaceEvenly - 위젯과 위젯 사이의 간격이 동일하게 배치됨, 여백부터 시작
            // spaceAround - 위젯과 위젯 사이의 간격이 동일하게 배치됨, 
            //               여백부터 시작하지만 spaceEvenly와 다르게 양 끝 여백은 설정된 간격의 1/2 사이즈임
            mainAxisAlignment: MainAxisAlignment.start,
            // CrossAxisAlignment - 반대축 정렬
            // start - 시작 | center - 중심 | end - 끝
            // stretch - 최대한으로 늘린다. 
            crossAxisAlignment: CrossAxisAlignment.start,
            // MainAxisSize - 주축 크기
            // max - 최대 | min - 최소
            mainAxisSize: MainAxisSize.max,
            children: [
              // Expanded | Flexible : Row나 Column의 children에만 사용할 수 있다 (!)
              // Expanded : Column, Row의 남은 공간을 최대한 차지
              // Flexible : 기본 비율 1의 크기 만큼 출력, 위젯의 비율에서 남은 공간은 버린다.
              Flexible(
                flex: 2,  // 기본 값은 1이며, 위젯들 사이에서 비율을 말한다.
                child: Container(
                  width: 50.0,
                  height: 50.0,
                  color: Colors.red,
                ),
              ),
              Expanded(
                child: Container(
                  width: 50.0,
                  height: 50.0,
                  color: Colors.orange,
                ),
              ),
              Expanded(
                child: Container(
                  width: 50.0,
                  height: 50.0,
                  color: Colors.yellow,
                ),
              ),
              Expanded(
                child: Container(
                  width: 50.0,
                  height: 50.0,
                  color: Colors.green,
                ),
              ),
            ],
          )
        )
      )
    );
  }
}
