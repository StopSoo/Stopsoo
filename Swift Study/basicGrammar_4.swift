import Swift

/* 16. 클로저 기본 */
// 코드의 블럭
// 일급 시민 (first-citizen)
// 변수, 상수 등으로 저장, 전달 인자로 전달이 가능
// 함수 : 이름이 있는 클로저

/* 정의 */
// { (매개변수 목록) -> 반환 타입 in
//      실행 코드
// }
// 매개변수 X, 반환 타입 X 경우
// { () -> Void in
//      실행 코드
// }

// 함수를 사용한다면
func sumFunction(a: Int, b: Int) -> Int {
    return a + b
}

var sumResult: Int = sumFunction(a: 1, b: 2)    // 함수의 일반적 사용

// 클로저의 사용
var sum: (Int, Int) -> Int = { (a: Int, b: Int) -> Int in
    return a + b
}

sumResult = sum(1, 2)
print(sumResult)    // 3

// 함수는 클로저의 일종이므로
// sum 변수에는 당연히 함수도 할당할 수 있습니다.
sum = sumFunction(a:b:)
sumResult = sum(1, 2)
print(sumResult)    // 3

/* 함수의 전달 인자로서의 클로저 */
let add: (Int, Int) -> Int
add = { (a: Int, b: Int) -> Int in
    return a + b
}

let subtract: (Int, Int) -> Int
subtract = { (a: Int, b: Int) -> Int in
    return a - b
}

let divide: (Int, Int) -> Int
divide = { (a: Int, b: Int) -> Int in
    return a / b
}

func calculate(a: Int, b: Int, method: (Int, Int) -> Int) -> Int {
    return method(a, b)
}

// 사용 예시
var calculated: Int
calculated = calculate(a: 50, b: 10, method: add)
print(calculated)   // 60
calculated = calculate(a: 50, b: 10, method: subtract)
print(calculated)   // 40
calculated = calculate(a: 50, b: 10, method: divide)
print(calculated)   // 5

// 이와 같이 뒤에 전달 인자로 바로 코드 블럭을 넘겨주는 것도 가능
// 실행 가능한 코드들을 묶어서 바로 함수로 넘겨준다. 
calculated = calculate(a: 50, b: 10, method: (left: Int, right: Int) -> Int {
    return left * right;
})
print(calculated)   // 500


/* 17. 클로저 고급 */