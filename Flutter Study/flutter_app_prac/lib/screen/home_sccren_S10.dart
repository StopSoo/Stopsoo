// Section 10 : 만난 지 며칠 U&I
// Expanded : 나머지 공간 차지 
import 'package:flutter/material.dart';

class HomeScreenS10 extends StatefulWidget {
  const HomeScreenS10({super.key});

  @override
  State<HomeScreenS10> createState() => _HomeScreenS10State();
}

class _HomeScreenS10State extends State<HomeScreenS10> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],  // 이와 같이 100~900 사이의 100 단위 값으로 진하기를 설정할 수 있다.
      body: SafeArea(
        bottom: false,  // 아래 쪽은 적용 해제
        child: Container(
          width: MediaQuery.of(context).size.width, // 항상 가운데 정렬
          child: Column(
            children: [
              _TopPart(),
              _BottomPart(),
            ]
          )
        ),
      )
    );
  }
}

// for 코드의 효율성
class _TopPart extends StatelessWidget {
  const _TopPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'U & I',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'parisienne',
              fontSize: 80.0
            )
          ),
          Column(
            children: [
              Text(
                '우리 처음 만난 날',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'sunflower',
                  fontSize: 30.0,
                )
              ),
              Text(
                '2021.12.27',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'sunflower',
                  fontSize: 20.0,
                )
              ),
            ],
          ),
          IconButton(
            // IconButton에서 크기를 설정하는 게 Icon에서 크기를 설정하는 것보다 효율적 !
            iconSize: 70.0,
            onPressed: (){}, 
            icon: Icon(
              Icons.favorite,
              color: Colors.red,
            )
          ),
          Text(
            'D+1',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'sunflower',
              fontSize: 50.0,
              fontWeight: FontWeight.w700
            )
          ),
        ],
      ),
    );
  }
}

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