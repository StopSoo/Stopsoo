// OOP : Object Oriented Programming

void main() {
  // 객체 선언
  // new 키워드를 사용해도 되고 안 해도 된다. 
  const Idol blackPink = Idol(
    '블랙핑크', 
    ['지수', '제니', '로제', '리사']
  );

  const Idol blackPink2 = Idol(
    '블랙핑크', 
    ['지수', '제니', '로제', '리사']
  );
  // const를 사용했기 때문에 변수 값들이 각각 모두 같은 두 객체를 같다고 인식
  print(blackPink == blackPink2);

  const Idol bts = Idol(
    '방탄소년단',
    ['RM, 진, 슈가, 제이홉, 지민, 뷔, 정국']
  );

  blackPink.sayHello();
  bts.sayHello(); // 기본 생성자를 통한 생성 후 함수 실행

  Idol bts2 = Idol.fromList(
    [
      ['RM, 진, 슈가, 제이홉, 지민, 뷔, 정국'],
      '방탄소년단'
    ]
  );
  bts2.sayHello();  // named constructor를 통한 생성 후 함수 실행
  
  print(blackPink.firstMember); // 첫 번째 멤버인 '지수'를 반환
  blackPink.firstMember = '박진영';  // setter를 사용해서 값을 변경
  print(blackPink.firstMember);
}

// class 선언
class Idol {
  // 변수 선언
  // 몇몇 예외를 제외하고는 변수를 final로 선언해서 값 변경을 최소화하기 !
  final String name;
  final List<String> members;

  // constructor (생성자) 만들기 -> 변수 선언 후 생성자 만들기
  //                          -> 콜론 찍고 this 포인터를 사용해서 초기화하기
  // 기본 생성자 선언 방법 1
  // 생성자 선언 시 const를 사용해야 실제 사용 시 const로 값을 변경하지 못 하게 할 수 있다.
  // 또한, 객체 생성 시 const를 사용하면 객체명이 다르더라도 내부 변수 값이 같았을 때 두 객체를 같다고 인식한다.
  const Idol(String name, List<String> members): 
  this.name = name, 
  this.members = members;
  // 기본 생성자 선언 방법 2 
  // Idol(this.name, this.members);
  
  // named constructor 선언 방법 -> 클래스명.생성자명() : 
  // 클래스의 각 요소를 values list의 0, 1번째에 넣겠다는 의미
  // 이 생성자에는 const 키워드를 사용하지 않았기 때문에 사용 시 const 키워드를 사용할 수 없다.
  Idol.fromList(List values)
    : this.members = values[0],
      this.name = values[1];
  
  void sayHello() {
    print('안녕하세요 ${this.name}입니다.');
  }
  
  void introduce() {
    print('저희 멤버는 ${this.members}가 있습니다.');
  }

  // getter / setter
  // 데이터를 가져올 때 / 데이터를 설정할 때

  // getter
  // 맨 앞에 반환 자료형은 붙여도 되고 안 붙여도 된다 !
  String get firstMember {
    return this.members[0];
  }
  
  // setter
  // 무조건 하나의 파라미터를 필요로 한다. (할당 개념)
  set firstMember(String name) {
    this.members[0] = name;
  }

  // private variable
  // 변수명 앞에 _를 붙여주면 외부 파일에서 접근할 수 없다.
}