/**
 * Object / 객체
 * 
 * 객체의 특징
 * 1) const로 선언할 경우 객체 자체를 변경할 수는 없다.
 * 2) 객체 안의 프로퍼티나 메서드는 변경할 수 있다.
 * 3) key는 '' 없이 입력 가능하다. 
 */

// Object Example
let jisoojeong = {
    name: '지수정',
    major: 'computer science',
    dance: function() {     // 이와 같이 함수 추가 가능
        return `${this.name}이 춤을 춥니다.`    // this는 해당 객체를 가리킴
    }
}
console.log(jisoojeong);    
console.log(jisoojeong.name);       // 해당 프로퍼티를 가져오는 방법 1
console.log(jisoojeong['name']);    // 해당 프로퍼티를 가져오는 방법 2
console.log(jisoojeong.dance());    // 함수 실행 시 () 필수 !
console.log('-----------');

// 객체에 key와 value를 변수로 넣을 때
const nameKey = 'name';
const nameValue = '정지수';
const majorKey = 'major';
const majorValue = 'computer science';

const jisoojeong2 = {
    [nameKey]: nameValue,
    [majorKey]: majorValue
}
console.log(jisoojeong2);

delete jisoojeong2[majorKey];   // key-value pair 삭제
console.log(jisoojeong2);
console.log('-----------');

// 모든 key 값 가져오기
console.log(Object.keys(jisoojeong2));

// 모든 value 값 가져오기
console.log(Object.values(jisoojeong2));