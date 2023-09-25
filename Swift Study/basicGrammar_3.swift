import Swift
/* 10. 옵셔널 */
// Optional : 값이 있을 수도, 없을 수도 있다. 
// nil 가능성을 문서화하지 않아도 코드 만으로 충분히 표현 가능하다. -> 문서/주석 작성 시간을 절약
// 전달 받은 값이 옵셔널이 아니라면 nil 체크를 하지 않더라도 안심하고 사용 -> 효율적인 코딩 / 예외 상황을 최소화하는 안전한 코딩

// someOptionalParam can be nil
func someFunction(someOptionalParam: Int?) {
    // ...
}
// someParam must not be nil
func someFunction(someParam: Int) {
    // ...
}
someFunction(someOptionalParam: nil)
// someFunction(someParam: nil) // 불가능

// Optional = enum + general
enum Optional<Wrapped> : ExpressibleByNilLiteral {
    case none
    case some(Wrapped)
}
let optionalValue: Optional<Int> = nil  // Optional 사용의 정석, but 굳이 이렇게 쓰지 않아도 된다. 
let optionalValue2: Int? = nil   // Int의 Optional 타입이다. 

// Impllicitly Unwrapped Optional : 암시적 추출 옵셔널 (!)
var optionalValue3: Int! = 100
switch optionalValue3 {
    case .none:
        print("This Optional variable is nil")
    case .some(let value):
        print("Value is \(value)")
}
// 기존 변수처럼 사용 가능
optionalValue3 = optionalValue3 + 1
// nil 할당 가능 
optionalValue3 = nil
// 잘못된 접근으로 인한 런타임 오류 발생 -> nil 값을 넣어줬으므로 
optionalValue3 = optionalValue3 + 1

// Optional (?)
var optionalValue4: Int? = 100
switch optionalValue4 {
    case .none:
        print("This Optional variable is nil")
    case .some(let value):
        print("Value is \(value)")
}
// nil 할당 가능
optionalValue4 = nil
// 기존 변수처럼 사용 불가 -> 옵셔널과 일반 값은 다른 타입
// optionalvalue4 = optionalValue2 + 1  // 불가능


/* 11. 옵셔널 값 추출 */
/* Optional Unwrapping */
/* 1) Optional Binding - 옵셔널 바인딩 : nil 체크 + 안전한 값 추출 */
// 따라서 강제 추출보다 옵셔널 바인딩이 더 추천된다. 
func printName(_ name: String) {    // 매개변수는 옵셔널 변수X
    print(name)
}
var myName: String? = nil   // 값을 전달하는 변수는 옵셔널 변수
printName(name: myName) // 전달되는 값의 타입이 다르기 때문에 컴파일 오류 발생

// 위 오류 수정 -> if/let 사용
// name 상수는 if-let 구문 내에서만 사용이 가능하다.
func printName2(_ name: String) {
    print(name)
}
var myName2: String! = nil
if let name: String = myName2 { // -> 옵셔널 타입의 바인딩
    printName2(name)
} else {
    print("myName2 == nil")
}
// 상수 사용 범위를 벗어났기 때문에 컴파일 오류가 발생
// printName2(name)

// 두 개 이상 옵셔널 타입의 바인딩이 가능하다.
var myName3: String? = "JiSoo"
var yourName: String? = nil
if let name = myName3, let friend = yourName {
    print("\(name) and \(friend)")
}   // yourName이 nil이기 때문에 실행되지 않는다.
yourName = "hana"
if let name = myName3, let friend = yourName {
    print("\(name) and \(friend)")
}   // JiSoo and hana

/* 2) Force Unwrapping - 강제 추출 */
func printName3(_ name: String) {
    print(name)
}
var myName4: String? = "JiSoo"  // 옵셔널 타입
printName3(myName4!) // 옵셔널 변수 값을 강제 추출

myName4 = nil
print(myName4!) // 강제 추출 시 값이 없으므로 런타임 오류 발생

var yourName: String! = nil // 위 상황을 애초에 가정하고 변수 설정
printName(yourName) // nil 값이 전달되기 때문에 런타임 오류 발생


/* 12. 구조체 */
/* 정의 */
// struct 이름 {
//  /* 구현부 */    
// }

/* 프로퍼티 및 메서드 */
struct Sample {
    var mutableProperty: Int = 100  // 가변 프로퍼티
    let immutableProperty: Int = 100    // 불변 프로퍼티
    static var typeProperty: Int = 100  // 타입 프로퍼티

    // 인스턴스 메서드
    func instanceMethod() {
        print("instance method")
    }

    // 타입 메서드
    static func typeMethod() {
        print("type method")
    }
}

/* 구조체 사용 */
// 가변 인스턴스
var mutable: Sample = Sample()
mutable.mutableProperty = 200   // 가변 인스턴스 내 가변 프로퍼티는 변경 가능
// mutable.immutableProperty = 200  // 가변 인스턴스여도 불변 프로퍼티는 변경 불가능

