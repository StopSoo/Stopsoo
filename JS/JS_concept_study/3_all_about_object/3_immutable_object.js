/**
 * Immutable Object
 */
const jisoo = {
    name: '정지수',
    year: 1999,
    // getter
    get age() {
        return new Date().getFullYear() - this.year();
    },
    // setter
    set age(age) {
        this.year = new Date().getFullYear() - age;
    }
}
console.log(jisoo);

/**
 * Extensible 
 * - 확장 가능한지의 여부
 * - 기본 값 : true
 */
console.log(Object.isExtensible(jisoo));    // true

jisoo['nickname'] = 'stopsoo';  // 값 추가 
console.log(jisoo);

// 다음과 같이 Object.preventExtensions(객체명)를 통해 해당 객체의 확장 가능 여부를 false로 변경할 수 있다.
Object.preventExtensions(jisoo);
console.log(Object.isExtensible(jisoo));   // false로 변경되었고, 이후에 추가하려고 작성한 프로퍼티는 추가되지 않는다.

delete jisoo['nickname'];   // Extensible이 false여도 삭제는 가능하다.
console.log(jisoo);
console.log('--------------------------------------------------');

/**
 * Seal
 * - 봉인되어있는지에 대한 여부
 * - 기본 값 : false
 * - Seal을 하는 것은 configurable 특성을 false로 만드는 것과 같다. 
 */
const jisoo2 = {
    name: '정지수',
    year: 1999,
    // getter 
    get age() {
        return new Date().getFullYear() - this.year();
    },
    // setter 
    set age(age) {
        this.year = new Date().getFullYear() - age;
    }
}
console.log(jisoo2);
console.log(Object.isSealed(jisoo2));   // false
// 다음과 같이 Object.seal(객체명)을 통해 객체를 seal할 수 있다. 
Object.seal(jisoo2);
console.log(Object.isSealed(jisoo2));   // true

jisoo2['nickname'] = 'stopsoo';
console.log(jisoo2);    // 프로퍼티가 추가되지 않았음을 확인할 수 있다.

delete jisoo2['name'];  // Extensible과 다르게 Seal은 삭제도 되지 않음을 확인할 수 있다.
console.log(jisoo2);

// configurable이 false가 된 것을 확인할 수 있다. 
Object.defineProperty(jisoo2, 'name', {
    writable: false,
})
console.log(Object.getOwnPropertyDescriptor(jisoo2, 'name'));

/**
 * Freezed
 * - 가장 높은 immutable 등급
 * - 읽기 외에 모든 기능을 불가능하게 만든다.
 * - 기본 값 : false
 * - 프로퍼티 추가, 삭제도 안될 뿐더러, Object.defineProperty를 통한 값 변경도 불가능하다. 
 * - writable, configurable이 모두 false가 된다. 
 */
const jisoo3 = {
    name: '정지수',
    year: 1999,
    // getter
    get age() {
        return new Date().getFullYear() - this.year();
    },
    // setter
    set age(age) {
        this.year = new Date().getFullYear() - age;
    }
}
console.log(Object.isFrozen(jisoo3));   // false
// 다음과 같이 Object.freeze(객체명)을 통해 객체를 freeze할 수 있다. 
Object.freeze(jisoo3);
console.log(Object.isFrozen(jisoo3));   // true

/* nested : 객체 안에 객체 생성 가능 */
// 상위 객체를 frozen하더라도 하위 객체는 frozen되지 않는다 (중요!)
const jisoo4 = {
    name: '정지수',
    year: 1999,
    sieun: {
        name: '이시은',
        year: 1999,
    }
}

Object.freeze(jisoo4);
console.log(Object.isFrozen(jisoo4));   // true
console.log(Object.isFrozen(jisoo4['sieun']));  // false