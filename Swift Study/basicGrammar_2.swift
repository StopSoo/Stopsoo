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
func sayHelloToFriends(me: String, friends: String...) -> String {
    return "Hello \(friend)! I'm \(me)!"
}
print(sayHelloToFriends(me: "JiSoo", friends: "hana", "eric", "wing"))