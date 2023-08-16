// dart 3.0 update

class Idol {  // for ex
  final String nameI;
  final int ageI;

  // constructor
  Idol({
    required this.nameI,
    required this.ageI
  });
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
