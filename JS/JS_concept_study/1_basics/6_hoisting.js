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