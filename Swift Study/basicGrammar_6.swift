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


/* 27. 오류 처리 */
/* 
오류 표현 
Error 프로토콜과 (주로) 열거형을 통해서 오류를 표현
*/

/*
enum 오류 종류 이름: Error {
    case 종류1
    case 종류2
    case 종류3
    ...
}
*/

// 자판기 동작 오류의 종류를 표현한 VendingMachineError 열거형
enum VendingMachineError: Error {
    case invalidInput
    case insufficientFunds(moneyNeeded: Int)
    case outOfStock
}

/* 
함수에서 발생한 오류 던지기 
- 자판기 동작 도중 발생한 오류 던지기
- 오류 발생의 여지가 있는 메서드는 throws를 사용하여 오류를 내포하는 함수임을 표시
*/

class VendingMachine {
    let itemPrice: Int = 100
    var itemCount: Int = 5
    var deposited: Int = 0

    // 돈 받기 메서드 (오류 발생의 여지가 있음을 표현)
    func receiveMoney(_ money: Int) throws {
        // 입력한 돈이 0 이하면 오류를 던짐
        guard money > 0  else {
            throw VendingMachineError.invalidInput
        }
        // 오류가 없으면 정상 처리
        self.deposited += money
        print("\(money)원 받음")
    }

    // 물건 팔기 메서드
    func vend(numberOfItems numberOfItemsToVend: Int) throws -> String {
        // 원하는 아이템의 수량이 잘못 입력되었으면 오류를 던짐
        guard numberOfItemsToVend > 0  else {
            throw VendingMachineError.invalidInput
        }
        // 구매하려는 수량보다 미리 넣어둔 돈이 적으면 오류를 던짐
        guard numberOfItemsToVend * itemPrice <= deposited else {
            let moneyNeeded: Int
            moneyNeeded = numberOfItemsToVend * itemPrice - deposited

            throw VendingMachineError.insufficientFunds(moneyNeeded: moneyNeeded)
        }
        // 구매하려는 수량보다 요구하는 수량이 많으면 오류를 던짐
        guard itemCount >= numberOfItemsToVend else {
            throw VendingMachineError.outOfStock
        }
        // 오류가 없으면 정상 처리
        let totalPrice = numberOfItemsToVend * itemPrice

        self.deposited -= totalPrice
        self.itemCount -= numberOfItemsToVend

        return "\(numberOfItemsToVend)개 제공"
    }
}

let machine: VendingMachine = VendingMachine()  // 자판기 인스턴스
var result: String?     // 판매 결과를 전달 받을 변수

/* 
오류 처리 
- 오류 발생의 여지가 있는 throws 함수(메서드)는 try를 사용하여 호출
- try | try? | try!

*/

/* 
do-catch 
- 오류 발생의 여지가 있는 throws 함수(메서드)는 do-catch 구문을 활용하여 오류 발생에 대비
*/

// 방법 1
do {
    try machine.receiveMoney(0)
} catch VendingMachineError.invalidInput {
    print("입력이 잘못되었습니다.")
} catch VendingMachineError.insufficientFunds(let moneyNeeded) {
    print("\(moneyNeeded)원이 부족합니다.")
} catch VendingMachineError.outOfStock {
    print("수량이 부족합니다.")
}   // 입력이 잘못되었습니다.

// 방법 2 (catch 축소)
do {
    try machine.receiveMoney(300)
} catch /*(let error)*/ {   // error라는 변수는 암시적으로 catch문으로 넘어옴 
    switch error {
        case VendingMachineError.invalidInput:
            print("입력이 잘못되었습니다.")
        case VendingMachineError.insufficientFunds(let moneyNeeded):
            print("\(moneyNeeded)원이 부족합니다.")
        case VendingMachineError.outOfStock:
            print("수량이 부족합니다.")
        default:
            print("알 수 없는 오류 \(error)")
    }
}   // 300원 받음

// 방법 3 (더 간단)
do {
    result = try machine.vend(numberOfItems: 4)
} catch {
    print(error)
}   // insufficientFunds(100)

// 방법 4 (훨씬 더 간단)
do {
    result = try machine.vend(numberOfItems: 4)
}


