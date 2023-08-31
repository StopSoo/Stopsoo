// Section 10 : 만난 지 며칠 U&I
// Expanded : 화면에서 위젯이 나머지 공간을 차지할 수 있게 한다. 
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreenS10 extends StatefulWidget {
  const HomeScreenS10({super.key});

  @override
  State<HomeScreenS10> createState() => _HomeScreenS10State();
}

class _HomeScreenS10State extends State<HomeScreenS10> {
  // date picker에 의해 선택된 날짜
  DateTime selectedDate = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],  // 이와 같이 100~900 사이의 100 단위 값으로 진하기를 설정할 수 있다.
      body: SafeArea(
        // SafeArea : 아래 쪽은 적용 해제
        bottom: false,  
        child: Container(
          width: MediaQuery.of(context).size.width, // 화면 크기와 상관 없이 항상 가운데 정렬
          child: Column(
            children: [
              // 이와 같이 클래스 형태로 만들기
              _TopPart(
                // named parameter 값 꼭 넣어주기 
                selectedDate: selectedDate,
                onPressed: onHeartPressed,
              ),
              _BottomPart(),
            ]
          )
        ),
      )
    );
  }

  // stateful => stateless : setState() 함수 사용 못 하므로, 상태를 트리의 위로 옮김 (!)
  void onHeartPressed(){
    // dialog
    showCupertinoDialog(
      context: context,
      // dialog 바깥 영역을 누르면 위젯 닫힘
      // 기본 값은 false
      barrierDismissible: true,
      // 화면 안에 들어갈 위젯을 builder에 넣어주면 된다. 
      // build 함수라고 생각하면 됨 !!
      builder: (BuildContext context) {
        // Container를 Align으로 묶기 => 안 하면 화면 전체를 덮음 ! (flutter 특징)
        return Align(
          // 창의 위치 설정
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Colors.white,
            height: 300.0,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              // 초기 값 세팅
              initialDateTime: selectedDate,
              // 미래의 날짜를 선택해서 날 수 있는 오류를 방지
              maximumDate: DateTime(
                DateTime.now().year,
                DateTime.now().month,
                DateTime.now().day ,
              ),
              // 함수 정의 들어가서 보면 onDateTimeChanged는 
              // DateTime 형태의 value를 받는다는 걸 알 수 있음
              onDateTimeChanged: (DateTime date) {
                // setState() 함수 사용하기 !
                // date 값으로 받은 날짜를 selectedDate 변수에 업데이트
                setState(() {
                  selectedDate = date;
                });
              },
            )
          ),
        );
      }
    );
  }
}

// 클래스화 for 코드의 효율성
// date picker에 의해 날짜를 변경해줘야 하므로 stateful로 변경 (!)
// 다시 stateless로 바꾸고 상태를 트리의 위로 옮김 
class _TopPart extends StatelessWidget {
  final DateTime selectedDate;
  final VoidCallback onPressed; // setState() 제거 위함

  _TopPart({
    required this.selectedDate, 
    required this.onPressed,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 위젯 트리에서 가장 가까운 theme을 가져온다. 
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Expanded(
      child: Column(
        // 위젯들 간의 배치 상태에 따라 설정할 것.
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'U & I',
            style: textTheme.headline1,
          ),
          Column(
            children: [
              Text(
                '우리 처음 만난 날',
                style: textTheme.bodyText1,
              ),
              Text(
                // 아래처럼 value 가져오는 것 잊지 않기 !
                '🩷 ${selectedDate.year}년 ${selectedDate.month}월 ${selectedDate.day}일 🩷',
                style: textTheme.bodyText2,
              ),
            ],
          ),
          IconButton(
            // IconButton에서 크기를 설정하는 게 Icon에서 크기를 설정하는 것보다 효율적 !
            iconSize: 70.0,
            onPressed: onPressed,
            icon: Icon(
              Icons.favorite,
              color: Colors.red,
            )
          ),
          Text(
            // 두 시간의 차 => difference 사용하기 
            'D + ${DateTime.now().difference(selectedDate).inDays + 1}',
            style: textTheme.headline2,
          ),
        ],
      ),
    );
  }
}

// 이미지
class _BottomPart extends StatelessWidget {
  const _BottomPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Image.asset(
        'asset/img/middle_image.png',
      ),
    );
  }
}