// 불변 인스턴스 -> 모든 것을 변경 불가능
let immutable: Sample = Sample()
// immutable.mutableProperty = 200
// immutable.immutableProperty = 200

// 타입 프로퍼티 및 메서드
// 구조체 객체가 개인적으로 사용하는 것이 아닌, 구조체 타입 자체만 사용할 수 있음
Sample.typeProperty = 300
Sample.typeMethod()

/* Ex> 학생 구조체 */
struct Student {
    var name: String = "unknown"
    var `class`: String = "Swift"   // 키워드와 겹치는 변수명은 강세표로 묶어주면 사용할 수 있다.

    static func selfIntroduce() {
        print("학생 타입입니다.")
    }
    
    func selfIntroduce() {
        print("저는 \(self.class)반 \(name)입니다.")
    }
}
Student.selfIntroduce() // 타입 메서드 사용

var jisoo: Student = Student()
jisoo.name = "JiSoo"
jisoo.class = "스위프트"
jisoo.selfIntroduce()

let jina: Student = Student()
// 불변 인스턴스이므로 프로퍼티 값 변경 불가
// 컴파일 오류 발생
// jina.name = "jina"
jina.selfIntroduce()


/* 13. 클래스 */
// 구조체는 값 타입인 반면, 클래스는 참조 타입
// Swift의 클래스는 다중 상속 X
// class 이름 {
//  /* 구현부 */    
// }

/* 프로퍼티 및 메서드 */
class Sample2 {
    var mutableProperty: Int = 100  // 가변 프로퍼티
    let immutableProperty: Int = 100    // 불변 프로퍼티
    static var typeProperty: Int = 100  // 타입 프로퍼티

    // 인스턴스 메서드
    func instanceMethod() {
        print("instance method")
    }

    // 타입 메서드 (종류 2개)
    // 재정의 불가 타입 메서드 - static
    static func typeMethod() {
        print("type method - static")
    }
    // 재정의 가능 타입 메서드 - class 
    class func classMethod() {
        print("type method - class")
    }
}

/* 클래스 사용 */
// 클래스는 구조체와 다르게, 가변 인스턴스와 불변 인스턴스 모두 인스턴스 내 가변 프로퍼티를 변경할 수 있다 (!)
var mutableReference2: Sample = Sample()
mutableReference2.mutableProperty = 200
// mutableReference2.immutableProperty = 200    // 애초에 불변 프로퍼티로 선언했다면 변경 불가능 ! 

let immutableReference2: Sample = Sample()
immutableReference2.mutableProperty = 200
// immutableReference2.immutableProperty = 200  // 애초에 불변 프로퍼티로 선언했다면 변경 불가능 ! 

// immutableReference2 = mutableReference   // let으로 선언한 상수는 변경 불가능

/* 타입 프로퍼티 및 메서드 */
Sample.typeProperty = 300
Sample.typeMethod()
// mutableReference2.typeProperty = 400
// mutableReference2.typeMethod()

/* Ex> 학생 클래스 */
class Student {
    var name: String = "unknown"
    var `class`: String = "Swift"

    class func selfIntroduce() {
        print("학생 타입입니다.")
    }

    func selfIntroduce() {
        print("저는 \(self.class)반 \(name)입니다.")
    }
}
Student.selfIntroduce() // 학생 타입입니다.

var jisoo: Student = Student()
jisoo.name = "JiSoo"
jisoo.class = "스위프트"
jisoo.selfIntroduce()

let jina: Student = Student()
jina.name = "jina"  // let으로 변수를 선언했음에도 불구하고 가변 프로퍼티를 변경할 수 있다는 점 !
jina.selfIntroduce()


/* 14. 열거형 */
/* 정의 */
// enum은 타입이므로 대문자 카멜 케이스를 사용하여 이름을 정의
// 각 case는 소문자 카멜 케이스로 정의
// 각 case는 그 자체가 고유의 값
// C언어처럼 enum의 각 값들이 정수 값을 가지는 것은 아니라는 것에 주의 (!)
// enum 이름 {
//  case 이름1
//  case 이름2
//  case 이름3, 이름4, 이름5
//  ...
// }

/* 열거형 사용 */
// 모든 경우를 case 키워드를 통해 선언해주거나, 나머지를 default 키워드를 통해 선언해줄 것
enum Weekday {
    case mon
    case tue
    case wed
    case thu, fri, sat, sun
}

var day: Weekday = Weekday.mon
day = .tue  // 위에서 Weekday형임을 선언했기 때문에, 이와 같이 축약 가능
print(day)

switch day {
    case .mon, .tue, .wed, .thu:
        print("평일입니다.")
    case Weekday.fri:
        print("불금입니다.")
    case .sat, .sun:
        print("주말입니다.")
}

