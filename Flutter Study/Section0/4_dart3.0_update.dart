// dart 3.0 update

class Idol {
  // for ex
  final String nameI;
  final int ageI;

  // constructor
  Idol({required this.nameI, required this.ageI});
}

void main() {
  // record
  final result = nameAndAge({'name': '민지', 'age': 20});

  print(result);
  print(result.$1); // 첫 번째 원소 가져오기
  print(result.$2); // 두 번째 원소 가져오기

  final result2 = getNewJeansWithType();
  for (final item in result2) {
    print(item.$1);
    print(item.$2);
  }
  // named record 사용해보기
  final result3 = getNewJeansWithType3();
  for (final item in result3) {
    // parameter명으로 호출
    print(item.name);
    print(item.age);
  }

  // distructuring
  final minJi = ('민지', 20);
  print(minJi); // 사실 이렇게 record 형태로 쓸 일이 많이 없음
  // 다음과 같이 선언하면 각 위치에 맞게 변수에 값들이 들어간다.
  // 이 특징은 record에만 제한된 건 아니고 모든 자료형에 통용되는 특징이다 (!)
  // 고로 자료형에 맞춰서 사용한다.
  final (name, age) = ('민지', 20);
  print(name);
  print(age);
  // map에 대해 distructuring이 가능
  // map은 키를 꼭 작성해줘야 한다.
  final minJiMap = {'name': '민지', 'age': 19};
  final {'name': name3, 'age': age3} = minJiMap;
  print(name3);
  print(age3);
  // class에 대해 distructuring이 가능
  // 1. 본래 클래스 객체를 선언하는 방법
  final minJiIdol = Idol(nameI: '민지', ageI: 19);
  // 2. distructuring을 이용하는 방법
  final Idol(nameI: nameM, ageI: ageM) = minJiIdol;
  print(nameM);
  print(ageM);

  // rest matching
  // 중간 원소들을 생략할 때 ...를 사용
  // 단 한 번만 사용할 수 있다 (!)
  // Ex> distructuring을 이용하는데 변수랑 값의 개수가 안 맞을 때 : 1, 2, 8만 가져오기
  final numbers = [1, 2, 3, 4, 5, 6, 7, 8];
  final [x, y, ..., z] = numbers;
  print(x);
  print(y);
  print(z);
  // rest matching을 사용하는데, 나머지를 버리고 싶지 않을 때
  final [xx, yy, ...rest, zz] = numbers;
  print(rest); // 2와 8 사이에 있는 [3, 4, 5, 6, 7]이 출력됨

  // ignore
  // distructuring을 이용하는데 특정한 원소는 무시하고 싶을 때 _를 사용한다.
  final [xxx, _, yyy, ...rest2, zzz, _] = numbers;
  print(xxx);
  print(yyy);
  print(rest2);
  print(zzz);

  // Validation
  // 패턴 매칭으로 validation 가능
  final minji = ('민지', 20);
  final (name_m as String, age_m as int) = minji;
  print(name);
  print(age);

  // switch
  switcher(['1', '2']);
  switcher([1, 2]);
  switcher([1, 2, 3]);
  switcher([4, 5, 6]);
  switcher([4, 5, 6, 7]);

  print(switcher2(5, true));

  // loop에서 pattern matching 사용하기
  final List<Map<String, dynamic>> members = [
    {'name': '민지', 'age': 20},
    {'name': '해린', 'age': 19}
  ];
  // 원래 loop 형태
  for (final member in members) {
    print(member['name']);
    print(member['age']);
  }
  // pattern matching 사용
  for (var {'name': name, 'age': age} in members) {
    print(name);
    print(age);
  }

  ifMatcher();
}

// Record
// 튜플이랑 같다고 생각하면 됨
// ()를 사용하여 순서와 타입을 보장
(String, int) nameAndAge(Map<String, dynamic> json) {
  return (json['name'] as String, json['age'] as int);
}

// dart 언어로는 String, int 순서와 타입이라고 지정할 수 있는 방법이 존재하지 않음
// 그래서 dynamic으로 캐스팅하는 것
List<Map<String, dynamic>> getNewJeans() {
  return [
    {
      'name': '민지',
      'age': 20,
    },
    {
      'name': '해린',
      'age': 18,
    }
  ];
}

// map 대신 record를 넣어주기
// 리스트 안에 들어가는 중괄호를 소괄호로 바꿔주기
// 키 값 제거하기
List<(String, int)> getNewJeansWithType() {
  return [
    (
      '민지',
      20,
    ),
    (
      '해린',
      18,
    )
  ];
}

// type에 이름 붙이기
// 기존 record와 다를 바가 없음
List<(String name, int age)> getNewJeansWithType2() {
  return [
    (
      '민지',
      20,
    ),
    (
      '해린',
      18,
    )
  ];
}

// 아래와 같이 간단하게도 정의 가능
(String name, String group, int age) getMinji() {
  return ('민지', '뉴진스', 19);
}

// named parameter처럼 named record 사용
// 순서를 통해 호출하는 전까지의 방식과 달리, parameter명을 통해 호출할 수 있다.
List<({String name, int age})> getNewJeansWithType3() {
  return [
    (
      name: '민지',
      age: 20,
    ),
    (
      name: '해린',
      age: 18,
    )
  ];
}

// switch
void switcher(dynamic anything) {
  switch (anything) {
    case 'aaa':
      print('match: aaa');
    case ['1', '2']:
      print('match: [1, 2]');
    case [_, _, _]: // 어떠한 자료형이라도 가능
      print('match: [_, _, _]');
    case [int a, int b]:
      print('match: [int $a, int $b]');
    case < 10 && > 5: // 이렇게 대소 관계를 표현할 수 있다는 걸 알아둘 것 !
      print('match: < 10 && > 5');
    default:
      print('no match');
  }
}

// arrow 함수를 사용한 switch문
// switcher2는 switch문을 반환하고, switch문은 경우에 따라 다음과 같은 string을 반환한다.
String switcher2(dynamic val, bool condition) => switch (val) {
      5 => 'match: 5',
      7 when condition => 'match 7 and true', // condition 조건 추가
      _ => 'no match' // default
    };

// if
void ifMatcher() {
  final MinJi = {'name': '민지', 'age': 20};
  if (MinJi case {'name': String name, 'age': int age}) {
    print(name);
    print(age);
  }
}

// 아래 내용은 모두 다른 파일에서 클래스를 불러왔을 때 해당되는 내용 !!
// final로 클래스를 선언하면
// extends, implement, 또는 mixin으로 사용이 불가능하다.

// base로 클래스를 선언하면 extends는 가능하지만 implement는 불가능하다. 
// base, sealed, final로 선언된 클래스만 extends가 가능하다. 

// interface로 선언하면 implement만 가능하다.

// sealed 클래스는 abstract이면서 final이다.
// 그리고 패턴매칭을 할 수 있도록 해준다.
// 매칭이 안 된 클래스가 있다면 에러 발생 !

// mixin 클래스
// 1. mixin 클래스는 extends나 with를 사용할 수 없다. 
//    그렇기 때문에 mixin class도 마찬가지로 사용 불가능하다. 
// 2. 클래스는 on 키워드를 사용할 수 없다. 그렇기 때문에 Mixin class도 on 키워드를 사용할 수 앖다. 
final class Person {
  final String name;
  final int age;

  Person({
    required this.name,
    required this.age
  });
}

