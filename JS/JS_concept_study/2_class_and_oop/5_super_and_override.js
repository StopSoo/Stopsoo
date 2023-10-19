/**
 * Super and Override
 */
class IdolModel {
    name;
    year;

    constructor(name, year) {
        this.name = name;
        this.year = year;
    }

    sayHello() {
        return `안녕하세요, ${this.name}입니다.`;
    }
}

class FemaleIdolModel extends IdolModel {
    part;   // Ex> 노래, 춤

    constructor(name, year, part) {
        // name, year는 부모 클래스에서 초기화하기 때문에 아래와 같이 super 키워드를 사용한다.
        super(name, year);
        this.part = part;
    }

    sayHello() {
        // constructor가 아닌 곳에서 변수를 사용할 때는 super가 아닌 this를 사용해야 한다 (!)
        // return `안녕하세요, ${this.name}입니다. 저는 ${this.part}를 맡고 있습니다.`;

        // 아래와 같이 부모 클래스의 함수를 사용할 때는 super 키워드 사용이 가능하다. 
        return `${super.sayHello()} 저는 ${this.part}를 맡고 있습니다.`;
    }
}

const yuJin = new FemaleIdolModel('안유진', 2003, '보컬');
console.log(yuJin);
console.log(yuJin.sayHello());

