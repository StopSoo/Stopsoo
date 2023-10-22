/**
 * Scope
 */
var numberOne = 20;

function levelOne() {
    // 함수 밖에 있는 변수에 접근 가능
    console.log(numberOne);
}
// levelOne();  // 20

function levelOne() {
    var numberOne = 40;
    // 가장 가까운 scope에 있는 변수를 가져옴
    console.log(numberOne);
}
// levelOne();  // 40

console.log(numberOne); // 맨 위에 선언된 변수를 해치지 않음
console.log('-----------');

function levelOne() {
    var numberOne = 40;
    
    function levelTwo() {
        var numberTwo = 99;

        console.log(`levelTwo numberTwo : ${numberTwo}`);
        console.log(`levelTwo numberOne : ${numberOne}`);
    }

    levelTwo();
    console.log(`levelOne numberOne : ${numberOne}`);
}
levelOne();
console.log('-----------');

/**
 * JS -> Lexical Scope
 * - 선언된 위치가 상위 스코프를 정한다. 
 * 
 * Dynamic Scope
 * - 실행한 위치가 상위 스코프를 정한다.
 */
var numberThree = 3;

function functionOne() {
    var numberThree = 100;

    functionTwo();
}

function functionTwo() {
    console.log(numberThree);
}

functionOne();  // 3 -> global scope에서 가져옴
console.log('-----------');

// for loop, while loop, if문과 같은 block level scope에서
// var 키워드는 새로운 scope를 만들어내지 않는다. 
var i = 999;
for (var i = 0; i < 10; i++) {
    console.log(i);
}
console.log(`i in global scope : ${i}`); // global scope에서도 값이 변경된 것을 확인할 수 있다. 

i = 999;
for (let i = 0; i < 10; i++) {
    console.log(i);
}
console.log(`i in global scope : ${i}`); // global scope에 선언된 i의 값이 바뀌지 않았음을 확인할 수 있다. 
