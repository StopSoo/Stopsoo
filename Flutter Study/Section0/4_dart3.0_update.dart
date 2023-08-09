// dart 3.0 update
void main() {
  final result = nameAndAge({'name': '민지', 'age': 20});
}

// Record
// ()를 사용하여 순서와 타입을 보장
(String, int) nameAndAge(Map<String, dynamic> json) {
  return (json['name'] as String, json['age'] as int);
}
