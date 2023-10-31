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
// jisoo라는 객체가 Object에 이미 정의되어 있는 toString()까지 상속받은 것을 확인할 수 있다. 
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
console.log(jisoo2.sayHello === sieun2.sayHello);   // false -> 함수가 각 객체의 소유라는 뜻
// hasOwnProperty : 해당 프로퍼티가 상속 받은 프로퍼티인지, 객체 고유의 프로퍼티인지 판별
console.log(jisoo2.hasOwnProperty('sayHello')); // true -> 객체 고유의 프로퍼티라는 뜻

function IdolModel3(name, year) {
    this.name = name;
    this.year = year;
}
// 객체에 속하는 함수가 아닌 IdolModel3라는 생성자 함수에 속하는 함수
IdolModel3.prototype.sayHello = function() {
    return `${this.name}이 인사합니다.`;
}

const jisoo3 = new IdolModel3('정지수', 1999);
const sieun3 = new IdolModel3('이시은', 1999);
// IdolModel3의 프로토타입에 함수를 선언했기 때문에 함수 자체는 같은 객체 
console.log(jisoo3.sayHello === sieun3.sayHello);   // true
console.log(jisoo3.hasOwnProperty('sayHello')); // false -> 객체 고유의 프로퍼티가 아님

// 기존 생성자에 static method 만들기 
IdolModel3.sayStaticHello = function() {
    return '안녕하세요 저는 static method입니다.';
}
console.log(IdolModel3.sayStaticHello());


/**
 * Overriding
 */
function IdolModel4(name, year) {
    this.name = name;
    this.year = year;
    // Override
    // 따라서 객체를 선언한 후 객체에 대해 함수를 실행하면 prototype에 선언된 함수가 아닌 이 함수가 적용됨 
    this.sayHello = function() {
        return `안녕하세요 저는 인스턴스 메서드입니다.`;
    }
}
// 객체에 속하는 함수가 아닌 IdolModel4에 속하는 함수 추가 (객체에 속하는 함수보다 더 상위임)
IdolModel4.prototype.sayHello = function() {
    return '안녕하세요 저는 prototype method입니다.';
}
const jisoo4 = new IdolModel4('정지수', 1999);
// 프로퍼티 셰도잉 -> class에서 override
console.log(jisoo4.sayHello());


/**
 * getPrototypeOf, setPrototypeOf
 * 
 * 인스턴스의 __proto__ 변경 vs 함수의 prototype 변경
 */

// 1. 인스턴스의 __proto__ 변경
// 함수는 같은 이름으로 또 선언해도 덮어쓸 수 있다. 
function IdolModel(name, year) {
    this.name = name;
    this.year = year;
}

IdolModel.prototype.sayHello = function() {
    return `${this.name}이 인사를 합니다.`;
}

function FemaleIdolModel(name, year) {
    this.name = name;
    this.year = year;

    this.dance = function() {
        return `${this.name}이 춤을 춥니다.`;
    }
}

const jiWon = new IdolModel('지원', 1998);
const boGyung = new FemaleIdolModel('보경', 1999);

// sayHello 함수가 존재하는 걸 확인 가능 
// jiWon의 __proto__는 IdolModel의 prototype이다. (!)
// 결론 : Object.getPrototypeOf를 하면 해당 객체의 __proto__ 값을 가져온다. 
console.log(jiWon.__proto__);   
console.log(jiWon.__proto__ === IdolModel.prototype);   // true
console.log(Object.getPrototypeOf(jiWon) === IdolModel.prototype);  // true

console.log(jiWon.sayHello());
// console.log(boGyung.sayHello()); // FemalIdolModel에는 sayHello가 없기 때문

// 이미 생성된 객체의 상속 chain, prototype을 변경 !
Object.setPrototypeOf(boGyung, IdolModel.prototype);    
console.log(boGyung.sayHello());
// prototype을 바꿨기 때문에 아래와 같은 결과가 출력됨 
console.log(boGyung.constructor === FemaleIdolModel);   // false
console.log(boGyung.constructor === IdolModel); // true
console.log(Object.getPrototypeOf(boGyung) === FemaleIdolModel.prototype);  // false -> 객체의 prototype을 변경했기 때문
console.log(Object.getPrototypeOf(boGyung) === IdolModel.prototype);    // true
console.log(FemaleIdolModel.prototype === IdolModel.prototype); // false -> 생성자 함수의 프로토타입은 전혀 변경되지 않았음을 (!)
console.log('------');

// 2. 함수의 prototype 변경
FemaleIdolModel.prototype = IdolModel.prototype;

const yoonJi = new FemaleIdolModel('윤지', 2003);
console.log(Object.getPrototypeOf(yoonJi) === FemaleIdolModel.prototype);   // true -> 애초에 Female로 생성했으므로
console.log(FemaleIdolModel.prototype === IdolModel.prototype); // true -> 위에서 변경했으므로