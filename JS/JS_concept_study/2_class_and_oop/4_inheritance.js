/**
 * Inheritance
 */
class IdolModel {
    name;
    year;

    constructor(name, year) {
        this.name = name;
        this.year = year;
    }
}

class FemaleIdolModel extends IdolModel {   // IdolModel 클래스를 상속 받음
    dance() {
        return `여자 아이돌이 춤을 춥니다.`;
    }
}

class MaleIdolModel extends IdolModel {   // IdolModel 클래스를 상속 받음
    sing() {
        return `남자 아이돌이 노래를 부릅니다.`;
    }
}

// 둘 다 상속 받은 부모 클래스의 생성자를 이용해서 객체를 생성하고 값을 초기화
const yuJin = new FemaleIdolModel('안유진', 2003);
console.log(yuJin);
const jiMin = new MaleIdolModel('지민', 1995);
console.log(jiMin);

console.log(yuJin.dance());
console.log(yuJin.name);

console.log(jiMin.sing());
console.log(jiMin.year);
console.log('------------------');

console.log(yuJin instanceof IdolModel);    // true
console.log(yuJin instanceof FemaleIdolModel);  // true
console.log(yuJin instanceof MaleIdolModel);    // false