/**
 * Copy by value 값에 의한 전달
 * Copy by reference 참조에 의한 전달
 * 
 * 1) 기본적으로 모든 primitive 값은 copy by value
 * 2) 객체는 copy by reference
 *    같은 값을 갖는다고 같은 객체가 아님 (!)
 * # 객체가 아닌 숫자, 문자열, 불 값, null, undefined는 모두 값이 같다면 같은 것으로 인식한다. 
 * Ex1> 'str' === 'str;
 *       123 === 123;
 *       undefined = undefined;
 * Ex2> const a = { name : 'jisoo' };
 *      const array = [1, 2, a]; 
 *      array === [1, 2, a];
 *      ==> false : 서로 다른 객체이기 때문
 */
console.log({} === {}); // false => 모양이 같다고 true는 아니라는 점.

let original = '안녕하세요';
let clone = original;   // '안녕하세요'

clone += ' 정지수입니다.';
console.log(original);  // '안녕하세요'
console.log(clone);     // '안녕하세요 정지수입니다.' => copy by value
console.log('-----------');

let originalObj = {
    name: '정지수',
    major: 'computer science'
}
let cloneObj = originalObj; // copy by reference

console.log(originalObj);
console.log(cloneObj);

cloneObj['age'] = 25;
console.log(originalObj);
console.log(cloneObj);  // copy by reference => 둘 다 같은 객체를 가리킴

console.log(original === clone);    // false => 같은 객체가 아님을 알 수 있음
console.log(originalObj === cloneObj);  // true => 같은 객체임을 알 수 있음
console.log('-----------');

const jisoo1 = {
    name: '지수',
    major: 'computer science'
}
const jisoo2 = jisoo1;
const jisoo3 = {
    name: '지수',
    major: 'computer science'
}

console.log(jisoo1 === jisoo2); // true
console.log(jisoo1 === jisoo3); // false => 같은 값을 가졌다고 해서 같은 객체가 아님 !
console.log(jisoo2 === jisoo3); // false
console.log('-----------');

/**
 * Spread Operator
 * 넣는 위치가 굉장히 중요하다 !
 */
const jisoo4 = {
    ...jisoo3,
}
console.log(jisoo4);    // 값이 그대로 copy => copy by value
console.log(jisoo4 === jisoo3); // false => 같은 객체는 아님 !
console.log('-----------');

const jisoo5 = {
    ...jisoo3,
    year: 1999,     // 다음과 같이 값 추가 가능 
}
console.log(jisoo5);