/**
 * this
 * 
 * - js는 Lexical scope를 사용하기 때문에 함수의 상위 스코프가 정의 시점에 평가된다.
 * - 하지만 this 키워드는 바인딩이 객체가 생성되는 시점에 결정된다 !!!!!
 */
const testFunction = function(){
    return this;
}
console.log(testFunction());
console.log(testFunction() === global); // this가 global과 맵핑되는 것을 확인할 수 있다.
console.log('----------');

const jisoo = {
    name: '정지수',
    year: 1999,
    sayHello: function(){
        return `안녕하세요 저는 ${this.name}입니다.`;
    },
}
console.log(jisoo.sayHello());

function Person(name, year){    // 함수 생성자
    this.name = name;
    this.year = year;

    this.sayHello = function(){
        return `안녕하세요 저는 ${this.name}입니다.`;
    }
}
const jisoo2 = new Person('정지수', 1999);
console.log(jisoo2.sayHello());

Person.prototype.dance = function(){
    return `${this.name}가 춤을 춥니다.`;
}
console.log(jisoo2.dance());

/**
 * this 키워드가 가리키는 것
 * 
 * 1) 일반 함수 호출 시, this는 최상위 객체 (global 또는 window)를 가리킨다.
 * 2) 메서드로 호출할 땐 호출된 객체를 가리킨다.
 * 3) new 키워드를 사용해서 객체를 생성할 땐 생성된 객체를 가리킨다. 
 */

/**
 * 원하는 곳에 객체를 매핑하는 방법
 * 
 * 1) apply()
 * 2) call()
 * 3) bind()
 */
function returnName(){
    return this.name;
}
console.log(returnName());  // undefined -> global에 매핑되었다는 뜻

const jisoo4 = {
    name: '정지수',
}
console.log(returnName.call(jisoo4));   // returnName 함수를 jisoo4라는 객체에 바인딩해서 호출하겠다.
console.log(returnName.apply(jisoo4));

/**
 * 차이점
 * 1) call -> 컴마(,)를 기반으로 argument를 순서대로 넘긴다.
 * 2) apply -> argument를 리스트로 입력해야 한다.
 */
function multiply(x, y, z){
    return `${this.name} / 결과값 : ${x * y * z}`;
}
console.log(multiply.call(jisoo4, 3, 4, 5));
console.log(multiply.apply(jisoo4, [3, 4, 5]));

/**
 * bind()
 * - 바로 함수가 실행되지 않고 반환받아 놓은 후 나중에 실행할 수 있다는 차이점이 있다.
 */
const laterFunc = multiply.bind(jisoo4, 3, 4, 5);
console.log(laterFunc);
console.log(laterFunc());   // 함수 실행