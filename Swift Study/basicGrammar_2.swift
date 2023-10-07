/* 6. 함수 기본 */
import Swift

/* Mark: 함수 선언의 기본 형태 */
// func 함수이름 (매개변수1 이름: 매개변수1 타입, 매개변수2 이름: 매개변수2 타입 ... ) -> 반환 타입 {
//  함수 구현부
//  return 반환값
// }

func sum(a: Int, b: Int) -> Int {
    return a + b
}

/* 반환 값이 없는 함수 */
// func 함수이름 (매개변수1 이름: 매개변수1 타입, 매개변수2 이름: 매개변수2 타입 ... ) -> Void {
//  함수 구현부
//  return 반환값
// }

func printMyName(name: String) -> Void {
    print(name)
}

// 아래와 같이 반환 타입 생략 가능
func printYourName(name: String) {
    print(name)
}

/* 매개변수가 없는 함수 */
// func 함수이름() -> 반환 타입 {
//  함수 구현부
//  return 반환값
// }

func maximumIntegerValue() -> Int {
    return Int.max
}

/* 매개변수와 반환 값이 없는 함수 */
// func 함수이름() -> Void {
//  함수 구현부
//  return 
// }

func hello() -> Void { print("hello") }

// func 함수이름() {
//  함수 구현부
//  return
// }

func bye() { print("bye") }

/* 함수의 호출 */
sum(a: 3, b: 5) 
printMyName(name: "JiSoo")
printYourName(name: "SiEun")
maximumIntegerValue()   // Int의 최댓값
hello()
bye()


/* 7. 함수 고급 */

/* MARK: - 매개변수 기본 값 */

// 기본 값을 갖는 매개변수는 매개변수 목록 중에 뒤쪽에 위치하는 것이 좋다. 
// func 함수 이름 (매개변수1 이름: 매개변수1 타입, 매개변수2 이름: 매개변수2 타입 = 매개변수 기본 값 ...)
// -> 반환 타입 {
//  함수 구현부
//  return 반환값
// }

func greeting(friend: String, me: String = "JiSoo") {
    print("Hello \(friend)! I'm \(me)!")
}

// 매개변수 기본 값을 가지는 매개변수는 생략할 수 있다.
greeting(friend: "Hana")
greeting(friend: "John", me: "Eric")

/* MARK: - 전달 인자 레이블 */

// 전달 인자 레이블은 함수를 호출할 때
// 매개변수의 역할을 좀 더 명확하게 하거나
// 함수 사용자의 입장에서 표현하고자 할 때 사용한다.
// func 함수 이름 (전달인자 레이블 매개변수1 이름: 매개변수1 타입, 전달인자 레이블 매개변수2 이름: 매개변수2 타입 ...)
// -> 반환 타입 {
//  함수 구현부
//  return
// }

// 함수 내부에서 전달 인자를 사용할 때에는 매개변수 이름을 사용한다.
func greeting(to friend: String, from me: String) {
    print("Hello \(friend)! I'm \(me)!")
}
// 함수를 호출할 때에는 전달인자 레이블을 사용해야 한다.
greeting(to: "hana", from: "JiSoo")

/* MARK: - 가변 매개변수 */

// 전달 받을 값의 개수를 알기 어려울 때 사용할 수 있다.
// 가변 매개변수는 함수 당 하나만 가질 수 있다.
// func 함수 이름 (매개변수1 이름: 매개변수1 타입, 전달인자 레이블 매개변수2 이름: 매개변수2 타입 ...)
// -> 반환 타입 {
//  함수 구현부
//  return
// }

// String 뒤에 ...은 인수의 개수에 제한이 없다는 뜻 !!
// 전달 인자가 없거나 nil이 들어가면 오류
func sayHelloToFriends(me: String, friends: String...) -> String {
    return "Hello \(friend)! I'm \(me)!"
}
print(sayHelloToFriends(me: "JiSoo", friends: "hana", "eric", "wing"))
print(sayHelloToFriends(me: "JiSoo"))   // friends에 인자를 안 넘길 경우

/*
위에서 설명한 함수의 다양한 모양은 모두 섞어서 사용 가능하다.
*/

/* 데이터 타입으로서의 함수 */

// 스위프트는 함수형 프로그래밍 패러다임을 포함하는 다중 패러다임 언어이다.
// 스위프트의 함수는 일급객체이므로 변수, 상수 등에 저장이 가능하고, 매개변수를 통해 전달할 수도 있다.

/* 함수의 타입 표현 */
// 변환 타입을 생략할 수 없습니다.
// (매개변수1 타입, 매개변수2 타입 ...) -> 반환 타입

var someFunction: (String, String) -> Void = greeting(to:from:)
someFunction("eric", "JiSoo")

someFunction = greeting(friend:me:)
someFunction("eric", "JiSoo")

// 타입이 다른 함수는 할당할 수 없다.
// someFunction = sayHelloToFriend(me: friend:)

func runAnother(function: (String, String) -> Void) {
    function("jenny", "mike")
}

runAnother(function: greeting(friend:me:))

runAnother(function: someFunction)


/* 8. 조건문 */

// 스위프트의 조건에는 항상 Bool 타입이 들어와야 한다. -> Int 등 안됨 !!
// someInteger는 Bool 타입이 아닌 Int타입이기 때문에 컴파일 오류 발생

let someInteger = 100   // 수정 불가능

/* if - else if - else */
if someInteger < 100 {
    print("100 미만")
} else if someInteger > 100 {
    print("100 초과")
} else {
    print("100")
}

/* switch */
// switch value {
// case pattern:
//  code
// default:
//  code
// }

// 범위 연산자 활용하기 (!)
switch someInteger {
case 0:
    print("zero")
case 1..<100:   // 1부터 100 "미만"
    print("1~99")
case 100:
    print("100")
case 101...Int.max: // 101부터 Int.max "이하"
    print("over 100")
default:
    print("unknown")
}

// 정수 외의 대부분의 기본 타입 사용 가능
// 주의 사항 (!)
// 1. default는 반드시 사용할 것
// 2. break는 작성하지 않아도 자동으로 걸린다
// 3. case "cake", "juice": 처럼 여러 개의 키워드 가능
// 4. 기존 다른 언어들이 break를 사용하지 않았을 때 다른 case로 넘어가는 것을 구현하고 싶다면
//    fallthrough 키워드를 사용할 것
switch "cake" {
case "juice":
    print("juice")
    // fallthrough
case "snack":
    print("snack")
case "cake":
    print("cake")
default:
    print("unknown")
}


/* 9. 반복문 */
var integers = [1, 2, 3]
let people = ["JiSoo": 10, "Sieun": 5, "Sooyoung": 0]

/* for - in */
// for item in items { code }
for integer in integers {
    print(integer)
}

// Dictionary의 item은 key와 value로 구성된 튜플 타입
for (name, age) in people {
    print("\(name): \(age)")
}

/* while */
// while condition { code }
while integers.count > 1 {
    integers.removeLast()
}

/* repeat - while */
// do-while문과 비슷하다고 할 수 있음
// repeat {
//  code    
// } while condition

repeat {
    integers.removeLast()
} while integers.count > 0
