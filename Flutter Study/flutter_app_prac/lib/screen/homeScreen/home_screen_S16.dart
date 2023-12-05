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
              // onPressed: null로 설정하면 버튼을 비활성화 상태로 만들 수 있다.
              onPressed: () {},
              // styleFrom을 사용하지 않고 ButtonStyle을 사용해보자 
              style: ButtonStyle(
                // 속성에 바로 Colors를 적용할 수 없다.
                // 1. MaterialStateProperty.all
                // 2. MaterialStateProperty.resolveWith
                //    => 괄호 안에 함수를 작성
                //    => 절대적으로 무언가를 돌려줘야 한다. (null도 가능!)
                backgroundColor: MaterialStateProperty.all(
                  Colors.black
                ),
                foregroundColor: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states) {
                    // Material State
                    // 1) hobered - 호버링 상태 (마우스 커서를 올려 놓은 상태)
                    // 2) focused - 포커스 됐을 때 (Ex> 텍스트 필드)
                    // 3) pressed - 눌렸을 때
                    // 4) dragged - 드래그 됐을 때
                    // 5) selected - 선택됐을 때 (Ex> 체크 박스, 라디오 버튼)
                    // 6) scrollUnder - 다른 컴포넌트 밑으로 스크롤링됐을 때
                    // 7) disabled - 비활성화됐을 때
                    // 8) error - 에러 상태 (Ex> 텍스트 필드))
                    
                    // states가 MaterialState 상태들 중 pressed 상태를 가지고 있다면
                    // (= 버튼이 눌렸다면)
                    if(states.contains(MaterialState.pressed)){
                      // 글자색을 하얀색으로 설정
                      return Colors.white;
                    }
                    // 눌리지 않았다면 글자색을 빨간색으로 설정
                    return Colors.red; 
                  }
                ),
                // 패딩 속성이므로 EdgeInsets를 return하면 된다.
                padding: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states) {
                    if(states.contains(MaterialState.pressed)) {
                      return EdgeInsets.all(100.0);
                    }

                    return EdgeInsets.all(20.0);
                  }
                )
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