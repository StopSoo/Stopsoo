/**
 * Async / Await
 * - await은 Promise로 생성한 함수에만 사용할 수 있다 ! 
 */
const getPromise = (seconds) => new Promise((resolve, reject) => {
    setTimeout(() => {
        // resolve('완료');
        reject('에러');
    }, seconds * 1000)
});

async function runner() {
    try {   // resolve 때 실행됨
        const result1 = await getPromise(1);    // await을 통해 반환 받은 값을 result1에 넣기
        console.log(result1);

        const result2 = await getPromise(2);
        console.log(result2);
    } catch (e) {   // reject 때 실행됨
        console.log(e);
    } finally {
        console.log('항상 실행');
    }
    
}

runner();
console.log('실행 끝'); // 이 구문이 먼저 실행됨 -> thread가 await으로 인해 가로막혀있지 않다는 뜻
