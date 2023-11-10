/**
 * Object / 객체
 * 
 * 객체의 특징
 * 1) const로 선언할 경우 객체 자체를 변경할 수는 없다.
 * 2) 객체 안의 프로퍼티나 메서드는 변경할 수 있다.
 * 3) key는 '' 없이 입력 가능하다. 
 * 4) 하지만 key에 숫자나 특수 문자, 띄어쓰기 등이 들어갈 경우에는 ''로 묶어줘야 한다. 
 * 5) 없는 속성에 접근하면 undefined를 반환한다. 
 * 
 * 함수와 배열이 객체인 이유 : 객체의 성질을 모두 갖고 있기 때문
 * 객체는 함수의 배열을 포함하는 개념이라서 {}를 사용해 만든 객체를 객체 리터럴이라고 부르는 것.
 */

// Object Example
let jisoojeong = {
    name: '지수정',
    major: 'computer science',
    dance: function() {     // 이와 같이 함수 추가 가능 : 객체 안에 선언된 함수를 메서드(method)라고 부름
        return `${this.name}이 춤을 춥니다.`    // this는 해당 객체를 가리킴
    }
}
console.log(jisoojeong);    
console.log(jisoojeong.name);       // 해당 프로퍼티를 가져오는 방법 1
console.log(jisoojeong['name']);    // 해당 프로퍼티를 가져오는 방법 2 - 대괄호를 쓸 때는 ''를 빼먹지 말 것 !
console.log(jisoojeong.dance());    // 함수 실행 시 () 필수 !
jisoojeong.name = '정지수';     // 값 수정
jisoojeong.gender = 'F';      // 값 추가
console.log('-----------');

// 객체에 key와 value를 변수로 넣을 때
const nameKey = 'name';
const nameValue = '정지수';
const majorKey = 'major';
const majorValue = 'computer science';

const jisoojeong2 = {
    [nameKey]: nameValue,
    [majorKey]: majorValue,
    gender: 'Female',
}
console.log(jisoojeong2);

delete jisoojeong2[majorKey];   // 속성 제거 방법 1 : key-value pair 삭제
delete jisoojeong2.gender;      // 속성 제거 방법 2
console.log(jisoojeong2);
console.log('-----------');

// 모든 key 값 가져오기
console.log(Object.keys(jisoojeong2));

// 모든 value 값 가져오기
console.log(Object.values(jisoojeong2));