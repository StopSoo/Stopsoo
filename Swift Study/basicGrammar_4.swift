import Swift

/* 16. 클로저 기본 */
// 코드의 블럭
// 일급 시민 (first-citizen)
// 변수, 상수 등으로 저장, 전달 인자로 전달이 가능
// 함수 : 이름이 있는 클로저

/* 정의 */
// { (매개변수 목록) -> 반환 타입 in
//      실행 코드
// }
// 매개변수 X, 반환 타입 X 경우
// { () -> Void in
//      실행 코드
// }

// 함수를 사용한다면
func sumFunction(a: Int, b: Int) -> Int {
    return a + b
}

var sumResult: Int = sumFunction(a: 1, b: 2)    // 함수의 일반적 사용

// 클로저의 사용
var sum: (Int, Int) -> Int = { (a: Int, b: Int) -> Int in
    return a + b
}

sumResult = sum(1, 2)
print(sumResult)    // 3

// 함수는 클로저의 일종이므로
// sum 변수에는 당연히 함수도 할당할 수 있습니다.
sum = sumFunction(a:b:)
sumResult = sum(1, 2)
print(sumResult)    // 3

/* 함수의 전달 인자로서의 클로저 */
let add: (Int, Int) -> Int
add = { (a: Int, b: Int) -> Int in
    return a + b
}

let subtract: (Int, Int) -> Int
subtract = { (a: Int, b: Int) -> Int in
    return a - b
}

let divide: (Int, Int) -> Int
divide = { (a: Int, b: Int) -> Int in
    return a / b
}

func calculate(a: Int, b: Int, method: (Int, Int) -> Int) -> Int {
    return method(a, b)
}

// 사용 예시
var calculated: Int
calculated = calculate(a: 50, b: 10, method: add)
print(calculated)   // 60
calculated = calculate(a: 50, b: 10, method: subtract)
print(calculated)   // 40
calculated = calculate(a: 50, b: 10, method: divide)
print(calculated)   // 5

// 이와 같이 뒤에 전달 인자로 바로 코드 블럭을 넘겨주는 것도 가능
// 실행 가능한 코드들을 묶어서 바로 함수로 넘겨준다. 
calculated = calculate(a: 50, b: 10, method: (left: Int, right: Int) -> Int {
    return left * right;
})
print(calculated)   // 500


/* 17. 클로저 고급 */
/*
후행 클로저
반환타입 생략
단축 인자이름
암시적 반환 표현
*/

func calculate2(a: Int, b: Int, method: (Int, Int) -> Int) -> Int {
    // 클로저가 안에서 실행
    return method(a, b)
}

var result: Int

/* 후행 클로저 */
// 클로저가 함수의 마지막 전달 인자라면
// 마지막 매개변수 이름을 생략한 후
// 함수 소괄호 외부에 클로저를 구현할 수 있다.
result = calculate2(a: 10, b: 10) { (left: Int, right: Int) -> Int in
    return left + right
}
print(result)

/* 반환 타입 생략 */
// calculate2 함수의 method 매개변수는 Int 타입을 반환할 것이라는 사실을 컴파일러도 알기 때문에
// 굳이 클로저에서 반환 타입을 명시해주지 않아도 된다.
// 대신 in 키워드는 생략할 수 없다.
result = calculate2(a: 10, b: 10, method: { (left: Int, right: Int) in
    return left + right
})
print(result)

// 후행 클로저와 함께 사용할 수도 있다.
result = calculate2(a: 10, b: 10) { (left: Int, right: Int) in
    return left + right
}

/* 단축 인자 이름 */
// 클로저의 매개변수 이름이 굳이 불필요하다면 단축 인자 이름을 활용할 수 있다.
// 단축 인자 이름은 클로저의 매개변수 순서대로 $0, $1, ... 처럼 표현한다.
result = calculate2(a: 10, b:10, method: {
    return $0 + $1
})
print(result)

// 당연히 후행 클로저와 함께 사용할 수 있다. 
result = calculate2(a: 10, b: 10) {
    return $0 + $1
}
print(result)

/* 암시적 반환 표현 */
// 클로저가 반환하는 값이 있다면 클로저의 마지막 줄의 결과값은 암시적으로 반환값으로 취급한다.
result = calculate2(a: 10, b: 10) {
    $0 + $1
}
// 간결하게 한 줄로도 표현 가능
result = calculate2(a: 10, b: 10) { $0 + $1 }

// 축약하지 않은 클로저 문법과 축약 후의 문법 비교
result = calculate2(a: 10, b: 10, method: { (left: Int, right: Int) -> Int in
    return left + right
})
result = calculate2(a: 10, b: 10) { $0 + $1 }


/* 18. 프로퍼티 */
/*
저장 프로퍼티(stored property)
연산 프로퍼티(computed property)
인스턴스 프로퍼티(instance property)
타입 프로퍼티(type property)
*/
// 프로퍼티는 구조체, 클래스, 열거형 내부에 구현 가능
// 다만 열거형 내부에는 연산 프로퍼티만 구현할 수 있다.
// 연산 프로퍼티는 var로만 선언할 수 있다.

/* 정의 */
struct Student {
    // 인스턴스 저장 프로퍼티
    var name: String = ""
    var `class`: String = "Swift"
    var koreanAge: Int = 0

