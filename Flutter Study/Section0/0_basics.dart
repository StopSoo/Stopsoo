// 10. enumerate 
enum Status { 
  approved, // 승인
  pending,  // 대기
  rejected  // 거절
}

// 11. function
// Ex> 세 개의 숫자를 더하고 짝/홀 판별
// 1) parameter - 매개변수
// 2) positional parameter - 순서가 중요한 파라미터
// 3) optional parameter - 있어도 되고 없어도 되는 파라미터 -> []로 묶어줌
//    (!) int형을 []로 묶어주면 해당 변수에 null값이 들어가 error가 발생한다.
//    그래서 디폴트 값을 설정해주는 게 좋다.         
void addNumbers(int x, [int y = 0, int z = 0]) {
  int sum = x + y + z;
  // 변수의 값을 print할 때 다음과 같이 $변수명으로 사용한다. 
  print('x : $x');
  print('y : $y');
  print('z : $z');

  if (sum % 2 == 0) {
      print('짝수입니다.');
  } else {
      print('홀수입니다.');
  }
}
// 4) named parameter - 이름이 있는 파라미터이므로 순서가 중요하지 않다.
// 함수 선언 시 parameter 앞에 'required'라는 키워드를 사용한다.  
// 실제로 함수를 사용할 때는 parameter 자리에 '변수명: 값' 형태로 사용한다. 
// (!) 여기서 optional paramter를 사용하기 위해서는 맨 앞에 'required' 키워드를 삭제해주고 디폴트 값을 넣어주면 된다.
void addNumbers2({required int x, required int y, required int z}) {
  int sum = x + y + z;

  print('x : $x');
  print('y : $y');
  print('z : $z');

  if (sum % 2 == 0) {
      print('짝수입니다.');
  } else {
      print('홀수입니다.');
  }
}
// 5) arrow function - 화살표 함수
// 화살표 다음에 오는 값이 반환되는 값이다. 
int addNumbers3(int x, {required int y, int z = 30}) => x + y + z;

// 12. typedef
// 아래 signature에 부합하게 함수 형태를 작성
typedef Operation = int Function(int x, int y, int z);
// 더하기
int add(int x, int y, int z) => x + y + z;
// 빼기
int subtract(int x, int y, int z) => x - y - z;
// 계산 (실제 사용 예시)
int calculate(int x, int y, int z, Operation operation) {
  return operation(x, y, z);
}



