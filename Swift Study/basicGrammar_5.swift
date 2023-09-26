import Swift

/* 20. 상속 */
// 스위프트의 상속은 클래스, 프로토콜 등에서 가능
// 열거형, 구조체는 상속이 불가능
// 스위프트는 다중 상속을 지원하지 않음

/* 클래스의 상속과 재정의 */
/*
class 이름: 상속받을 클래스 이름 {
    구현부
}
*/

class Person {  // 상속 받지 않는 기본 클래스 
    var name: String = ""

    func selfIntroduce() {
        print("저는 \(name)입니다.")
    }
    // final 키워드를 사용하여 자식 클래스 내에서 재정의하는 것을 방지 가능
    final func sayHello() {
        print("hello!")
    }
    // 타입 메서드
    // 재정의 불가 타입 메서드 - static
    static func typeMethod() {
        print("type method - static")
    }
    // 재정의 가능 타입 메서드 - class
    class func classMethod() {
        print("type method - class")
    }
    // 재정의 가능한 class 메서드라도 final 키워드를 사용하면 재정의할 수 없음
    // 메서드 앞에 `static`과 `final class`는 같은 역할을 한다.
    final class func finalClassMethod() {
        print("type method - final class")
    }
}

class Student: Person { // Person 클래스를 상속받은 Student 클래스
    // var name: String = ""    -> 해당 프로퍼티는 상속 받았으므로 이미 존재
    var major: String = ""

    override func selfIntroduce() {
        print("저는 \(name)이고, 전공은 \(major)입니다.")
        // 부모 클래스의 함수를 호출하고 싶을 때
        // super.selfIntroduce()
    }

    override class func classMethod() {
        print("overriden type method - class")
    }

    // static을 사용한 타입 메서드는 재정의할 수 없다.
    // override static func typeMethod() {   }

    // final 키워드를 사용한 메서드, 프로퍼티는 재정의할 수 없다.
    // override func sayHello() {   }
    // override class func finalClassMethod() {    }
}

let jisoo: Person = Person()
let hana: Student = Student()

jisoo.name = "jisoo"
hana.name = "hana"
hana.major = "Swift"

jisoo.selfIntroduce()   // 저는 jisoo입니다.
hana.selfIntroduce()    // 저는 hana이고, 전공은 Swift입니다. 
Person.classMethod()    // type method - class
Person.typeMethod()     // type method - static
Person.finalClassMethod()   // type method - final class
Student.classMethod()   // overriden type method - class    -> 재정의해준 메서드만 바뀌어서 호출됨
Student.typeMethod()    // type method - static
Student.finalClassMethod()  // type method - final class


/* 21. 인스턴스의 생성과 소멸 */
/* 프로퍼티 기본 값 */
// 스위프트의 모든 인스턴스는 초기화와 동시에 모든 프로퍼티에 유효한 값이 할당되어 있어야 함
// 프로퍼티에 미리 기본값을 할당해두면 인스턴스가 생성됨과 동시에 초기값을 지니게 됨

class PersonA {
    // 모든 저장 프로퍼티에 기본값 할당
    var name: String = "unknown"
    var age: Int = 0
    var nickName: String = "nick"
}

let jason: PersonA = PersonA()
jason.name = "jason"
jason.age = 30
jason.nickName = "j"

/* 이니셜라이저 */
// 프로퍼티 기본값을 지정하기 어려운 경우에는 이니셜라이저를 통해 인스턴스가 가져야 할 초기 값을 전달 가능

class PersonB {
    var name: String
    var age: Int
    var nickName: String

    // 이니셜라이저
    init(name: String, age: Int, nickName: String) {
        self.name = name
        self.age = age
        self.nickName = nickName
    }
}
let jisoo: PersonB = PersonB(name: "jisoo", age: 25, nickName: "j") // 인스턴스 생성

/* 프로퍼티의 초기 값이 꼭 필요 없을 때 옵셔널을 사용 */

class PersonC {
    var name: String
    var age: Int
    var nickName: String?   // 옵셔널로 설정

    // 자기의 이니셜라이저를 호출할 때 convenience 키워드를 붙인다.
    convenience init(name: String, age: Int, nickName: String) {
        self.init(name: name, age: age) // 중복된 코드 줄이기
        self.nickName = nickName
    }

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
let jenny: PersonC = PersonC(name: "jenny", age: 10)
let mike: PersonC = PersonC(name: "mike", age: 15, nickName: 20)

/* 암시적 추출 옵셔널은 인스턴스 사용에 꼭 필요하지만 초기값을 할당하지 않고자 할 때 사용 */

class Puppy {
    var name: String
    var owner: PersonC! // 프로퍼티가 꼭 필요해서 !를 사용

    init(name: String) {
        self.name = name
        // but owner 프로퍼티는 초기화가 굳이 필요 X, 나중에 사용할 때 초기화 예정
    }

