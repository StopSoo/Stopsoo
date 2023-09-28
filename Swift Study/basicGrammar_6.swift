import Swift

/* 24. assert와 guard */
/* Assertion */
/*
- assert(_:_:file:line:) 함수를 사용
- assert 함수는 디버깅 모드에서만 동작, 배포하는 애플리케이션에서는 제외됨
- 주로 디버깅 중 조건의 검증을 위하여 사용
*/

var someInt: Int = 0
// someInt == 0을 검사
// 맞을 경우는 그냥 지나치지만, 아닐 경우 해당 메시지를 반환하고 중지시킴
assert(someInt == 0, "someInt != 0")

someInt = 1
// assert(someInt == 0) // 동작 중지, 검증 실패
// assert(someInt == 0, "someInt != 0") // 동작 중지, 검증 실패 후 아래와 같은 메시지 출력
// assertion failed: someInt != 0: file guard_assert.swift, line 26

func functionWithAssert(age: Int?) {
    assert(age != nil, "age == nil")
    assert((age! >= 0) && (age! <= 130), "나이값 입력이 잘못되었습니다.")
    // assert 구문을 다 통과하면 아래 print문이 실행됨
    print("당신의 나이는 \(age!)세입니다.")
}
functionWithAssert(age: 50)
// functionWithAssert(age: -1) // 동작 중지, 검증 실패
// functionWithAssert(age: nil)    // 동작 중지, 검증 실패

/* Early Exit */
/*
- guard를 사용하여 잘못된 값의 전달 시 특정 실행 구문을 빠르게 종료
- 디버깅 모드 뿐만 아니라 어떤 조건에서도 동작
- guard의 else 블럭 내부에는 특정 코드 블럭을 종료하는 지시어(return, break 등)가 꼭 있어야 함
- 타입 캐스팅, 옵셔널과도 자주 사용됨
- 그 외 단순 조건 판단 후 빠르게 종료할 때도 용이
*/

func functionWithGuard(age: Int?) {
    guard let unwrappedAge = age,   // 옵셔널 바인딩을 먼저 실행 
        unwrappedAge < 130,
        unwrappedAge >= 0 else {
            print("나이값 입력이 잘못되었습니다.")
            return
        }
    // guard는 if-let과 다르게 매개변수를 아래에서도 사용할 수 있게 해준다 (!)
    print("당신의 나이는 \(unwrappedAge)세입니다.")
}

var count = 1
while true {
    guard count < 3 else {
        break
    }
    print(count)
    count += 1
}
// 1
// 2

func someFunction(info: [String: Any]) {
    guard let name = info["name"] as? String else {
        return
    }
    
    guard let age = info["age"] as? Int, age >= 0 else {
        return
    }

    print("\(name): \(age)")
}

someFunction(info: ["name" : "jenny", "age": "10"])
someFunction(info: ["name" : "mike"])
someFunction(info: ["name" : "jisoo", "age": 10])   // jisoo: 10


/* 25. 프로토콜 */
// 프로토콜은 특정 역할을 수행하기 위한 메서드, 프로퍼티, 이니셜라이저 등의 요구사항을 정의
// 구조체, 클래스, 열거형은 프로토콜을 채택(Adopted)해서 프로토콜의 요구 사항을 실제로 구현할 수 있음
// 어떤 프로토콜의 요구 사항을 모두 따르는 타입은 그 '프로토콜을 준수한다'고 표현
// 프로토콜의 요구사항을 충족시키려면 프로토콜이 제시하는 기능을 모두 구현해야 함

/* 정의 문법 */
/*
protocol 프로토콜 이름 {
    정의부
}
*/

protocol Talkable {
    // 프로퍼티 요구
    // 프로퍼티 요구는 항상 var 키워드를 사용
    // get : 읽기만 가능해도 상관 없음
    // get과 set을 모두 명시 : 읽기, 쓰기 모두 가능한 프로퍼티
    var topic: String { get set }
    var language: String { get }

    // 메서드 요구
    func talk()

    // 이니셜라이저 요구
    init(topic: String, language: String)
}

/* 프로토콜 채택 및 준수 */

// Person 구조체는 Talkable 프로토콜을 채택
struct Person: Talkable {
    // 저장 프로퍼티
    var topic: String
    let language: String

    // 읽기 전용 프로퍼티 요구는 연산 프로퍼티로 대체가 가능
    // var language: String { return "한국어" }
    // 읽기, 쓰기 프로퍼티도 연산 프로퍼티로 대체 가능
    // var subject: String = ""
    // var topic: String {
    //     set {
    //         self.subject = newValue
    //     }
    //     get {
    //         return self.subject
    //     }
    // }

