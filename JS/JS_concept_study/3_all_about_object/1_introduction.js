/**
 * All about objects
 * 
 * 객체를 선언할 때 사용할 수 있는 방법들
 * 1) object를 생성해서 객체 생성 - 기본기 {}
 * 2) class를 인스턴스화해서 생성 - class와 OOP
 * 3) function을 사용해서 객체를 생성
 */

// 방법 1 - {}를 통한 객체 생성
const yuJin = {
    name: '안유진',
    year: 2003,
};
console.log(yuJin);

// 방법 2 - class를 통한 객체 생성
class IdolModel{
    name;
    year;

    constructor(name, year){
        this.name = name;
        this.year = year;
    }
}
console.log(new IdolModel('안유진', 2003));

// 방법 3 - 생성자 함수를 통한 객체 생성
function IdolFunction(name, year){
    // 함수에서도 this 키워드를 사용할 수 있다. 
    this.name = name;
    this.year = year;
}
// 사용은 클래스 키워드를 사용하는 것처럼 하면 된다 !
// new 키워드 필수적
const gaEul = new IdolFunction('가을', 2002);
console.log(gaEul);