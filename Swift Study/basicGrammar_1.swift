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
// constant = "상수는 차후에 값을 변경할 수 없습니다." 

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


/* 3. 기본 데이터 타입 */
// Bool, Int, UInt, Float, Double, Character, String
// Swift는 데이터 타입에 있어 굉장히 엄격한 언어 !

/* Bool */
var someBool: Bool = true
someBool = false
// 다른 타입에서 false를 0, true를 1로 사용하는 것을 Swift에서는 사용할 수 없다.
// someBool = 0
// someBool = 1

/* Int */
var someInt: Int = -100
// someInt = 100.1  -> Int에 double 할당 불가능 

/* UInt */
var someUInt: UInt = 100
// someUInt = -100  -> unsigned int에 음수 할당 불가능
// someUInt = someInt   -> unsigned int에 int 할당 불가능

/* Float */
var someFloat: Float = 3.14
someFloat = 3   // Float에 정수 할당 가능 (정수도 실수)

/* Double */
var someDouble: Double = 3.14
someDouble = 3  // Double에 정수 할당 가능 (정수도 실수)
// someDouble = someFloat   -> Double에 Float 할당 불가능

/* Character */
// Unicode로 표현되는 모든 문자는 다 가능
var someCharacter: Character = "🇰🇷"
someCharacter = "😛"
someCharacter = "가"
someCharacter = "A"
// someCharacter = "하하하"
print(someCharacter)

/* String */
var someString: String = "하하하 😛 "
someString = someString + "웃으면 복이 와요"
print(someString)
// someString = someCharacter   -> 문자열 타입에 문자 할당 불가능


/* 4. Any, AnyObject, nil */
/*
    Any - Swift의 모든 타입을 지칭하는 키워드
    AnyObject - 모든 클래스 타입을 지칭하는 프로토콜
    nil - 없음을 의미하는 키워드 
*/

/* Mark: - Any */
var someAny: Any = 100
someAny = "어떤 타입도 수용 가능합니다."
someAny = 123.12
// let someDouble: Double = someAny -> Any 타입을 Double 타입에 할당 불가능

/* Mark: - AnyObject */
class SomeClass {}
var someAnyObject: AnyObject = SomeClass()  // 클래스 인스턴스 생성
// someAnyObject = 123.12   -> 클래스 인스턴스가 아닌 double 타입 값 대입 불가능

/* Mark: - nil */
// someAny = nil    -> Any 타입에 nil 대입 불가능 (빈 값은 들어올 수 없다)
// someAnyObject = nil  -> AnyObject 타입에 nil 대입 불가능 (빈 값은 들어올 수 없다)


/* 5. 컬렉션 타입 */
/* 
    Array : 순서가 있는 리스트 컬렉션
    Dictionary : 키와 값의 쌍으로 이루어진 컬렉션
    Set : 순서가 없고, 멤버가 유일한 컬렉션
*/

/* Mark: - Array */
// 빈 Int Array 생성
var integers: Array<Int> = Array<Int>()
integers.append(1)
integers.append(100)
// integers.append(101.1)   -> 정수 배열에 실수 추가 불가능

integers.contains(100)  // 해당 배열이 100의 값을 가지고 있는지 true/false 반환
integers.contains(99)

integers.remove(at: 0)  // 인덱스 0번째 원소를 제거
integers.removeLast()   // 배열의 가장 마지막 원소를 제거
integers.removeAll()    // 배열의 모든 원소를 제거

integers.count  // 배열 원소의 개수를 반환

// Array<Double>과 [Double]은 동일한 표현
// 빈 Double Array 생성
var doubles: Array<Double> = [Double]()

// 빈 String Array 생성
var Strings: [String] = [String]()

// 빈 Character Array 생성
// []는 새로운 빈 Array
var characters: [Character] = []

// let을 사용하여 Array를 선언하면 불변 Array
let immutableArray = [1, 2, 3]
// immutableArray.append(4) -> 등의 수정이 불가능

/* Mark: - Dictionary */
// Key가 String 타입이고 Value가 Any인 빈 Dictionary 생성
var anyDictionary: Dictionary<String, Any> = [String: Any]()
anyDictionary["someKey"] = "value"
anyDictionary["anotherKey"] = 100
anyDictionary

anyDictionary["someKey"] = "dictionary" // 값 수정 가능
anyDictionary

anyDictionary.removeValue(forKey: "anotherKey") // 해당 키에 대한 값을 제거하는 방법 1
anyDictionary["someKey"] = nil  // 해당 키에 대한 값을 제거하는 방법 2
anyDictionary

let emptyDictionary: [String: String] = [:]
let initializedDictionary: [String: String] = ["name": "JiSoo", "gender": "female"]

// 딕셔너리를 let으로 선언했기 때문에 값 수정이 불가능하다. 
// Ex> emptyDictionary["key"] = "value"
// 해당 딕셔너리의 "name"이라는 key에 대한 value가 있을 수도 있고, 없을 수도 있기 때문에 아래와 같은 코드는 실행X
// let someValue: String = initializedDictionary["name"]

/* Mark: - Set */
// Set는 축약 문법이 없다.

// 빈 Int Set 생성
var integerSet: Set<Int> = Set<Int>()
integerSet.insert(1)
integerSet.insert(100)
integerSet.insert(99)
integerSet.insert(99)
integerSet.insert(99)
integerSet  // 세 번 삽입한 99는 한 번만 추가되어 있는 것을 확인할 수 있음

integerSet.contains(1)  // 해당 원소 포함 여부 반환

integerSet.remove(100)  // 해당 원소 제거
integerSet.removeFirst()    // 집합에서 첫 번째로 있는 원소 제거

integerSet.count    // 집합 원소 개수 반환

let setA: Set<Int> = [1, 2, 3, 4, 5]
let setB: Set<Int> = [3, 4, 5, 6, 7]

let union: Set<Int> = setA.union(setB)
let sortedUnion: [Int] = union.sorted() // 집합은 원래 정렬되어 있지 않으므로 정렬이 필요하다면 이 내장 함수를 사용할 것
let intersection: Set<Int> = setA.intersection(setB)
let subtracting: Set<Int> = setA.subtracting(setB)