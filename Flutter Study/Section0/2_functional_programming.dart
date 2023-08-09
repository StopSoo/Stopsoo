// functional programming

void main() {
  List<String> blackPink = ['로제', '지수', '제니', '리사'];

  print(blackPink);
  print(blackPink.asMap()); // List를 Map으로 형 변환 => key 값은 0부터 시작
  print(blackPink.toSet()); // List를 Set으로 형 변환

  Map blackPinkMap = blackPink.asMap(); // List를 Map 형태로 형 변환
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


  // reduce 사용하기 : iterable
  // reduce를 사용하면 List의 첫 번째 원소가 prev, 두 번째 원소가 next에 들어가고
  // return으로 설정한 값이 다음 loop의 prev에 들어간다. 
  // Ex1>
  List<int> numbers = [
    1, 3, 5, 7, 9
  ];
  final process = numbers.reduce((prev, next) {
    print('------------------');
    print('previous : $prev');
    print('next : $next');
    print('total : ${prev + next}');

    return prev + next;
  });
  print(process);
  // 위 함수를 arrow 함수를 사용해서 간단하게 표현
  final process_ = numbers.reduce((prev, next) => prev + next);
  print(process_);

  // Ex2> String
  List<String> words = [
    '안녕하세요 ',
    '저는 ',
    '정지수입니다.'
  ];
  final sentence = words.reduce((prev, next) => prev + next); 
  print(sentence);
  // 아래와 같이 List의 자료형과 reduce의 반환값 자료형이 다를 경우 error ! 
  // reduce의 약점이라고 할 수 있다. 
  // words.reduce((prev, next) => prev.length + next.length);


  // fold 사용하기
  // 1. reduce와 거의 같으나 자료형에 제약이 없음
  // 2. 그렇기 때문에 generic으로 fold 옆에 자료형을 선언해주어야 한다 (!)
  // 3. reduce와 다르게 처음 prev로 들어가는 값을 따로 지정해주어야 한다.

  // 위에서 선언한 numbers List 사용 !
  final num_sum = numbers.fold<int>(0, (prev, next) {
    print('------------------');
    print('previous : $prev');
    print('next : $next');
    print('total : ${prev + next}');

    return prev + next;
  });
  print(num_sum);
  // 위 함수를 arrow 함수를 사용해서 간단하게 표현
  final num_sum_ = numbers.fold<int>(0, (prev, next) => prev + next);
  print(num_sum_);

  // 위에서 선언한 words List 사용 !
  final sentence_ = words.fold<String>('', (prev, next) => prev + next);
  print(sentence_);
  // reduce와 다르게 아래와 같이 String List를 이용해 int 값을 반환할 수 있다 (!)
  final count = words.fold<int>(0, (prev, next) => prev + next.length);
  print(count);


  // cascading operator
  // ... 사용
  List<int> even = [2, 4, 6, 8];
  List<int> odd = [1, 3, 5, 7];
  print([even, odd]); // 리스트 안에 각각의 리스트가 들어가 이중 리스트 형태가 된다.
  print([...even, ...odd]); // 리스트 안에 두 리스트가 퍼져 들어가 일차원 리스트 형태가 된다.
  // 아래 두 형태는 같은 결과를 나타내지만, 두 리스트가 동일한 리스트는 아니다.
  print(even);
  print([...even]);
  print(even == [...even]); // false


  // class화하기 => 구성을 체계화
  // Ex>
  List<Map<String, String>> peoples = [
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
  print(peoples);

  // map을 통해서 class화하기
  // 단순히 x['name']과 x['group']이라고 했을 때 error가 나는 이유는 해당 key가 List에 있는지 확실하지 않기 때문.
  // 따라서 뒤에 !를 붙여서 이 key들이 존재한다는 것을 확실하게 한다. 
  final parsedPeoples = peoples.map((x) => Person(
    name: x['name']!,
    group: x['group']!
  )).toList();
  print(parsedPeoples);

  for (Person person in parsedPeoples) {
    print(person.name);
    print(person.group);
  }

  final bts = parsedPeoples.where(
    (x) => x.group == 'BTS'
  );
  print(bts); // 오버라이딩된 toString 함수를 통해 출력된다.
}

class Person {
  final String name;
  final String group;

  Person({
    required this.name,
    required this.group
  });

  // 오버라이딩하는 이유 :  map을 통해서 class화한 parsedPeoples를 그냥 출력하면 Person 객체들로만 출력되기 때문에
  // 원하는 형태로 출력하기 위해 원래 존재하는 toString 함수를 오버라이딩한다.
  @override
  String toString() {
    return 'Person(name: $name, group: $group)';
  }
}