// 메인 함수
// void 키워드 : 아무 것도 반환하지 않음
void main() {
  // nullable
  // non-nullable

  // 1. variable
  int a = 5;  // ?가 없는 변수는 null 선언 불가능
  int? b = null;  // ?가 있는 변수는 null 선언 가능
  // ??=
  print(b);
  b ??= 3;  // b가 null일 경우 해당 숫자를 할당해라.
  print(b);

  // 2. final, const
  // 값 변경 불가능
  final String name = '정지수';
  const String name2 = '블랙핑크';
  // var 키워드 생략 가능 -> 알아서 할당
  final age = 23;
  final age2 = 30;

  // 3. 현재 날짜와 시간
  // 버튼을 누르는 시간 X, 코드가 실행되는 시간 O
  DateTime now = DateTime.now();
  print(now);
  // final : build time에 값을 알 필요가 없다.
  // const : build time에 값을 알아야 한다. 
  final DateTime now2 = DateTime.now();
  print(now2); // 가능
  //   const DateTime now2 = DateTime.now();
  //   print(now); // 불가능

  // 4. 연산
  int number = 2;
  print(number);
  print(number % 2);  // 나머지 연산
  // 증감 연산 가능
  number++; 
  print(number);
  number--;
  print(number);
  number += 1;
  print(number);
  // 값 비교 연산
  int number1 = 1;
  print(number1 is int);  // true
  print(number1 is String); // false
  print(number1 is! int); // false
  print(number1 is! String);  // true
  // 논리 연산
  // && - and 조건
  // || - or 조건

  // 5. List
  // generic(<>) 방식으로 자료형 선언 
  // indexing 가능
  List<String> blackPink = ['제니', '지수', '로제', '리사'];
  List<int> numbers = [1, 2, 3, 4, 5];
  // list명.내장함수 사용 가능
  print(blackPink.length);
  blackPink.add('유아');
  blackPink.remove('유아');
  print(blackPink.indexOf('로제'));   // 해당 값의 인덱스를 반환

  // 6. Map
  // key, value -> 짝을 이뤄서 넣음
  Map<String, String> dictionary = {
      'Harry Potter': '해리포터',
      'Ron weasley': '론 위즐리',
      'Hermione Granger': '헤르미온느 그레인저'
  };
  print(dictionary);
  // 설정한 자료형에 맞게 매핑
  Map<String, bool> isHarryPotter = {
      'Harry Potter': true,
      'Ron Weasley': true,
      'Ironman': false
  };
  // 안에 있는 요소들 모두 추가
  isHarryPotter.addAll({
      'Spiderman': false
  });
  print(isHarryPotter);
  print(isHarryPotter['Ironman']);    // 해당 key에 맞는 value를 반환

  isHarryPotter['Hulk'] = false;  // 이와 같은 방식으로 추가 및 수정 가능
  print(isHarryPotter);

  isHarryPotter.remove('Harry Potter');   // 제거
  print(isHarryPotter);

  print(isHarryPotter.keys);  // Map의 key들만 가져옴
  print(isHarryPotter.values);  // Map의 value들만 가져옴

  // 7. Set
  // 중복 값들을 알아서 처리 -> 중복 제거
  final Set<String> names = {
  'Code Factory',
  'Flutter',
  'BlackPink'
  };
  print(names);
  names.add('Jenny'); // 원소 추가
  names.remove('Jenny');  // 원소 삭제
  print(names.contains('Flutter'));  // 원소 포함 여부 반환

  // 8. 조건문
  // 1) if문
  int num = 3;

  if (num % 3 == 0) {
  print('나머지가 0입니다.');
  } else if (num % 3 == 1) {
  print('나머지가 1입니다.');
  } else {
  print('나머지가 2입니다.');
  }

  // 2) switch문
  // 반드시 break를 사용해야 함
  switch (num % 3) {
  case 0:
      print('나머지가 0입니다.');
      break;
  case 1:
      print('나머지가 1입니다.');
      break;
  case 2:
      print('나머지가 2입니다.');
      break;
  default:
      print('값이 잘못되었습니다.');
      break;
  }

  // 9. loop문
  // 1) for loop
  int total = 0;
  List<int> numbers2 = [1, 2, 3, 4, 5, 6];

  for (int i=0; i < numbers2.length; i++) {
  total += numbers2[i];
  }
  print(total);

  total = 0;
  for (int number in numbers2) {
  total += number;
  }

  // 2) while loop
  total = 0;
  while (total < 10) {
  total += 1;
  }
  print(total);

  // 3) do-while loop
  total = 0;
  do {
  total += 1;
  } while (total < 10);
  print(total);

  // 10. enum
  // 정해진 몇 가지 타입만 사용할 수 있게 함. 
  // 오타가 났을 때 에러를 발생시킴으로써 빠른 에러 수정이 가능.
  Status status = Status.approved;

  if (status == Status.approved) {
  print('승인입니다.');
  } else if (status == Status.pending) {
  print('대기입니다.');
  } else {
  print('거절입니다.');
  }

  // 11. function
  addNumbers(10, 20, 30);
  // 둘은 같은 결과값을 반환함.
  addNumbers2(x: 10, y:30, z: 40);
  addNumbers2(y: 30, x: 10, z: 40);

  // 12. typedef
  Operation operation = add;  // add 함수 할당
  int result = operation(10, 20, 30);
  print(result);

  operation = subtract;
  int result2 = operation(10, 20, 30);
  print(result2);

  int result3 = calculate(30, 40, 50, add);
  print(result3);
}
