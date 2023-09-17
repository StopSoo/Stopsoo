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
optionalValue3 = optionalValue + 1
// nil 할당 가능 
optionalValue3 = nil
// 잘못된 접근으로 인한 런타임 오류 발생
optionalValue3 = optionalValue + 1

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
printName3(myName!) // 옵셔널 변수 값을 강제 추출

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

/* 학생 구조체 */
struct Student {
    var name: String = "unknown"
    var `class`: String = "Swift"   // 키워드와 겹치는 변수명은 강세표로 묶어주면 사용할 수 있다.

    static func selfIntroduce() {
        print("학생 타입입니다.")
    }
    
    func selfIntroduce() {
        print("저는 \(self.class)빈 \(name)입니다.")
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
// 클래스는 구조체와 다르게, 가변 인스턴스와 불변 인스턴스 모두 인스턴스 내 가변 프로퍼티를 변경할 수 있다. (!)
var mutableReference2: Sample = Sample()
mutableReference2.mutableProperty = 200
// mutableReference2.immutableProperty = 200

let immutableReference2: Sample = Sample()
immutableReference2.mutableProperty = 200
// immutableReference2.immutableProperty = 200

// immutableReference2 = mutableReference