/**
 * Class Keyword
 */
class IdolModel {
    // JS에서는 속성을 정의하는 게 필수가 아니다 (!)
    // name;
    // year;

    // 생성자
    constructor(name, year) {   
        this.name = name;
        this.year = year;
    }
    // 함수 정의
    // function 키워드가 필요하지 않다. 
    sayName() {
        return `안녕하세요! 저는 ${this.name}입니다.`;
    }
}
const jisoo = new IdolModel('정지수', 1999);  // 객체 생성 시 인자 꼭 넣어주기 !
console.log(jisoo);     // 클래스에 해당되는 객체가 출력되는 것을 알 수 있음.
console.log(jisoo.name);
console.log(jisoo.year);
console.log(jisoo.sayName());

console.log(typeof IdolModel);  // function
console.log(typeof jisoo);  // object