    func goOut() {
        print("\(name)가 주인 \(owner.name)와 산책을 합니다.")
    }
}
let happy: Puppy = Puppy(name: "happy")
// happy.goOut() -> owner 프로퍼티가 초기화되지 않은 상태로 goOut() 함수 사용 X
happy.owner = jenny
happy.goOut()   // happy가 주인 jenny와 산책을 합니다.

/* 실패 가능한 이니셜라이저 */
// 이니셜라이저 매개변수로 전달되는 초기값이 잘못된 경우 인스턴스 생성에 실패할 수 있음
// 인스턴스 생성에 실패하면 nil을 반환
// 따라서 실패 가능한 이니셜라이저의 반환 타입은 옵셔널 타입

class PersonD {
    var name: String
    var age: Int
    var nickName: String?
    
    init?(name: String, age: Int) {
        if (0...120).contains(age) == false {
            // 실패하면 nil을 반환
            return nil
        }

        if name.characters.count == 0 { // name의 길이가 0이라면
            // nil을 반환
            return nil
        }

        self.name = name
        self.age = age
    }
}
// let john: PersonD = PersonD(name: "john", age: 23)
let john: PersonD? = PersonD(name: "john", age: 23)
let joker: PersonD? = PersonD(name: "joker", age: 123)  // age가 0~120 범위를 벗어나는 경우
let batman: PersonD? = PersonD(name: "", age: 10)   // name의 길이가 0인 경우

print(joker)    // nil
print(batman)   // nil

/* 디이니셜라이저 */
// deinit은 클래스의 인스턴스가 메모리에서 해제되는 시점에 호출됨
// 인스턴스가 해제되는 시점에 해야 할 일을 구현할 수 있음
// deinit은 클래스 타입에만 구현 가능

class PersonE {
    var name: String
    var pet: Puppy?
    var child: PersonC

    init(name: String, child: PersonC) {
        self.name = name
        self.child = child
    }

    deinit {    // deinit은 매개변수를 가지지 않음
        if let petNmae = pet?.name {
            print("\(name)가 \(child.name)에게 \(petNmae)를 인도합니다.")
            self.pet?.owner = child
        }
    }
}
var donald: PersonE? = PersonE(name: "donald", child: jenny)
donald?.pet = happy
// donald 인스턴스가 더 이상 필요 없으므로 메모리에서 해제됨
donald = nil    // donald가 jenny에게 happy를 인도합니다.


/* 22. 옵셔널 체이닝과 nil 병합 연산자 */
// 옵셔널 체이닝은 옵셔널 요소 내부의 프로퍼티로
// 또다시 옵셔널이 연속적으로 연결되는 경우 유용하게 사용 가능

class Person1 {
    var name: String
    var job: String?
    var home: Apartment?

    init(name: String) {
        self.name = name
    }
}

class Apartment {
    var buildingNumber: String
    var roomNumber: String
    var `guard`: Person1?
    var owner: Person1?