    // 인스턴스 연산 프로퍼티
    var westernAge: Int {
        get {   // 값 추출
            return koreanAge - 1
        }
        set(inputValue) {   // 값 세팅
            koreanAge = inputValue + 1
        }
    }

    // 타입 저장 프로퍼티
    static var typeDescription: String = "학생"

    /*
    // 인스턴스 메서드 -> 기존 방식 (매개변수 X, 반환값 X)
    func selfIntroduce() {
        print("저는 \(self.class)반 \(name)입니다.")
    }
    */

    // 읽기 전용 인스턴스 연산 프로퍼티
    var selfIntroduction: String {
        // get으로 구현되어 있으면 읽기 전용
        get {
            return "저는 \(self.class)반 \(name)입니다."
        }
    }

    /*
    // 타입 메서드
    static func selfIntroduce() {
        print("학생 타입입니다.")
    }
    */

    // 읽기 전용 타입 연산 프로퍼티
    // 읽기 전용에서는 get을 생략할 수 있다.
    static var selfIntroduction: String {
        return "학생 타입입니다."
    }
}

/* 사용 */
print(Student.selfIntroduction) // 학생 타입입니다.

// 인스턴스 생성
var jisoo: Student = Student()
jisoo.koreanAge = 10

// 인스턴스 저장 프로퍼티 사용
jisoo.name = "jisoo"
print(jisoo.name)   // jisoo

// 인스턴스 연산 프로퍼티 사용
print(jisoo.selfIntroduction)   // 저는 Swift반 jisoo입니다.
print("제 한국 나이는 \(jisoo.koreanAge)살이고, 미국 나이는 \(jisoo.westernAge)살입니다.")  // 제 한국 나이는 10살이고, 미국 나이는 9살입니다.

/* 응용 */
struct Money {
    var currencyRate: Double = 1100
    var dollar: Double = 0
    var won: Double {
        get {
            return dollar * currencyRate
        }
        set {
            // set 옆에 매개변수를 특별히 작성해주지 않으면 newValue로 설정됨
            dollar = newValue / currencyRate
        }
    }
}

var moneyInMyPocket = Money()   // 인스턴스 생성
moneyInMyPocket.won = 11000
moneyInMyPocket.dollar = 10
print(moneyInMyPocket.won)  // 11000 -> get으로 값 추출

/* 지역 변수, 전역 변수 */
// 저장 프로퍼티와 연산 프로퍼티의 기능은
// 함수, 메서드, 클로저, 타입 등의 외부에 위치한 지역, 전역 변수에도 모두 사용 가능하다.
var a: Int = 100
var b: Int = 200
var sum: Int {
    return a + b
}
print(sum)


/* 19. 프로퍼티 감시자 */
// 프로퍼티 감시자를 사용하면 프로퍼티 값이 변경될 때 원하는 동작을 수행할 수 있다.

/* 정의 */
struct Money2 {
    // 프로퍼티 감시자 사용
    var currencyRate: Double = 1100 {
        willSet(newRate) {  // currencyRate가 변경되기 직전에 호출
            print("환율이 \(currencyRate)에서 \(newRate)로 변경될 예정입니다.")
        }
        didSet(oldRate) {   // currencyRate가 변경된 후에 호출
            print("환율이 \(oldRate)에서 \(currencyRate)로 변경되었습니다.")
        }
    }
    // 프로퍼티 감시자 사용
    var dollar: Double = 0 {
        // willSet의 암시적 매개변수 이름 newValue
        willSet {  // dollar가 변경되기 직전에 호출
            print("\(dollar)달러에서 \(newValue)달러로 변경될 예정입니다.")
        }
        // oldSet의 암시적 매개변수 이름 oldValue
        didSet {   // dollar가 변경된 후에 호출
            print("\(oldValue)달러에서 \(dollar)달러로 변경되었습니다.")
        }
    }
    // 연산 프로퍼티
    var won: Double {
        get {
            return dollar * currencyRate
        }
        set {
            dollar = newValue / currencyRate
        }

        /* 프로퍼티 감시자와 연산 프로퍼티 기능을 동시에 사용할 수 없다. -> 저장되는 값이 변경될 때 사용되는 것이므로 !
        willSet {

        }
        */
    }
}

/* 사용 */
var moneyInMyPocket2: Money = Money()
// 환율이 1100.0에서 1150.0로 변경될 예정입니다.
moneyInMyPocket2.currencyRate = 1150
// 환율이 1100.0에서 1150.0로 변경되었습니다.

// 0.0달러에서 10.0달러로 변경될 예정입니다.
moneyInMyPocket2.dollar = 10
// 0.0달러에서 10.0달러로 변경되었습니다.
print(moneyInMyPocket2.won) // 11500.0

// 프로퍼티 감시자의 기능은 함수, 메서드, 클로저, 타입 등의 외부에 위치한 지역, 전역 변수에도 모두 사용 가능
var a: Int = 100 {
    willSet {
        print("\(a)에서 \(newValue)로 변경될 예정입니다.")
    }
    didSet {
        print("\(oldValue)에서 \(a)로 변경되었습니다.")
    }
}

// 100에서 200로 변경될 예정입니다
a = 200
// 100에서 200로 변경되었습니다.