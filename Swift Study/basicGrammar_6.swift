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
