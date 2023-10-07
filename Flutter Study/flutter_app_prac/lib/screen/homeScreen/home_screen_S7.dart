// Section 7 : Stateful Widget
import 'package:flutter/material.dart';
import 'dart:ui';
// StatefulWidget 단축 명령어 : stful
// StatelessWidget 단축 명령어 : stless

// StatefulWidget은 createState() 함수를 실행해야 한다.
class HomeScreenS7 extends StatefulWidget {
  // _HomeScreenState 함수에서 사용할 Color 변수를 StatefulWidget에서 선언
  final Color color;

  HomeScreenS7({
    // named parameter
    required this.color,
    Key? key,
  }) : super(key: key) {
    print('Widget Constructor 실행!');
  }

  @override
  _HomeScreenS7State createState() {
    print('createState 실행!');
    return _HomeScreenS7State();
  }

  // @override
  // State<StatefulWidget> createState() {
  //   // State 함수는 어차피 외부에서 쓸 일이 X -> 따라서 private으로 선언하기 위해 _을 붙인다.
  //   return _HomeScreenS7State();
  // }
}

class _HomeScreenS7State extends State<HomeScreenS7> {
  int number = 0;

  // 이 클래스에서 initState() 함수는 필수 !!
  @override
  void initState() {
    print('initState 실행!');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('didChangeDependencies 실행!');
    super.didChangeDependencies();
  }

  @override
  void deactivate() {
    print('deactivate 실행!');
    super.deactivate();
  }

  @override
  void dispose() {
    print('dispose 실행!');
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant HomeScreenS7 oldWidget) {
    print('didUpdateWidget 실행!');
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    print('build 실행!');

    return GestureDetector(
      onTap: (){
        setState((){
          number++;
        });
      },
      child: Container(
        width: 50.0,
        height: 50.0,
        color: widget.color,
        child: Center(
          child: Text(
            number.toString(),
          ),
        ),
      ),
    );
    // return Container(
    //   width: 50.0,
    //   height: 50.0,
    //   // _HomeScreenState 클래스가 HomeScreen의 State를 상속받기 때문에
    //   // 아래 코드에서 widget은 상단에 위치하는 StatefulWidget을 가리킨다.
    //   color: widget.color,
    // );
  }
}


// Stateless로 선언하면 한 클래스 안에서 Color 변수를 선언하고 build 함수에서 사용하면 된다.
// 또한, 클래스명을 클릭해서 'Convert to StatefulWidget'을 선택하면 위 코드로 바로 변환 가능하다. 

// class HomeScreenS7 extends StatelessWidget {
//   final Color color;

//   const HomeScreenS7({
//     required this.color,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 50.0,
//       height: 50.0,
//       color: color,
//     );
//   }
// }
