/**
 * Static Keyword
 * - 어떤 인스턴스를 받아서 어떻게 정의할지 템플릿화
 */

// class IdolModel {
//     name;
//     year;
//     static sex = 'female'; // static keyword = 객체에 귀속되지 않는다.

//     constructor(name, year) {
//         this.name = name;
//         this.year = year;
//     }
// }

// const jisoo = new IdolModel('정지수', 1999);    
// console.log(jisoo);
// console.log(IdolModel.sex);

/**
 * factory constructor
 */
class IdolModel {
    name;
    year;

    constructor(name, year) {
        this.name = name;
        this.year = year;
    }

    static fromObject(object) { // 객체로부터 정보를 받아와서 새로운 IdolModel 객체를 생성
        return new IdolModel(
            object.name,
            object.year,
        );
    }

    static fromList(list) {
        return new IdolModel(
            list[0],
            list[1],
        );
    }
}

const jisoo2 = new IdolModel.fromObject({   // 객체 생성
    name: '정지수',
    year: 1999,
});
console.log(jisoo2);

const jisoo3 = IdolModel.fromList(
    [
        '정지수',
        1999
    ]
);
console.log(jisoo3);
