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

  print('----- Idol -----');
  Idol2 apink = Idol2(name: '에이핑크', membersCount: 5);
  
  apink.sayName;
  apink.sayMembersCount();
  print('');
  // Idol class를 상속 받았기 때문에 Idol 클래스 내 함수들도 사용 가능
  BoyGroup BTS = BoyGroup('BTS', 7);
  BTS.sayMembersCount();
  BTS.sayName();
  print('');
  
  GirlGroup redVelvet = GirlGroup('Red Velvet', 5);
  redVelvet.sayMembersCount();
  redVelvet.sayName();
  redVelvet.sayFemale();
  
  print('----- Type Comparison -----');
  print(apink is Idol2);
  print(apink is GirlGroup);
  print(BTS is Idol2); // 상속 받은 클래스의 경우 부모 클래스에도 해당한다. 
  print(BTS is BoyGroup);
  print(BTS is GirlGroup); // 같은 부모 클래스를 상속 받은 자식 클래스들은 서로 상관이 없다.

  TimesTwo tt = TimesTwo(2);
  print(tt.calculate());
  
  TimesFour tf = TimesFour(2);
  print(tf.calculate());

  // Employee 객체 각각의 이름은 static 변수가 아니므로 다른 값을 가질 수 있다. 
  Employee seulgi = Employee('슬기');
  Employee.building = '오투타워';
  seulgi.printNameAndBuilding();
  
  // 빌딩 이름은 static 변수로 객체에 귀속된다. 
  Employee.printBuilding();

  BoyGroup_ bts_ = BoyGroup_('Bts');
  GirlGroup_ redVelvet_ = GirlGroup_('레드벨벳');
  
  bts_.sayName();
  redVelvet_.sayName();
  
  // 타입 비교
  print(bts_ is IdolInterface);
  print(bts_ is BoyGroup_);

  // generic 사용
  Lecture<String, String> lecture1 = Lecture('123', 'lecture1');
  lecture1.printIdType();
  
  Lecture<int, String> lecture2 = Lecture(123, 'lecture2');
  lecture2.printIdType();
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

// 상속 - inheritance
// 상속을 받으면 부모 클래스의 모든 속성을 자식 클래스가 부여 받는다.
// 부모 class
class Idol2 {
  // 이름
  String name;
  // 멤버 숫자
  int membersCount;
  // 생성자
  Idol2({
    // named parameter
    required this.name,
    required this.membersCount,
  });
  
  void sayName() {
    print('저는 ${this.name}입니다.');
  }
  
  void sayMembersCount() {
    print('${this.name}은 ${this.membersCount}명의 멤버가 있습니다.');
  }  
}

// 자식 class => extends 키워드를 사용
class BoyGroup extends Idol2 {
  // 생성자
  // super 키워드를 사용하여 각 파라미터에 값을 넣어줌
  BoyGroup (
    String name,
    int membersCount,
  ): super (
          name: name,
          membersCount: membersCount,
          );
  
  void sayMale() {
    print('저는 남자 아이돌입니다.');
  }
}

class GirlGroup extends Idol2 {
  GirlGroup(
    String name,
    int membersCount,
  ): super (name: name, membersCount: membersCount);
  
  void sayFemale() {
    print('저는 여자 아이돌입니다.');
  }
}

// method - function (class 내부에 있는 함수)
// override - 덮어쓰다 (우선시하다)
class TimesTwo {
  final int number;
  // 생성자
  TimesTwo (
    this.number,
  );
  // method
  int calculate() {
    return number * 2;
  }
}

class TimesFour extends TimesTwo {
  TimesFour (
    int number
  ) : super(number);
  
  @override // 오버라이딩 키워드
  int calculate() {
    // 정석은 super.number이지만 this.number 해도 상관 없다.
    // or super.calcalculate()라고 해도 된다.                                        
    return number * 4;
  }
}

class Employee {
  // static은 instance에 귀속되지 않고 class에 귀속된다.
  // 객체에 상관 없이 같은 값을 가진다. 
  static String? building;
  final String name;
  
  Employee (
    this.name
  );
  
  void printNameAndBuilding() {
    print('제 이름은 $name입니다. $building 건물에서 근무하고 있습니다.');
  }
  
  static void printBuilding() {
    print('저는 $building 건물에서 근무 중입니다.');
  }
}

// interface
// 특수한 구조를 강요
// instance화를 막기 위해 abstract 키워드를 사용한다. => body 지우기 가능
abstract class IdolInterface {
  String name;
  
  IdolInterface (this.name);
  
  void sayName();  // 틀만 잡아놓는 거라 코드가 필요X
}

// interface를 사용할 때는 implements 키워드를 사용한다.
// 원래 interface와 구조를 맞춰야 한다. 
class BoyGroup_ implements IdolInterface {
  String name;
  
  BoyGroup_(this.name);
  
  void sayName() {
    print('제 이름은 $name입니다.');
  }
}

class GirlGroup_ implements IdolInterface {
  String name;
  
  GirlGroup_(this.name);
  
  void sayName() {
    print('제 이름은 $name입니다.');
  }
}

// generic - 타입을 외부에서 받을 때 사용
class Lecture<T, X> {
  final T id;
  final X name;
  
  Lecture(this.id, this.name);
  
  void printIdType() {
    print(id.runtimeType);
  }
}