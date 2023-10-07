// DateTime and Duration

void main() {
  // 시간
  DateTime now = DateTime.now();

  print(now);
  print(now.year);
  print(now.month);
  print(now.day);
  print(now.hour);
  print(now.minute);
  print(now.second);
  print(now.millisecond);
  print('');

  // 기간
  Duration duration = Duration(seconds: 60);

  print(duration);
  print(duration.inDays);
  print(duration.inHours);
  print(duration.inMinutes);
  print(duration.inSeconds);
  print(duration.inMilliseconds);
  print('');

  // 날짜
  DateTime specificDay = DateTime(
      // year, month, day, hour, minute, second, millisecond
      // year만 필수, 나머지는 optional
      2023,
      8,
      28,
      16,
      10,
      20);
  print(specificDay);
  // 사용 예시
  // duration으로 받는 걸 확인할 수 있음
  final difference = now.difference(specificDay); // 현재 시간과의 차이
  print(difference);
  print(difference.inDays); // 날짜 수로 받기
  print(difference.inHours); // 시간 수로 받기
  // 비교
  print(now.isAfter(specificDay)); // now가 specificDay보다 after인지 아닌지
  print(now.isBefore(specificDay)); // now가 specificDay보다 before인지 아닌지
  print('');
  // 연산
  print(now);
  print(now.add(Duration(hours: 10))); // 10시간 더하기 연산
  print(now.subtract(Duration(seconds: 20))); // 20초 빼기 연산
  print('');
}
