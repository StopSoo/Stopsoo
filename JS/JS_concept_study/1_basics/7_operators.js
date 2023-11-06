/**
 * Operators
 */

/**
 * 증감 연산자 사용 가능
 */
let num = 1;
num++;
console.log(num);
console.log('----------------');

/**
 * 숫자가 아닌 타입에 +, -를 사용한다면 ?
 */
let sample = '99';
console.log(+sample);   // 99
console.log(typeof +sample);    // number

console.log(sample);    // 99
console.log(typeof sample); // string - 타입이 변경되진 않음 

sample = true;
console.log(+sample);   // 1 - true의 숫자 변환값이 1이라는 것을 알 수 있음
console.log(typeof +sample);    // number

sample = false;
console.log(+sample);   // 0 - false의 숫자 변환값이 0이라는 것을 알 수 있음
console.log(typeof +sample);    // number

sample = '지수';
console.log(+sample);   // NaN (Not a Number) - string은 변환X

sample = '99';
console.log(-sample);   // -99
console.log(typeof -sample);    // number
console.log('----------------');

/**
 * 할당 연산자 사용 가능
 */
var number = 100;
console.log(number);    // 100

number += 10;
console.log(number);    // 110
console.log('----------------');

/**
 * 비교 연산자
 * 
 * 1) 값의 비교
 * 2) 값과 타입의 비교 (!)
 */

// 1) 값의 비교
// '같다'는 ==, '같지 않다'는 !=을 사용
console.log(5 == 5);    // true
console.log(5 == '5');  // true
console.log(0 == '');   // true
console.log(true == 1); // true
console.log(false == 0);    // true
console.log(true == '1');   // true
console.log('----------------');

// 위 과정이 굉장히 이상하므로 주로 2번을 사용한다.
// 2) 값과 타입의 비교
// ===을 사용하면 변환되는 값이 같더라도 타입이 다르면 false가 출력됨
// '같다'는 ===, '같지 않다'는 !==을 사용
console.log(5 === 5);   // true
console.log(5 === '5');  // false
console.log(0 === '');   // false
console.log(true === 1); // false
console.log(false === 0);    // false
console.log(true === '1');   // false
console.log('----------------');

/**
 * 삼항 조건 연산자 사용 가능
 * ternary operator
 * 조건 ? 조건이 참일 때 : 조건이 거짓일 때
 */

/**
 * 단축 평가 (short circuit evaluation)
 * 
 * &&를 사용했을 때 좌측이 true면 우측 값 반환 | false면 좌측 값 반환 
 * ||를 사용했을 때 좌측이 true면 좌측 값 반환 | false면 우측 값 반환
 */

/**
 * 지수 연산자
 */
console.log(2 ** 2);
console.log(10 ** 3);
console.log('----------------');

/**
 * null 연산자
 */
let myName;
console.log(myName);    // undefined

myName = myName ?? '정지수';    // 변수 name이 undefined일 경우에 오른쪽 값을 할당해라
// myName ??= '정지수';   // 이렇게 사용할 수도 있음
console.log(myName);
console.log('----------------');