    init(dong: String, ho: String) {
        buildingNumber = dong
        roomNumber = ho
    }
}

let jisoo1: Person1? = Person(name: "jisoo")
let apart: Apartment? = Apartment(dong: "101", ho: "202")
let superman: Person1? = Person1(name: "superman")

// 옵셔널 체이닝 실행 후 결과 값이 nil일 수 있으므로 결과 타입도 옵셔널
// 만약 우리 집 경비원의 직업이 궁금하다면 ?
// 옵셔널 체이닝을 사용하지 않는다면 .. (너무 복잡!)
func guardJob(owner: Person1?) {
    if let owner = owner {
        if let home = owner.home {
            if let `guard` = home.guard {
                if let guardJob = `guard`.job {
                    print("우리집 경비원의 직업은 \(guardJob)입니다.")
                } else {
                    print("우리집 경비원은 직업이 없어요.")
                }
            }
        }
    }
}
guardJob(owner: jisoo1)

// 옵셔널 체이닝을 사용한다면
func guardJobWithOptionalChaining(owner: Person?) {
    if let guardJob = owner?.home?.guard?.job {
        print("우리집 경비원의 직업은 \(guardJob)입니다.")
    } else {
        print("우리집 경비원은 직업이 없어요.")
    }
}
guardJobWithOptionalChaining(owner: jisoo1) // 우리집 경비원은 직업이 없어요.

jisoo1?.home?.guard?.job    // home이 할당되어 있지 않아 nil 반환
jisoo1?.home = apart    // home에 할당
jisoo1?.home    // Optional(Apartment)

jisoo1?.home?.guard     // nil
jisoo1?.home?.guard = superman  // guard에 할당
jisoo1?.home?.guard     // Optional(Person)

jisoo1?.home?.guard?.name   // superman
jisoo1?.home?.guard?.job    // nil

jisoo1?.home?.guard?.job = "경비원"     // job에 할당

/* nil 병합 연산자 */
var guardJob: String
guardJob = jisoo?.home?.guard?.job ?? "슈퍼맨"  // 앞에 값이 nil이라면 뒤에 값을 변수에 할당해라
print(guardJob) // 경비원

jisoo?.home?.guard?.job = nil

guardJob = jisoo?.home?.guard?.job ?? "슈퍼맨"
print(guardJob) // 슈퍼맨


/* 23. 타입 캐스팅 */
// 스위프트의 타입 캐스팅은 인스턴스의 타입을 확인하는 용도
// 또는 클래스의 인스턴스를 부모 혹은 자식 클래스의 타입으로 사용할 수 있는지 확인하는 용도로 사용
// is, as를 사용

/* 잘못된 예시
해당 예시는 someDouble 변수를 Double형 변수로 선언하며, someInt 변수가 가진 값을 넣어주는 코드
let someInt: Int = 100
let someDouble: Double = Double(someInt)
*/

/* 타입 캐스팅을 위한 클래스 정의 */
class Person2 {
    var name: String = ""
    func breath() {
        print("숨을 쉽니다.")
    }
}

class Student2: Person1 {
    var school: String = ""
    func goToSchool() {
        print("등교를 합니다.")
    }
}

class UniversityStudent: Student2 {
    var major: String = ""
    func goToMT() {
        print("MT를 갑니다.")
    }
}

var jisoo: Person2 = Person2()
var sieun: Student2 = Student2()
var jason: UniversityStudent = UniversityStudent()

/* 타입 확인 -> is 사용 */
var result: Bool

result = jisoo is Person2           // T
result = jisoo is Student2          // F
result = jisoo is UniversityStudent // F

result = sieun is Person2           // T
result = sieun is Student2          // T
result = sieun is UniversityStudent // F

result = jason is Person2           // T
result = jason is Student2          // T
result = jason is UniversityStudent // T

// 아래와 같이 사용 가능 
if jisoo is UniversityStudent {
    print("jisoo는 대학생입니다.")
} else if jisoo is Student2 {
    print("jisoo는 학생입니다.")
} else if jisoo is Person2 {
    print("jisoo는 사람입니다.")
} 

switch jason {
case is Person2:
    print("jason은 사람입니다.")
case is Student2:
    print("jason은 학생입니다.")
/* ... */
}

/* 업 캐스팅*/
// as를 사용하여 부모 클래스의 인스턴스로 사용할 수 있도록 컴파일러에게 타입 정보를 전환해줌
// Any 혹은 AnyObject로도 타입 정보 변환 가능
// 암시적으로 처리되므로 생략해도 무방

var mike: Person2 = UniversityStudent() as Person2
var jenny: Student2 = Student2()
// var jina: UniversityStudent = Person() as UniversityStudent // 컴파일 오류
var jina: Any = Person2()   // as Any 생략 가능

/* 다운 캐스팅 */
/*
as? 또는 as!를 사용하여 자식 클래스의 인스턴스로 사용할 수 있도록
컴파일러에게 인스턴스의 타입 정보를 전환해줌
*/

/* 조건부 다운 캐스팅 */
// as?
// 캐스팅에 성공하면 옵셔널을 반환
var optionalCasted: Student2?

optionalCasted = mike as? UniversityStudent
optionalCasted = jenny as? UniversityStudent    // nil
optionalCasted = jina as? UniversityStudent     // nil
optionalCasted = jina as? Student2  // nil

/* 강제 다운 캐스팅 */
// as!
// 반환 타입이 옵셔널이 아니고 일반 타입이라 편하게 활용 가능
var forcedCasted: Student2 

optionalCasted = mike as! UniversityStudent
// optionalCasted = jenny as! UniversityStudent    // 런타임 오류
// optionalCasted = jina as! UniversityStudent // 런타임 오류
// optionalCasted = jina as! Student2  // 런타임 오류

// 활용 
// 1. 캐스팅을 하려면 아래와 같이 따로 써줘야 한다. 
func doSomethingWithSwitch(someone: Person) {
    switch someone {
        case is UniversityStudent:
            (someone as! UniversityStudent).goToMT()
        case is Student2:
            (someone as! Student).goToSchool()
        case is Person2:
            (someone as! Person2).breath()
    }   
}

doSomethingWithSwitch(someone: mike as Person2)
doSomethingWithSwitch(someone: mike)
doSomethingWithSwitch(someone: jenny)   // 등교를 합니다.

// 2. 캐스팅과 동시에 가능 (옵셔널 값을 받아옴)
func doSomething(someone: Person2) {
    if let universityStudent = someone as? UniversityStudent {
        universityStudent.goToMT()
    } else if let student = someone as? Student2 {
        student.goToSchool()
    } else if let person = someone as? Person2 {
        person.breath()
    }
}

doSomething(someone: mike as Person2)
doSomething(someone: mike)
doSomething(someone: jenny)
doSomething(someone: jisoo)


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