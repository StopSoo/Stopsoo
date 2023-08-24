// asynchronous programming : 비동기 프로그래밍
// 작업1이 시작되고 작업1이 마무리되는 시간까지 CPU를 사용할 수 있는 프로그래밍
// 동기 프로그래밍보다 CPU thread를 이용하는 데 훨씬 효율적
Future<void> main() async {
  // (1) 기본 함수 사용
  addNumbers(1, 1);
  addNumbers(2, 2);

  // Future - 미래
  // 미래에 받아올 값, 아래와 같이 설정 가능
  Future<String> name = Future.value('정지수');
  Future<int> number = Future.value(25);
  Future<bool> isTrue = Future.value(true);

  print('함수 시작 !');
  // delayed
  // 2개의 파라미터를 필요로 함
  // 첫 번째 파라미터 : 지연할 기간 - Duration
  // 두 번째 파라미터 : 지연 시간이 지난 후 실행할 함수
  // Ex>
  Future.delayed(Duration(seconds: 2), () {
    print('Delay 끝 !');
  });
  // (2) delayed를 활용한 함수 사용하기
  // delayed를 사용한 부분이 가장 마지막에 나오는 것을 확인할 수 있다.
  addNumbers2(1, 1);
  addNumbers2(2, 2);

  // (3) await를 활용한 함수 사용하기
  // CPU는 쉬지 않고 다음 작업을 실행한다.
  addNumbers3(1, 1);
  addNumbers3(2, 2);
  // 만약 이 함수들도 순서에 맞게 실행하고 싶다면
  // 1) main() 함수에 async 키워드, 각각의 함수에 await 키워드를 붙인다.
  // 2) 실행하는 함수가 Future를 리턴해야 하므로 addNumbers3 함수의 반환형을 Future<void>로 변경한다.

  // (4) Future를 리턴하는 함수를 사용하여 값 받기
  // await을 반드시 작성할 것
  final result1 = await addNumbers4(1, 1);
  final result2 = await addNumbers4(1, 1);
  print('result1: $result1');
  print('result2: $result2');
  print('result1 + result2 = ${result1 + result2}');
}

// 기본 함수 : 무조건 하나의 작업이 끝난 후 다음 작업이 실행된다.
void addNumbers(int number1, int number2) {
  print('계산 중: $number1 + $number2');
  print('계산 완료: ${number1 + number2}');
  print('---------------------');
}

// delayed를 사용한 함수
// delayed가 실행되는 동안 CPU도 일을 하기 때문에 계산 시작 -> 함수 완료로 넘어가게 된다.
void addNumbers2(int number1, int number2) {
  print('계산 시작: $number1 + $number2');

  Future.delayed(Duration(seconds: 2), () {
    print('계산 완료: $number1 + $number2 = ${number1 + number2}');
  });

  print('함수 완료 !');
  print('---------------------');
}

// async & await 키워드 사용하기 (둘을 같이 사용)
// delayed가 실행되는 동안 다음 코드를 실행하지 않고 기다린다.
// Future를 리턴하는 함수만 await을 사용할 수 있다. (!)
void addNumbers3(int number1, int number2) async {
  print('계산 시작: $number1 + $number2');
  // 서버 시뮬레이션
  await Future.delayed(Duration(seconds: 2), () {
    print('계산 완료: $number1 + $number2 = ${number1 + number2}');
  });

  print('함수 완료 !');
  print('---------------------');
}

// Future를 리턴하나 int형이므로 다음과 같이 반환형을 작성한다.
Future<int> addNumbers4(int number1, int number2) async {
  print('계산 시작: $number1 + $number2');
  // 서버 시뮬레이션
  await Future.delayed(Duration(seconds: 2), () {
    print('계산 완료: $number1 + $number2 = ${number1 + number2}');
  });

  print('함수 완료 !');

  return number1 + number2;
}
