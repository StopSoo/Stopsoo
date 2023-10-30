/**
 * Prototype
 */

const testObj = {};
// __proto__ : 모든 객체에 존재하는 프로퍼티
// class 강의에서 배울 때 상속에서 부모 클래스에 해당되는 값
console.log(testObj.__proto__);     // null prototype 

function IdolModel(name, year) {
    this.name = name;
    this.year = year;
}
console.log(IdolModel.prototype);   // {}
// constructor 안에 IdolModel이라는 function이 value로 들어가 있는 걸 볼 수 있다.
console.dir(IdolModel.prototype, {  
    showHidden: true,
});

/* circular reference */
// IdolModel 프로토타입에 있는 constructor는 IdolModel 함수이다. 
console.log(IdolModel.prototype.constructor === IdolModel); // true
// IdolModel 프로토타입에 있는 constructor의 프로토타입은 IdolModel의 프로토타입과 완전히 같다. 
console.log(IdolModel.prototype.constructor.prototype === IdolModel.prototype);

const jisoo = new IdolModel('정지수', 1999);
// 분명 jisoo 객체의 프로퍼티는 name, year 뿐인데 __proto__라는 프로퍼티도 자동으로 추가됨을 확인할 수 있다. 
console.log(jisoo.__proto__);
console.log(jisoo.__proto__ === IdolModel.prototype);   // true
// 아무 프로퍼티도 없는 객체의 부모로 Object의 프로토타입이 들어가는 걸 확인할 수 있다. 
console.log(testObj.__proto__ === Object.prototype);    // true

// IdolModel의 부모는 Function이다.
console.log(IdolModel.__proto__ === Function.prototype);    // true
// Function의 프로토타입의 부모는 Object이다. 
console.log(Function.prototype.__proto__ === Object.prototype);   // true
// IdolModel의 프로토타입은 최상위 객체가 Object의 프로토타입이 된다. 
console.log(IdolModel.prototype.__proto__ === Object.prototype);    // true

// jisoo라는 객체에 toString() 함수를 정의한 적이 없는데 존재하는 걸 확인할 수 있다. 
console.log(jisoo.toString());  
// jisoo라는 객체가 Object에 이미 정의되어 있는 toString()까지 상속받은 것을 확인할 수 있따. 
console.log(Object.prototype.toString());  

function IdolModel2(name, year) {
    this.name = name;
    this.year = year;

    this.sayHello = function() {
        return `${this.name}이 인사합니다.`;
    }
}

const jisoo2 = new IdolModel2('정지수', 1999);
const sieun2 = new IdolModel2('이시은', 1999);
console.log(jisoo2.sayHello === sieun2.sayHello);   // false
// hasOwnProperty : 해당 프로퍼티가 상속 받은 프로퍼티인지, 객체 고유의 프로퍼티인지 판별
console.log(jisoo2.hasOwnProperty('sayHello')); // true -> 객체 고유의 프로퍼티라는 뜻

function IdolModel3(name, year) {
    this.name = name;
    this.year = year;
}

IdolModel3.prototype.sayHello = function() {
    return `${this.name}이 인사합니다.`;
}

const jisoo3 = new IdolModel3('정지수', 1999);
const sieun3 = new IdolModel3('이시은', 1999);
// IdolModel3의 프로토타입에 함수를 선언했기 때문에 함수 자체는 같은 객체 
console.log(jisoo3.sayHello === sieun3.sayHello);   // true

console.log(jisoo3.hasOwnProperty('sayHello')); // false -> 객체 고유의 프로퍼티가 아님