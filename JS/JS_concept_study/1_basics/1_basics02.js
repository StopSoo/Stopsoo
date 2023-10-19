/**
 * If and Switch
 * 
 * if - else if - else
 */
let myNumber = 5;
if (myNumber % 2 === 0) {
    console.log("짝수입니다.")
} else {
    console.log("홀수입니다.")
}
console.log('----------------');

const englishDay = 'saturday';
let koreanDay;

switch(englishDay) {
    case 'monday':
        koreanDay = '월요일';
        break;  // break문 반드시 사용 !
    case 'tuesday':
        koreanDay = '화요일';
        break;
    case 'wednesday':
        koreanDay = '수요일';
    case 'thursday':
        koreanDay = '목요일';
    case 'friday':
        koreanDay = '금요일';
    default:
        koreanDay = '주말';
}
console.log(koreanDay)
console.log('----------------');


/**
 * Loops
 * 
 * 1) for
 * 2) while
 * 똑같이 continue, break 사용 가능
 */
for (let i = 0; i < 10; i++) {
    console.log(i);
}
console.log('-----------');

/**
 * for...in
 * 
 * array에서 key 값을 가져오고 싶을 때 사용
 */

const sooyoung = {
    name: '정수영',
    year: 1999,
    nickname: '바보'
}

for (let key in sooyoung) {
    console.log(key, sooyoung[key]);
}
console.log('-----------');

const Day6MembersArray = ['제이', '원필', '성진', '영케이', '도운'];
for (let key in Day6MembersArray) {
    console.log(key, Day6MembersArray[key]);    // 인덱스와 함께 출력 
}
console.log('-----------');

/**
 * for...of
 * 
 * array에서 value 값을 가져오고 싶을 때 사용
 */
for (let value of Day6MembersArray) {
    console.log(value);
}
console.log('-----------');

/**
 * while
 */
let n = 0;
while (n < 10) {
    n++;
    console.log(n);
}
console.log('-----------');

/**
 * do...while
 */
k = 0;
do {
    k++;
} while (k < 10);
console.log(k);
console.log('-----------');


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
console.log(typeof (99).toString());    
console.log(typeof (true).toString());
console.log(typeof (Infinity).toString());

// number 타입으로 변환
console.log(typeof parseInt('0'), parseInt('0'));   // Int
console.log(typeof parseFloat('0.99'), parseFloat('0.99')); // Float
console.log(typeof +'1', +'1'); // Int

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


/**
 * function
 * 
 * DRY : Don't Repeat Yourself
 */

function calculate(_num) {
    console.log((_num * 10 / 2 % 3).toString());
}
calculate(4);    // 함수 실행

/**
 * 함수에서 입력 받는 값 : parameter
 * 실제 입력하는 값 : argument
 */

function multiply(x, y) {   // 여러 개의 parameter 가능
    console.log(x * y);
}
multiply(2, 4); // 8

function multiply(x, y = 10) {   // default parameter 
    console.log(x * y);
}
multiply(2);    // 20

/**
 * 반환 받기 
 * return
 */
function multiply(x, y) {
    return x * y;
}
const result = multiply(2, 4);  // 반환 값은 변수에 저장

/**
 * Arrow 함수
 */
const multiply2 = (x, y) => {
    return x * y;
}
console.log(multiply2(3, 4));

// 훨씬 간단한 arrow 함수
const multiply3 = (x, y) => x * y;
console.log(multiply3(4, 5));

// 훨씬 더 간단한 arrow 함수 (parameter가 1개일 경우)
const multiply4 = x => x * 2;
console.log(multiply4(2));
console.log('-----------');

// chaining
const multiply5 = x => y => z => `x: ${x} y: ${y} z: ${z}`;
console.log(multiply5(2)(5)(7));
// multiply5 함수를 일반 함수로 변경
function multiply6(x) {
    return function(y) {
        return function(z) {
            return `x: ${x} y: ${y} z: ${z}`;
        }
    }
}
console.log(multiply6(3)(4)(5));
console.log('-----------');

const multiplyTwo = function(x, y) {
    return x * y;
}
console.log(multiplyTwo(4, 5));

const multiplyThree = function(x, y, z) {
    console.log(arguments); // 인자 출력
    return x * y * z;
}
console.log(multiplyThree(3, 4, 5));

// argument 개념을 이용한 함수
const multiplyAll = function (...arguments) {
    return Object.values(arguments).reduce((a, b) => a * b, 1);
}
console.log(multiplyAll(3, 4, 5, 6, 7, 8, 9, 10));

// immediately invoked function : 함수 즉시 실행 (!)
(function(x, y) {
    console.log(x * y);
})(4, 5);

console.log(typeof multiply);
console.log(multiply instanceof Object);    // 함수도 객체
console.log('-----------');











/**
 * Object / 객체
 * 
 * 객체의 특징
 * 1) const로 선언할 경우 객체 자체를 변경할 수는 없다.
 * 2) 객체 안의 프로퍼티나 메서드는 변경할 수 있다.
 * 3) key는 '' 없이 입력 가능하다. 
 */

let jisoojeong = {
    name: '지수정',
    major: 'computer science',
    dance: function() {     // 이와 같이 함수 추가 가능
        return `${this.name}이 춤을 춥니다.`    // this는 해당 객체를 가리킴
    }
}
console.log(jisoojeong);    
console.log(jisoojeong.name);       // 방법 1
console.log(jisoojeong['name']);    // 방법 2
console.log(jisoojeong.dance());    // 함수는 () 필수 !
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