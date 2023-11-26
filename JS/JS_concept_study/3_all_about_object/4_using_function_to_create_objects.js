/**
 * Using function to create objects
 * 
 * - 생성자 함수라면 꼭 new 키워드를 사용할 것 !
 */
function IdolModel(name, year) {
    /* 예외 처리 (!) */
    if(!new.target){    // 객체가 undefined일 경우
        return new IdolModel(name, year);   // new 키워드를 사용해서 객체를 생성 후 반환한다. 
    }

    this.name = name;
    this.year = year;

    this.dance = function(){
        return `${this.name}가 춤을 춥니다.`;
    }
}

const jisoo = new IdolModel('정지수', 1999);    // new 키워드 필수 !
console.log(jisoo);
console.log(jisoo.dance());

const jisoo2 = IdolModel('정지수', 1999);   // new 키워드를 사용하지 않았을 경우 undefined 출력
console.log(jisoo2);
console.log(global.name);   // new 키워드를 사용하지 않았을 때는 위에서 설정한 값들이 global에 가서 붙는다.

const IdolModelArrow = (name, year) => {    // arrow 함수를 사용해서 생성자 함수 만들기는 불가능하다는 것을 알 수 있다 (!)
    this.name = name;
    this.year = year;
};
// const jisoo3 = new IdolModelArrow('정지수', 1999);