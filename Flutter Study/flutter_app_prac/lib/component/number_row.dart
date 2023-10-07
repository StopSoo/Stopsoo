// Section 12 : 쓸데없이 예쁜 랜덤 숫자 생성기
// 최대 숫자 설정 위젯
import 'package:flutter/material.dart';

class NumberRow extends StatelessWidget {
  // 들어오는 값이 double이라, d to i 설정은 위젯을 사용하는 쪽에서 할 것
  final int number;

  const NumberRow({required this.number, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: number
      .toString()
      .split('')
      .map((e) => Image.asset(
        'asset/img/$e.png',
        height: 80.0,
        )
      )
      .toList(),
    );
  }
}