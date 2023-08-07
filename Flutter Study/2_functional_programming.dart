// functional programming

void main() {
  List<String> blackPink = ['로제', '지수', '제니', '리사'];

  print(blackPink);
  print(blackPink.asMap()); // List를 Map으로 형 변환 => key 값은 0부터 시작
  print(blackPink.toSet()); // List를 Set으로 형 변환

  Map blackPinkMap = blackPink.asMap();
  print(blackPinkMap.keys); // iterable 형태로 형 변환
  print(blackPinkMap.values); // iterable 형태로 형 변환
  print(blackPinkMap.keys.toList());  // iterable을 List 형태로 형 변환
  print(blackPinkMap.values.toList());  // iterable을 List 형태로 형 변환

  Set blackPinkSet = Set.from(blackPink); // List로부터 Set를 만드는 방법
  print(blackPinkSet.toList());  // Set을 List로 형 변환

  // map으로 함수 만들기 
  final newBlackPink = blackPink.map((x) {
    return '블랙핑크 $x'; 
  });
  print(blackPink);
  print(newBlackPink);

  // 위 함수를 arrow 함수를 이용하여 더 간단하게 만들기 
  final newBlackPink2 = blackPink.map((x) => '블랙핑크 $x');
  print(newBlackPink2);

  print(blackPink == blackPink);
  print(newBlackPink == blackPink);
  print(newBlackPink == newBlackPink2); // map을 사용하면 아예 새로운 iterable을 반환하기 때문에 false가 나옴 !

  // Ex1> [1.jpg, 3.jpg, 5.jpg, 7.jpg, 9.jpg]
  String number = '13579';
  final parsed  = number.split('').map((x) => '$x.jpg').toList();
  print(parsed);

  // Ex2> Map도 map을 이용해서 값을 변경할 수 있다. 
  Map<String, String> harryPotter = {
    'Harry Potter': '해리 포터',
    'Ron Weasley': '론 위즐리',
    'Hermione Granger': '헤르미온느 그레인저'
  };

  final result = harryPotter.map(
    (key, value) => MapEntry(
      'Harry Potter Character $key',
      '해리포터 캐릭터 $value',
    )
  );
  print(harryPotter);
  print(result);

  final keys = harryPotter.keys.map((x) => 'Harry Potter Character $x').toList();
  final values = harryPotter.values.map((x) => '해리포터 $x').toList();
  print(keys);
  print(values);

  // Ex3> Set도 map을 이용해서 값을 변경할 수 있다. 
  Set blackPinkSet2 = {
    '로제', '지수', '제니', '리사'
  };
  final newSet = blackPinkSet2.map((x) => '블랙핑크 $x').toSet();
  print(newSet);

  // where 사용하기 : 조건에 맞는 값만 추출하기
  List<Map<String, String>> people = [
    {
      'name': '로제',
      'group': '블랙핑크'
    },
    {
      'name': '지수',
      'group': '블랙핑크'
    },
    {
      'name': '제이홉',
      'group': '방탄소년단'
    },
    {
      'name': '뷔',
      'group': '방탄소년단'
    }
  ];
  print(people);

  final isBlackPink = people.where((x) => x['group'] == '블랙핑크').toList();
  print(isBlackPink);
}