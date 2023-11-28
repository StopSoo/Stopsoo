/**
 * Callback
 * 선언하고 나중에 실행해도 되는 함수 
 */
function waitAndRun(){
    // setTimeout : 비동기 함수
    // 2초 뒤에 실행
    setTimeout(() => {
        console.log('끝');
    }, 2000);
}

waitAndRun();

function waitAndRun2() {    // chaining - 이와 같이 작성하는 것은 좋지 않음 !
    setTimeout(() => {
        console.log('1번 콜백 끝');
        setTimeout(() => {
            console.log('2번 콜백 끝');
            // ...
        }, 2000);
    }, 2000);
}

/**
 * Promise
 * - 두 개의 파라미터를 받는다. 이름은 중요치 않으나, 순서가 중요 !
 * - resolve를 통해 then의 파라미터인 res로 인자를 넘긴다. 
 * - EX> if(xxx) {
 *           resolve('어쩌구');
 *       } else {
 *           reject('저쩌구');
 *       }
 * - finally : 항상 실행되는 구문
 */
// Ex1
const timeoutPromise = new Promise((resolve, reject) => {
    setTimeout(() => {
        resolve('완료');
    }, 2000);
});

timeoutPromise.then((res) => {
    console.log(res);
});

timeoutPromise;

// Ex2
const getPromise = (seconds) => new Promise((resolve, reject) => {
    setTimeout(() => {
        resolve('완료');
    }, seconds * 1000);
});

getPromise(3).then((res) => {
    console.log('first');
    console.log(res);

    return getPromise(3);   // 계속 반복하고 싶을 경우 이와 같이 chaining이 가능하다. 
}).then((res) => {
    console.log('second');
    console.log(res);
})

/**
 * 출력 결과
 * (3초 뒤)
 * first
 * 완료
 * (3초 뒤)
 * second
 * 완료 
 * */


// Ex3
const getPromise2 = (seconds) => new Promise((resolve, reject) => {
    setTimeout(() => {
        reject('에러');
    }, seconds * 1000);
});

getPromise2(3).then((res) => {
    console.log(res);  
}).catch((res) => {
    console.log('first catch');
    console.log(res);
}).finally(() => {
    console.log('finally');
})

/**
 * 출력 결과
 * (3초 뒤)
 * first catch
 * 에러
 * finally
 */

// 여러 개의 promise 동시에 실행 가능
// 가장 느린 함수 기준으로 then이 실행된다. 
Promise.all([
    getPromise(1),
    getPromise(2),
    getPromise(1),
]).then((res) => {
    console.log(res);
});

/**
 * 출력 결과
 * (2초 뒤)
 * [ '완료', '완료', '완료' ]
 */