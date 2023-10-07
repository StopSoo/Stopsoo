// Stream
// Future와 다르게 실행 시작한 작업이 완료가 될 때까지 계속해서 반환값을 받을 수 있다.
import 'dart:async';

void main() {
  final controller = StreamController(); // dart async package에서 불러오는 class
  // stream은 한 번만 listen할 수 있어서, 여러 번 listen하고 싶다면 stream.asBroadcastStream()을 사용한다.
  final stream = controller.stream.asBroadcastStream();

  final streamListener1 = stream.listen((val) {
    // 받아온 값을 변수 val에 넣는다.
    print('Listener1: $val');
  });

  final streamListener2 = stream.listen((val) {
    // 여러 개의 listener를 만들 수 있다.
    print('Listener2: $val');
  });

  // stream은 여러 반환값을 가질 수 있다.
  // listener가 여러 개일 경우 각 listener마다 값을 출력한다.
  controller.sink.add(1);
  controller.sink.add(2);
  controller.sink.add(3);
  controller.sink.add(4);
  controller.sink.add(5);

  // where 키워드를 사용해서 listener 선언 시 조건을 설정할 경우, 조건에 해당하는 listener만 값을 출력한다.
  final streamListener3 = stream.where((val) => val % 2 == 1).listen((val) {
    print('Listener3: $val');
  });

  // stream 함수 사용하기
  calculate(1).listen((val) {
    print('calculate(1): $val');
  });

  // yield* 사용하기
  playAllStream().listen((val) {
    print(val);
  });
}

// 반환형을 stream이 아닌 future로 했다면 인수로 받은 number가 함수에 들어가서 한 번만 출력됨
// 이 문제를 stream으로 해결하면 계속해서 반환값을 받을 수 있음 !
// Future<int> => Stream<int>
// async => async*
// return => yield
Stream<int> calculate(int number) async* {
  for (int i = 0; i < 5; i++) {
    yield i * number;
    // async*이어도 async 함수처럼 await 사용 가능
    await Future.delayed(Duration(seconds: 1));
  }
}

// yield는 하나씩 반환하지만 yield*는 뒤에 오는 함수의 모든 반환값을 반환한 후 다음을 실행한다.
Stream<int> playAllStream() async* {
  yield* calculate(1);
  yield* calculate(1000);
}