/* 원시값 */
// C 언어의 enum처럼 정수 값을 가질 수도 있다.
// rawValue를 사용하면 된다.
// case 별로 각각 다른 값을 가져야 한다. 
// 자동으로 1씩 증가한다. 
enum Fruit: Int {
    case apple = 0
    case grape = 1
    case peach
    // case mango = 0
}
print("Fruit.peach.rawValue == \(Fruit.peach.rawValue)")    // Fruit.peach.rawValue == 2

// 정수 타입 뿐만 아니라 Hashable 프로토콜을 따르는 모든 타입이 원시 값의 타입으로 지정될 수 있다.
enum School: String {
    case elementary = "초등"
    case middle = "중등"
    case high = "고등"
    case university
}
print("School.middle.rawValue == \(School.middle.rawValue)")    // School.middle.rawValue == 중등
print("School.university.rawValue == \(School.university.rawValue)")    // School.middle.rawValue == university

/* 원시값을 통한 초기화 */
// rawValue를 통해 초기화할 수 있다.
// but, rawValue가 case에 해당하지 않을 수 있으므로 rawValue를 통해 초기화한 인스턴스는 옵셔널 타입이다.

// let apple: Fruit = Fruit(rawValue: 0)
let apple: Fruit? = Fruit(rawValue: 0)  // Optional로 선언

if let orange: Fruit = Fruit(rawValue: 5) {
    print("rawValue 5에 해당하는 케이스는 \(orange)입니다.")
} else {
    print("rawValue 5에 해당하는 케이스가 없습니다.")
}

/* 메서드 */
enum Month {
    case dec, jan, feb
    case mar, apr, may
    case jun, jul, aug
    case sep, oct, nov

    func printMessage() {
        switch self {
            case .mar, .apr, .may:
                print("따스한 봄")
            case .jun, .jul, .aug:
                print("더운 여름")
            case .sep, .oct, .nov:
                print("독서의 계절 가을")
            case .dec, .jan, .feb:
                print("추운 겨울")
        }
    }
}
Month.mar.printMessage()


/* 15. 값 타입과 참조 타입 */
/* OOP */
// 전통적인 OOP 관점에서의 클래스
// 단일 상속
// (인스턴스/타입) 메서드
// (인스턴스/타입) 프로퍼티
// 참조 타입 (!)
// Apple 프레임워크의 대부분의 큰 뼈대는 모두 클래스로 구성됨

/* Struct */
// C 언어 등의 구조체보다 다양한 기능
// 상속 불가
// (인스턴스/타입) 메서드
// (인스턴스/타입) 프로퍼티
// 값 타입 (!)
// Swift의 대부분의 큰 뼈대는 모두 구조체로 구성

/* Enum */
// 다른 언어의 열거형과는 많이 다른 존재
// 상속 불가
// (인스턴스/타입) 메서드
// (인스턴스/타입) 연산 프로퍼티
// 값 타입 
// Enumeration
// 유사한 종류의 여러 값을 유의미한 이름으로 한 곳에 모아 정의 Ex> 요일, 상태 값, 월(month) 등
// 열거형 자체가 하나의 데이터 타입, 열거형의 case 하나하나 전부 하나의 유의미한 값으로 취급
// 선언 키워드 : enum

/* 구조체는 언제 사용할까 ? */
// 연관된 몇몇의 값들을 모아서 하나의 데이터 타입으로 표현하고 싶을 때
// 다른 객체 또는 함수 등으로 전달될 때 참조가 아닌 복사를 원할 때
// 자신을 상속할 필요가 없거나 자신이 다른 타입을 상속 받을 필요가 없을 때
// Apple 프레임워크에서 프로그래밍을 할 때에는 주로 클래스를 많이 사용한다. 

// Value vs Reference
// Value : 데이터를 전달할 때 값을 복사하여 전달
// Reference : 데이터를 전달할 때 값의 메모리 위치를 전달

/* 클래스, 구조체/열거형 비교 */
/* Class vs Struct/Enum */
struct ValueType {
    var property = 1
}

class ReferenceType {
    var property = 1
}

let firstStructInstance = ValueType()
var secondStructInstance: firstStructInstance   // firstStructInstance가 복사되어 들어감
secondStructInstance.property = 2

print("first struct instance property : \(firstStructInstance.property)")   // 1
print("second struct instance property : \(secondStructInstance.property)") // 2

let firstClassReference = ReferenceType()
var secondClassReference = firstClassReference  // 두 참조가 하나의 인스턴스를 가리킴
secondClassReference.property = 2

print("first class reference property : \(firstClassReference.property)")   // 2
print("second class reference property : \(secondClassReference.property)") // 2

/* Data types in Swift */
// public struct Int, public struct Double, public struct Array<Element>와 같이 모두 구조체로 이루어짐 !!
// Swift는 구조체, 열거형 사용을 선호
// Apple 프레임 워크는 대부분 클래스를 사용
// Apple 프레임 워크 사용 시 구조체/클래스 선택은 우리의 몫
