/* Hello World */
console.log('Hello World');  // 세미콜론 필수 X 
console.log('Hello', 'World');  // 문자열 나열 가능 -> 문자열 사이에 공백이 추가됨


/* comment */
// 한 줄 주석
/**
 * 여러
 * 줄
 * 주석
 */


/* declaring variable */
/**
 * 1) var : 더 이상 사용X
 * 2) let 
 * 3) const 
 */

/**
 * let과 var로 선언하면
 * 값을 추후 변경할 수 있다. 
 */
var name = '정지수';
console.log(name);

var _age = 32;   // 숫자 선언

let music = '음악'; 
music = '뮤직';

const c_music = '음악';
// c_music = '뮤직';    // const로 선언한 변수는 추후에 값을 변경할 수 없다.

let boyFriend;
console.log(boyFriend); // 선언만 하고 할당하지 않은 변수는 출력 시 undefined라고 출력된다.

// const girlFriend2;  // const 키워드로 선언한 변수는 반드시 값을 할당해야 한다. 


/* Naming Convention 1 */
/**
 * 변수 이름 지을 때
 * 1) 일반적으로 영어(라틴문자)를 사용하며 문자와 숫자 모두 사용 가능
 * 2) 특수 기호는 언더 스코어와 달러를 사용 가능
 * 3) 숫자로 이름 시작 불가능 
 *    Ex> 1Name, 2Hello
 * 4) 키워드는 변수명으로 사용할 수 없다.
 *    Ex> var const 'var';
 */

let jisoo = '지수';
var $jisoo = '$지수';
const _jisoo = '_지수';

/**
 * Naming Convention 2
 * 1) camelCase
 * 2) snake_case
 * 3) PascalCase
 */


/* data types */
/**
 * 6개의 Primitive Type과 1개의 Object Type이 있다. 
 * 
 * 1) Number (숫자)
 * 2) String (문자열)
 * 3) Boolean
 * 4) undefined
 * 5) null
 * 6) Symbol (심볼)
 * 
 * 7) Object (객체)
 *    Function
 *    Array
 *    Object
 */

// 1. 숫자
const age = 32;
const temperature = -10;

console.log(typeof age);
console.log(typeof temperature);
console.log('----------------');

const infinity = Infinity;
const nInfinity = -Infinity;

console.log(typeof infinity);   // 무한대
console.log(typeof nInfinity);  // - 무한대
console.log('----------------');

// 2. String
const sieun = '시은';
console.log(typeof sieun);

const univSieun = "'대학생' 시은";  // 따옴표를 구분해서 사용 가능
console.log(univSieun);
console.log('----------------');

/**
 * Template literal
 * 
 * Escaping Character
 * 1) newline -> \n
 * 2) tab -> \t
 * 3) 백슬래시를 스트링으로 표현하고 싶다면 두 번 입력
 */

const javaScript = '자바\n스크립트';
console.log(javaScript);
const smallQuotation = '\'자바\'스크립트'
console.log(smallQuotation);

const javaScript2 = `자바
스크립트`;
console.log(javaScript2);

const java = '자바';
const script = '스크립트';
console.log(java + '스크립트');
console.log(`${java} ${script}`);
console.log('----------------');

// 3. Boolean
const isTrue = true;
const isFalse = false;

/**
 * 4. undefined
 * 사용자가 직접 값을 초기화하지 않았을 때 지정되는 값
 * 직접 undefined로 값을 초기화하는 건 지양할 것.
 */

let noInit;
console.log(noInit);
console.log(typeof noInit);
console.log('----------------');

/**
 * 5. null 
 * undefined와 마찬가지로 값이 없다는 뜻이나
 * JS에서는 개발자가 명시적으로 없는 값으로 초기화할 때 사용
 */
let init = null;
console.log(init);
console.log(typeof init);   // object -> 일종의 버그
console.log('----------------');

/**
 * 6. Symbol
 * 유일무이한 값을 생성할 때 사용
 * 다른 primitive 값들과 다르게 Symbol 함수를 호출해서 사용
 */
const test1 = '1';
const test2 = '1';
console.log(test1 === test2);   // true - '같다'를 사용할 때 등호 3개 !

const symbol1 = Symbol('1');
const symbol2 = Symbol('1');
console.log(symbol1 === symbol2);   // false - 각각 유일한 symbol이므로 같은 값을 가지더라도 false가 나옴
console.log('----------------');

/**
 * 7. Object
 * Map
 * key: value의 쌍으로 이루어짐
 */

const dictionary = {
    red: '빨간색',
    blue: '파란색',
    orange: '주황색',
    yellow: '노랑색'
};

console.log(dictionary);
console.log(dictionary['red']);
console.log(typeof dictionary);
console.log('----------------');

/**
 * Array Type
 * 값을 리스트로 나열할 수 있는 타입
 * 
 * index
 * 0부터 시작 + 1
 */

const season = [
    '봄',
    '여름',
    '가을',
    '겨울'
];

console.log(season);
console.log(season[2]);
// season[0] = '보옴'  // 수정
console.log(typeof season);
console.log('----------------');

/**
 * static typing -> 변수를 선언할 때 어떤 타입의 변수를 선언할지를 명시
 * dynamic typing -> 변수의 타입을 명시적으로 선언하지 않고 값에 의해 타입이 지정됨
 */


/**
 * Hoisting
 * 
 * 모든 변수 선언문이 코드의 최상단으로 이동되는 것처럼 느껴지는 현상
 * var, let, const 모두 hoisting 발생
 * but, var은 hoisting 현상을 막아주지 못하지만, let, const는 막아주므로 let, const 위주로 사용할 것
 */
console.log('Hello');
console.log('World');

console.log(name);  // 변수 선언 전에 호출 -> undefined가 출력됨
var name = '지수';
console.log(name);

// console.log(yujin); // yujin 변수에 초기화 전에 접근할 수 없다는 오류 메시지가 출력됨
let yujin = '유진';
console.log('----------------');


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
console.log(number);

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
myName = myName ?? '정지수';    // 변수 name이 undefined일 경우에 오른쪽 값을 할당해라
// name ??= '정지수';   // 이렇게 사용할 수도 있음
console.log(myName);
console.log('----------------');


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
let stringAge = age.toString();
console.log(typeof stringAge, stringAge);

// 2) 암묵적
// string으로 변환
let test = age + '';
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





/**
 * try...catch
 * 
 * 1) 발생 시킬 때 -> 'error를 던진다'라고 표현 (throw)
 * 2) 명시적으로 인지할 때 -> 'error를 잡는다'라고 표현 (catch)
 */

function runner() {
    try {
        console.log('Hello');

        // throw new Error('문제 발생!');   // 에러 발생

        console.log('Jisoo !')  // 출력되지 않음
    } catch (e) {   // 던진 error를 잡음
        console.log('* catch *');
        console.log(e);
    } finally {     // error 발생 여부와 상관 없이 실행됨 (optional)
        console.log('* finally *');
    }
    
    
}

runner();
