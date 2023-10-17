/**
 * Getter and Setter
 */
class IdolModel {
    name;
    year;

    // 생성자
    constructor(name, year) {   
        this.name = name;
        this.year = year;
    }
    
    /**
     * getter
     * 1) 데이터를 가공해서 새로운 데이터를 반환할 때
     * 2) private 값을 반환할 때
     */
    get nameAndYear() {
        return `${this.name} - ${this.year}`;
    }

    /**
     * setter
     * - parameter를 무조건 하나 이상 받아야 함
     */
    set setName(name) {
        this.name = name;
    }
}

const jisoo = new IdolModel('정지수', 1999);
console.log(jisoo);
console.log(jisoo.nameAndYear);     // 함수가 아니기 때문에 () 사용 금지 !

jisoo.setName = '스탑수';
console.log(jisoo);

// getter & setter가 유용할 때 -> private 변수 사용할 떄 !
class IdolModel2 {
    #name;  // private 변수
    year;   

    constructor(name, year) {
        this.#name = name;
        this.year = year;
    }
    // getter
    get name() {
        return this.#name;
    }
    // setter
    set name(name) {
        this.#name = name;
    }
}

const jisoo2 = new IdolModel2('정지수', 1999);
console.log(jisoo2);    // private 변수인 name은 출력되지 않음
console.log(jisoo2.name);   // getter를 통해 private 변수에 접근 가능

jisoo2.name = '스탑수'; // setter를 통한 변수 값 변경 
console.log(jisoo2.name);