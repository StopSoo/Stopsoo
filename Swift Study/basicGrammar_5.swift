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