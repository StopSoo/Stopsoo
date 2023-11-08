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
// 지정된 개수의 인자만 받는 게 아니라, 제한 없이 받고 싶을 때 ...arguments를 사용
// arguments만 출력하면 객체 형태로 반환하는데, 이 때 Object.values(arguments)를 통해 인자 값들만 가져온다 (!)
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