// 원시 타입 vs 객체 타입 
// 1. 원시 타입 = 불변값
// Number, String, Boolean etc.
// : 값 자체로써 변수에 저장되고 복사됨.
// : 실제 메모리 내 값이 수정되지 않기 때문에 불변값이라고 함.
// Ex> let p1 = 3; p1 = 4;  => 3에서 4로 값 변경
//     메모리에 3을 저장하고 그 공간을 p1이 가리키다가, 4로 값 변경 시 메모리에 4를 저장하고 그 공간을 p1이 가리키는 식으로 동작.

// 2. 객체 타입 = 가변값
// Object, Array, Function etc.
// : 참조값을 통해 변수에 저장되고 복사됨.
// : 메모리에 객체 정보를 저장하고, 객체 변수는 그 저장된 공간의 참조값을 저장한 메모리 공간을 가리킴.
// Ex> let o1 = { name: "정지수" }; let o2 = o1;
//     o2를 통해 객체의 프로퍼티를 변경할 경우 o1의 프로퍼티도 같이 변경됨 (!)

// 객체 타입 주의사항
// 1) 의도치 않게 값이 수정될 수 있음. (얕은 복사) => 객체 복사 시 spread 연산자를 사용해서 객체 내부 값만 복사해 올 수 있게 할 것. (깊은 복사)
// 2) 객체 간의 비교는 기본적으로 객체값이 아니라 참조값을 기준으로 이루어짐. => 같은 객체를 가리키는지 여부를 나타냄.
//    * 얕은 비교(참조값을 기준으로 비교) : o1 === o2
//    * 깊은 비교(객체를 문자열로 변환해서 비교) : JSON.stringify(o1) === JSON.stringify(o2)
// 3) 배열과 함수도 사실 객체.