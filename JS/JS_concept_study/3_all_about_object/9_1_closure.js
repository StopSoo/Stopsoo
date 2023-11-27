/**
 * Closure
 * 
 * A closure is the combination of a function and the lexical environment within which that function was declared.
 * => 상위 함수보다 하위 함수가 더 오래 살아 있는 경우를 closure라고 한다. 
 */
function getNumber(){
    var number = 5;

    function innerGetNumber(){
        return number;
    }

    return innerGetNumber();    // 함수를 실행해서 반환
}
// console.log(number); // error 발생
console.log(getNumber());   // [Function: innerGetNumber]

// Q. innerGetNumber가 getNumber보다 더 오래 살아 있으려면 ?
function getNumber(){
    var number = 5;

    function innerGetNumber(){
        return number;
    }

    return innerGetNumber; // 함수를 실행해서 반환 X (!)
}
const runner = getNumber();
console.log(runner);    // [Function: innerGetNumber]
console.log(runner());  // 5

/**
 * 1) 데이터 캐싱
 */
// function cacheFunction(newNumb){
//     var number = 10 * 10;
//     return number * newNumb;
//     // 이렇게 작성할 경우 number 계산을 함수를 실행할 때마다 해야 함 -> 비효율적 
// }

function cacheFunction(){
    // 아래 계산은 매우 오래 걸린다는 가정을 했을 때 훨씬 더 효율적
    var number = 10 * 10;

    function innerCacheFunction(newNumb){
        return number * newNumb;
    }

    return innerCacheFunction;  // 함수를 실행해서 반환 X
}
const runner2 = cacheFunction();    // 이렇게 작성하면 number 계산을 한 번만 하게 됨 -> 효율적
console.log(runner2(10));
console.log(runner2(20));

/**
 * 2) 데이터 캐싱 2 : 값을 반복적으로 변환해야 할 떄 
 */
function cacheFunction2(){
    var number = 99;

    function increment(){
        number++;
        return number;
    }

    return increment;   // 함수 자체를 반환
}
const runner3 = cacheFunction2();
console.log(runner3()); // 100
console.log(runner3()); // 101

/**
 * 3) 정보 은닉
 */
function Idol(name, year){
    this.name = name;

    var _year = year;   // 변수명 앞에 언더바(_) 붙이기

    this.sayNameAndYear = function(){
        return `안녕하세요 저는 ${this.name}입니다. ${_year}년에 태어났습니다.`;
    }
}
const jisoo = new Idol('정지수', 1999);
console.log(jisoo.sayNameAndYear());
console.log(jisoo._year);   // undefined -> 객체의 프로퍼티에 접근 불가