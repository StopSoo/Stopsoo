// Section 12 : Navigation으로 화면 이동해버리기 ~!
import 'package:flutter/material.dart';
import 'package:flutter_application_prac/component/number_row.dart';
import 'package:flutter_application_prac/constant/colors.dart';

class SettingsScreen extends StatefulWidget {
  final int maxNumber;
  const SettingsScreen({required this.maxNumber, super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // State에 직접 선언하는 위젯에는 widget.maxNumber처럼 widget 키워드를 사용할 수 없다 (!)
  double maxNumber = 1000;  // for slider

  // initState() 함수는 _SettingsScreenState 클래스가 실행될 때마다 불린다.
  // 그래서 widget 키워드를 선언할 수 있다.
  @override
  void initState() {
    super.initState();

    // 형 변환 항상 체크할 것
    maxNumber = widget.maxNumber.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              _Body(
                maxNumber: maxNumber,
              ),
              _Footer(
                onSliderChanged: onSliderChanged, 
                maxNumber: maxNumber,
                onButtonPressed: onButtonPressed,
              )
            ],
          ),
        ),
      )
    );
  }

  void onSliderChanged (double val) {
    // onChanged가 불릴 때마다 (= Slider 값이 변경될 때마다) setState() 함수가 실행된다.
    // setState() 함수를 사용하지 않으면 slider가 움직이지 않음
    setState(() {
      maxNumber = val;
    });
  }

  void onButtonPressed () {
    Navigator.of(context).pop(maxNumber.toInt());
  }
}

class _Body extends StatelessWidget {
  final double maxNumber;

  const _Body({required this.maxNumber, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // 형 변환 체크
      child: NumberRow(number: maxNumber.toInt()),
    );
  }
}

class _Footer extends StatelessWidget {
  final ValueChanged<double>? onSliderChanged;  // ? : null의 가능성 존재
  final double maxNumber;
  final VoidCallback onButtonPressed;

  const _Footer({
    required this.onSliderChanged, 
    required this.maxNumber, 
    required this.onButtonPressed,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Slider(
          // slider가 이동될 때 받은 값 val을 maxNumber에 넣어서 value에 다시 넣어주는 형태 (!)
          value: maxNumber,
          min: 1000,
          max: 100000,
          onChanged: onSliderChanged,
        ),
        ElevatedButton(
          onPressed: onButtonPressed,
          child: Text('저장'),
          style: ElevatedButton.styleFrom(
            primary: RED_COLOR
          )
        )
      ],
    );
  }
}