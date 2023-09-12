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