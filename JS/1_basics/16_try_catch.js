/**
 * try...catch
 * 
 * 1) 발생 시킬 때 -> 'error를 던진다'라고 표현 (throw)
 * 2) 명시적으로 인지할 때 -> 'error를 잡는다'라고 표현 (catch)
 */

function runner() {
    try {
        console.log('Hello');

        // throw new Error('문제 발생!');   // 에러 발생

        console.log('Jisoo !')  // 출력되지 않음
    } catch (e) {   // 던진 error를 잡음
        console.log('* catch *');
        console.log(e);
    } finally {     // error 발생 여부와 상관 없이 실행됨 (optional)
        console.log('* finally *');
    }
    
    
}

runner();