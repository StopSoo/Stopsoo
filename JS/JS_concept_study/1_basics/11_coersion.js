/**
 * Coersion
 * 타입 변환
 * Type Conversion
 * 
 * 1) 명시적
 * 2) 암묵적
 */

// 1) 명시적
// string으로 변환
let Age = 32;
let stringAge = Age.toString();
console.log(typeof stringAge, stringAge);

// 2) 암묵적
// string으로 변환
let test = Age + '';
console.log(typeof test, test);

console.log('98' + 2);  // 982 -> number를 string으로 변환
console.log('98' * 2);  // 196 -> string을 number로 변환
console.log('98' - 2);  // 96 -> string에 - 연산자가 없어 string을 number로 변환
// 이런 기괴한 현상들을 실제로 사용하지 말고, 명시적으로 변환될 수 있도록 코드를 명시적으로 작성할 것 !!!!
console.log('-----------');

/**
 * 명시적 변환 + a
 */
// string 타입으로 변환 
console.log(typeof (99).toString());    // string
console.log(typeof (true).toString());  // string
console.log(typeof (Infinity).toString());  // string

// number 타입으로 변환
console.log(typeof parseInt('0'), parseInt('0'));   // Int
console.log(typeof parseFloat('0.99'), parseFloat('0.99')); // Float
console.log(typeof +'1', +'1');     // Int

/**
 * Boolean 타입으로의 변환
 * 
 * false를 반환하는 경우
 * 1) 아무 글자도 없는 string
 * 2) 값이 없는 경우
 * 0
 */
console.log(!'x');  // 비지 않은 문자열은 true, 빈 문자열은 false
console.log(!'');   // 빈 문자열이 false이므로 !를 붙인 것은 true
console.log(!!undefined); // undefined를 boolean 타입으로 변환했을 때는 false
console.log(!!null);  // null을 boolean 타입으로 변환했을 때는 false

console.log(!!{});  // Object는 비어 있든 안 비어 있든 무조건 true
console.log(!![]);  // array도 비어 있든 안 비어 있든 무조건 true
console.log('-----------');

