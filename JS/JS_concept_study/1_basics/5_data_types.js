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

console.log(typeof age);    // number
console.log(typeof temperature);    // number
console.log('----------------');

const infinity = Infinity;  
const nInfinity = -Infinity;   

console.log(typeof infinity);   // number
console.log(typeof nInfinity);  // number
console.log('----------------');

/**
 * 2. String
 * 
 * 문자열도 배열처럼 반복문을 적용할 수 있다.
 * Ex> const target = '가나다라마';
 *     let i = 0;
 *     while (i < target.length) {
 *         console.log(target[i]);
 *         i++;
 *     }
 */

const sieun = '시은';
console.log(typeof sieun);  // string

const univSieun = "'대학생' 시은";  // 따옴표를 구분해서 사용 가능
console.log(univSieun); // '대학생' 시은
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
console.log(java + '스크립트'); // 공백 없이 연결
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
console.log(noInit);    // undefined
console.log(typeof noInit); // undefined
console.log('----------------');

/**
 * 5. null 
 * undefined와 마찬가지로 값이 없다는 뜻이나
 * JS에서는 개발자가 명시적으로 없는 값으로 초기화할 때 사용
 */
let init = null;
console.log(init);  // null
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
console.log(dictionary['red']); // 빨간색
console.log(typeof dictionary); // object
console.log('----------------');

/**
 * Array Type
 * 값을 리스트로 나열할 수 있는 타입
 * 
 * index
 * 0부터 시작해서 + 1
 * 
 * const로 선언했지만, 배열 내부를 변경하는 것은 가능
 * 배열 자체를 바꾸는 것은 불가능
 * Ex> const target2 = ['a', 'b', 'c'];
 * target2[0] = 'h'; => 가능
 * target2 = ['f', 'g']; => 불가능
 * 
 * 배열(array)의 맨 앞에 원소를 추가하는 것은 unshift, 빼는 것은 shift
 * 배열(array)의 맨 뒤에 원소를 추가하는 것은 push, 빼는 것은 pop
 * 배열(array)의 중간 요소를 제거하는 것은 splice
 * Ex1> const target = ['가', '나', '다', '라'];
 *      target.splice(1, 1); // 인덱스 1부터 1개 제거
 *      console.log(target); // ['가', '다', '라']
 * Ex2> target.splice(1);   // 인덱스 1부터 마지막까지 모두 제거
 *      console.log(target); // ['가']
 * Ex3> target.splice(1, 3, '타', '파');    // 인덱스 1부터 3개의 원소 제거 후, '타', '파' 추가
 *      console.log(target); // ['가', '타', '파']
 * Ex4> target.splice(2, 0, '마');  // 인덱스 2부터 아무 것도 안 지우고, 그 자리에 '마'를 추가
 *      console.log(target);    // ['가', '나', '마', '다', '라']
 * 
 * 배열에서 요소 찾기 : includes
 * Ex> const target = ['가', '나', '다', '라', '마'];
 *     const result1 = target.includes('다');   
 *     const result2 = target.includes('카');
 *     console.log(result1, result2);   // true false
 * 
 * 배열에서 인덱스 추출하기 : indexOf / lastIndexOf
 * 없으면 -1을 반환한다.
 * Ex> const target = ['가', '나', '다', '라', '마'];
 *     const result1 = target.indexOf('다');    
 *     const result2 = target.lastIndexOf('라');       
 *     console.log(result1, result2);   // 2 1
 */

const season = [
    '봄',
    '여름',
    '가을',
    '겨울'
];

console.log(season);
console.log(season[2]); // 가을
season[0] = '보옴'  // 수정
console.log(season);
console.log(typeof season); // object
console.log('----------------');

/**
 * static typing -> 변수를 선언할 때 어떤 타입의 변수를 선언할지를 명시
 * dynamic typing -> 변수의 타입을 명시적으로 선언하지 않고 값에 의해 타입이 지정됨
 */