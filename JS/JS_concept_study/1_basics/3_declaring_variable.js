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
console.log(name);  // 정지수

var _age = 32;   // 숫자 선언

let music = '음악'; 
music = '뮤직'; // 값 변경 가능

const c_music = '음악';
// c_music = '뮤직';    // const로 선언한 변수는 추후에 값을 변경할 수 없다.

let boyFriend;
console.log(boyFriend); // 선언만 하고 할당하지 않은 변수는 출력 시 undefined라고 출력된다.

// const girlFriend2;  // const 키워드로 선언한 변수는 반드시 값을 할당해야 한다. 