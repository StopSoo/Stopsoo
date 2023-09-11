/* 1. naming | console log | expression in string */
/* 콘솔로그와 문자열 보간법 */
import Swift

let age: Int = 10

// \()에서 괄호 안에 변수를 넣어, 문자열 안에서 변수 값 표현 가능
"안녕하세요! 저는 \(age)살입니다."  
// == "안녕하세요! 저는 10살입니다."

// 수식 계산 가능
"안녕하세요! 저는 \(age + 5)살입니다."
// == "안녕하세요! 저는 15살입니다."

print("안녕하세요! 저는 \(age + 5)살입니다.")
print("--------------------------------\n")

class Person {
    var name: String = "JiSoo"
    var age: Int = 10
}

let JiSoo: Person = Person()

// print : 단순히 JiSoo가 Person instance인 것만 알 수 있음
print(JiSoo)
print("--------------------------------\n")

// dump : JiSoo라는 instance 내에 어떤 값들이 들어있는지도 알 수 있음
dump(JiSoo)


/* 2. 상수와 변수 */
// (!) Swift는 띄어쓰기에 굉장히 민감하다.

// 상수, 변수의 선언
// 상수 선언 키워드 Let
// 변수 선언 키워드 var

// 상수의 선언
// let 이름: 타입 = 값

// 변수의 선언
// var 이름: 타입 = 값

// 값의 타입이 명확하다면 타입은 생략 가능
// let 이름 = 값
// var 이름 = 값

let constant: String = "차후에 변경이 불가능한 상수 let"
var variable: String = "차후에 변경이 가능한 변수 var"

variable = "변수는 이렇게 차후에 다른 값을 할당할 수 있지만"
// constant = "상수는 차후에 값을 변경할 수 없습니다."  // 오류 발생

// 상수 선언 후에 나중에 값 할당하기

// 나중에 할당하려고 하는 상수나 변수는 타입을 꼭 명시해주어야 한다.
let sum: Int
let inputA: Int = 100
let inputB: Int = 200

// 선언 후 첫 할당
sum = inputA + inputB

// sum = 1 // 그 이후에는 다시 값을 바꿀 수 없다. 오류 발생 !

// 변수도 물론 차후에 할당하는 것이 가능하다.
var nickName: String

nickName = "JiSoo"

// 변수는 차후에 다시 다른 값을 할당해도 문제가 없다.
nickName = "지수"