/* try?와 try! */
/*
try?
- 별도의 오류 처리 결과를 통보 받지 않고
- 오류가 발생했으면 결과값을 nil로 돌려 받을 수 있음
- 정상 동작 후에는 옵셔널 타입으로 정상 반환값을 돌려 받음
*/

result = try? machine.vend(numberOfItems: 2)
result  // Optional("2개 제공")

result = try? machine.vend(numberOfItems: 2)
result  // nil

/*
try!
- 오류가 발생하지 않을 것이라는 강력한 확신을 가질 때
- try!를 사용하면 정상 동작 후에 바로 결과값을 돌려 받음
- 오류가 발생하면 런타임 오류가 발생하여 애플리케이션 동작이 중지됨
*/

result = try! machine.vend(numberOfItems: 1)
result  // 1개 제공

// result = try! machine.vend(numberOfItems: 1)


/* 28. 고차 함수 */
// 전달 인자로 함수를 전달 받거나
// 함수 실행의 결과를 함수로 반환하는 함수

// map, filter, reduce

/* 
map 
- 컨테이너 내부의 기존 데이터를 변형하여 새로운 컨테이너를 생성
*/

let numbers: [Int] = [0, 1, 2, 3, 4]
var doubledNumbers: [Int]
var strings: [String]

/* for 구문 사용 */
doubledNumbers = [Int]()
strings = [String]()

for number in numbers {
    doubledNumbers.append(number * 2)
    string.append("\(number)")
}

print(doubledNumbers)   // [0, 2, 4, 6, 8]
print(strings)          // ["0", "1", "2", "3", "4"]

/* map 메서드 사용 */
// numbers의 각 요소를 2배 하여 새로운 배열 반환 
doubledNumbers = numbers.map({ (number: Int) -> Int in
    return number * 2
})

// numbers의 각 요소를 문자열로 변환하여 새로운 배열 반환
strings = numbers.map({ (number: Int) -> String in 
    return "\(number)"
})

print(doubledNumbers)   // [0, 2, 4, 6, 8]
print(strings)          // ["0", "1", "2", "3", "4"]

// 매개변수, 반환 타입, 반환 키워드(return) 생략, 후행 클로저
doubledNumbers = numbers.map{ $0 * 2 }

/* filter */
// 컨테이너 내부의 값을 걸러서 새로운 컨테이너로 추출

/* 
for 구문 사용
- 변수 사용에 주목할 것
*/
var filtered: [Int] = [Int]()
for number in numbers {
    if number % 2 == 0 {
        filtered.append(number)
    }
}
print(filtered) //[0, 2, 4]

/* 
filter 메서드 사용 
- numbers의 요소 중 짝수를 걸러내어 새로운 배열로 반환
- for문을 사용한 것과 비교하면 상수로도 받아올 수 있다는 장점이 있음 (변수도 상관X)
*/
let evenNumbers: [Int] = numbers.filter {
    (number: Int) -> Bool in
    return number % 2 == 0
}
print(evenNumbers)  // [0, 2, 4]

// 매개변수, 반환 타입, 반환 키워드(return) 생략, 후행 클로저
let oddNumbers: [Int] = numbers.filter {
    $0 % 2 != 0
}
print(oddNumbers)   // [1, 3]

/* 
reduce 
- 컨테이너 내부의 콘텐츠를 하나로 통합
*/
let someNumbers: [Int] = [2, 8, 15]

/* 
for 구문 사용
- 변수 사용에 주목할 것
*/
var result: Int = 0

// someNumbers의 모든 요소를 더함
for number in someNumbers {
    result +=  number
}
print(result)   // 25

/* 
reduce 메서드 사용 
- 초기 값이 0이고 someNumbers 내부의 모든 값을 더함
*/
let sum: Int = someNumbers.reduce(0, {  // 0부터 시작
    (first: Int, second: Int) -> Int in

    return first + second
})
print(sum)  // 25

// 초기 값이 0이고 someNumbers 내부의 모든 값을 뺌
var subtract: Int = someNumbers.reduce(0, { // 0부터 시작
    (first: Int, second: Int) -> Int in

    return first - second
})
print(subtract) // -25

// 초기 값이 3이고 someNumbers 내부의 모든 값을 더함
let sumFromThree = somenumbers.reduce(3) { $0 + $1 }
print(sumFromThree) // 28