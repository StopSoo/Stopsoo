// Section 12 : Map Fucntion Practice

void main() {
  final number = 123;

  print(number.toString());
  print(number.toString().runtimeType);
  print(number.toString().split('')); // 리스트로 반환
  print(number.toString().split('').map((x) => '$x.jpg').toList());

  final numbers = [123, 456, 789];

  print(
    numbers.map(
      (x) => x.toString().split('').map((e) => '$e.jpg').toList()
    ).toList()
  );

  // Map - entries : key는 인덱스, value는 리스트 값이 들어온다.
  print(numbers.asMap().entries);
}