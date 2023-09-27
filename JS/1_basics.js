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

/**
 * static typing -> 변수를 선언할 때 어떤 타입의 변수를 선언할지를 명시
 * dynamic typing -> 변수의 타입을 명시적으로 선언하지 않고 값에 의해 타입이 지정됨
 */
