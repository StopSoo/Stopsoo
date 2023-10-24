/**
 * Async theory
 */
/* sync programming */
function longWork() {
    const now = new Date(); // 현재 시간
    console.log(now);
    /**
     * milliseconds since epoch
     * 1970년도 1월 1일부터 지금 코드가 실행되는 순간까지의 시간을
     * milliseconds로 반환한다. 
     */
    const milliseconds = now.getTime();
    const afterTwoSeconds = milliseconds + 2 * 1000; // 1초 = 1000밀리초

    while(new Date().getTime() < afterTwoSeconds) { 
        // 2초 동안 어떤 작업을 수행
    }
    console.log('완료');
}

console.log('Hello');
longWork();
console.log('World');


/* Async programming */
function longWork() {
    // setTimeout : 비동기로 실행되는 함수
    // 첫 번째 파라미터는 실행할 함수, 두 번째 파라미터는 몇 초 후에 그 함수를 실행할 것인지
    setTimeout(()=>{
        console.log('완료');
    }, 2000);
}

console.log('Hello');
longWork();
console.log('World');