    func talk() {
        print("\(topic)에 대해 \(language)로 말합니다.")
    }

    init(topic: String, language: String) {
        self.topic = topic
        self.language = language
    }
}

/* 프로토콜 상속 */
/*
프로토콜은 클래스와 다르게 다중 상속이 가능
protocol 프로토콜 이름: 부모 프로토콜 이름 목록 {
    정의부
}
*/
protocol Readable {
    func read()
}
protocol Writeable {
    func write()
}
protocol ReadSpeakable: Readable {
    // func read()
    func speak()
}
protocol ReadWriteSpeakable: Readable, Writeable {
    // func read()
    // func write()
    func speak()
}

struct SomeType: ReadWriteSpeakable {
    // 아래 세 함수를 모두 구현해야만 프로토콜을 준수
    func read() {
        print("Read")
    }
    func write() {
        print("Write")
    }
    func speak() {
        print("Speak")
    }
}

/* 클래스 상속과 프로토콜 */
// 클래스에서 상속과 프로토콜 채택을 동시에 하려면
// 1. 상속 받으려는 클래스를 먼저 명시
// 2. 채택할 프로토콜 목록을 작성
class SuperClass: Readble {
    func read() { print("read") }
}

class SubClass: SuperClass, Writeable, ReadSpeakable {
    func write() { print("write") }
    func speak() { print("speak") }
}

/* 프로토콜 준수 확인 */
// 인스턴스가 특정 프로토콜을 준수하는지 확인 가능
// is, as 연산자 사용
let sup: SuperClass = SuperClass()
let sub: SubClass = SubClass()

var someAny: Any = sup
someAny is Readable         // true
someAny is ReadSpeakable    // false

someAny = sub
someAny is Readable         // true
someAny is ReadSpeakable    // true

someAny = sup

if let someReadable: Readable = someAny as? Readable {
    someReadable.read() // 해당 프로토콜을 따르고 있다면 실행 O
}   // read

if let someReadSpeakable: ReadSpeakable = someAny as? ReadSpeakable {
    someReadSpeakable.speak()   // 해당 프로토콜을 따르고 있지 않다면 실행 X
}   // 동작 X 

someAny = sub

if let someReadable: Readable = someAny as? Readable {
    someReadable.read()
}   // read


/* 26. 익스텐션 */
// 익스텐션은 구조체, 클래스, 열거형, 프로토콜 타입에 새로운 기능을 추가할 수 있는 기능
// 기능을 추가하려는 타입의 구현된 소스 코드를 알지 못하거나 볼 수 없다 해도
// 타입만 알고 있다면 그 타입의 기능을 확장할 수 있음

/* 익스텐션으로 추가할 수 있는 기능 */
// 연산 타입 프로퍼티 | 연산 인스턴스 프로퍼티
// 타입 메서드 | 인스턴스 메서드
// 이니셜라이저
// 서브스크립트
// 중첩 타입
// 특정 프로토콜을 준수할 수 있도록 기능 추가

// 기존에 존재하는 기능을 재정의하는 것은 불가능

/* 문법 정의 */
/*
extension 확장할 타입 이름 {
    타입에 추가될 새로운 기능 구현
}
- 익스텐션은 기존에 존재하는 타입이 추가적으로 다른 프로토콜을 채택할 수 있도록 확장 가능 
*/
/*
extension 확장할 타입 이름: 프로토콜1, 프로토콜2, 프로토콜3 ... {
    프로토콜 요구사항 구현
}
*/

/* 익스텐션 구현 */
/* 연산 프로퍼티 추가 */
extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
    var isOdd: Bool {
        return self % 2 == 1
    }
}

print(1.isEven) // false
print(2.isEven) // true

var number: Int = 3
print(number.isEven)    // false
print(number.isOdd)     // true

/* 메서드 추가 */
extension Int {
    func multiply(by n: Int) -> Int {
        return self * n
    }
}

print(3.multiply(by: 2))    // 6
print(4.multiply(by: 3))    // 12

/* 이니셜라이저 추가 */
extension String {
    init(intTypeNumber: Int) {  // Int -> String
        self = "\(intTypeNumber)"
    }
    init(doubleTypeNumber: Double) {    // Double -> String
        self = "\(doubleTypeNumber)"
    }
}

let stringFromInt: String = String(intTypeNumber: 100)  // "100"
let stringFromDouble: String = String(doubleTypeNumber: 100.0)  // "100.0"






