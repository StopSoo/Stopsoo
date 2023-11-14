/**
 * Property Attribute
 * 
 * 1) 데이터 프로퍼티 : 키와 값으로 형성된 실질적 값을 갖고 있는 프로퍼티
 * 2) 액세서 프로퍼티 : 자체적으로 값을 갖고 있지는 않지만 다른 값을 가져오거나
 *                  설정할 때 호출되는 함수로 구성된 프로퍼티
 *                  예를 들면 getter / setter
 */

/**
 * getOwnPropertyDescriptor : 객체 이름, 프로퍼티를 인자로 넣기
 * 
 * 1) value : 실제 프로퍼티의 값
 * 2) writable : 값을 수정할 수 있는지의 여부. false로 설정하면 프로퍼티 값을 수정할 수 없다. 
 * 3) enumerable : 열거가 가능한지의 여부. for...in loop 등을 사용할 수 있으면 true를 반환한다.
 * 4) configurable : 프로퍼티 어트리뷰트의 재정의가 가능한지의 여부를 판단한다. 
 *                   false일 경우 프로퍼티 삭제나 어트리뷰트 변경이 금지된다.
 *                   단, writable이 true인 경우 값 변경과 writable을 변경하는 것은 가능하다. 
 */
const jisoo = {
    name: '정지수',
    year: 1999,
}

// 생성자 or 클래스에 바로 점이 붙으면 static 함수다 (!)
console.log(Object.getOwnPropertyDescriptor(jisoo, 'name'));
console.log(Object.getOwnPropertyDescriptor(jisoo, 'year'));

/**
 * getOwnPropertyDescriptors : 객체 이름만 인자로 넣으면 된다.
 * - 모든 프로퍼티들의 프로퍼티 애트리뷰트가 출력된다. 
 */
console.log(Object.getOwnPropertyDescriptors(jisoo));

const jisoo2 = {
    name: '정지수',
    year: 1999,
    // getter
    get age() {
        // Date().getFullYear() : 현재 연도를 알려준다. 
        return new Date().getFullYear() - this.year + 1;    // 한국식 나이
    },
    // setter
    set age(age) {
        this.year = new Date().getFullYear() - age;
    }
}

console.log(jisoo2);
console.log(jisoo2.age);

jisoo2.age = 32;    // setter를 통해 값 변경
console.log(jisoo2.age);    
console.log(jisoo2.year);

console.log(Object.getOwnPropertyDescriptor(jisoo2, 'age'));

/**
 * Writable
 */
// Object에 새로운 프로퍼티를 추가하고 싶을 때는 다음과 같이 할 수 있다.
// 이 방식으로 추가하면 프로퍼티 애트리뷰트들은 모두 true로 설정된다.
jisoo2['height'] = 167;

// 프로퍼티 애트리뷰트까지 함께 정의하고 싶다면 다음과 같이 defineProperty를 사용할 수 있다.
// Object.defineProperty(객체명, 프로퍼티명, {애트리뷰트});
Object.defineProperty(jisoo2, 'height', {
    value: 167,
    // defineProperty 내에서 아래와 같이 직접 true로 설정해주지 않으면 모두 false로 설정된다. 
    writable: true,
    enumerable: true,
    configurable: true,
});
console.log(jisoo2);

jisoo2.height = 180;    // writable: true -> 값 변경 가능 
console.log(jisoo2);    
// writable이 false일 경우, 오류는 나지 않지만 값 변경이 되지 않는다. 

/**
 * Enumerable
 */
// 아래는 모두 열거형이기 때문에 출력이 가능한 것
// 프로퍼티 애트리뷰트 중 하나를 enumerable를 false로 바꾼다면 다음 코드에서 해당 프로퍼티가 출력되지 않는다.
console.log(Object.keys(jisoo2));
for (let key in jisoo2) {
    console.log(key);
}

/**
 * Configurable
 */
Object.defineProperty(jisoo2, 'height', {
    writable: true,
    configurable: false,
});

// configurable을 false로 변경하여 해당 객체의 아래 enumerable 프로퍼티 변경이 불가능하다. 
// Object.defineProperty(jisoo2, 'height', {
//     enumerable: false,
// });

// configurable은 false이지만 writable은 true이므로 값 변경이 가능하다. (!)
Object.defineProperty(jisoo2, 'height', {
    value: 172,
});
console.log(Object.getOwnPropertyDescriptor(jisoo2, 'height'));