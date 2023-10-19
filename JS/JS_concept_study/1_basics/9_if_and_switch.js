/**
 * If and Switch
 * 
 * if - else if - else
 */
let myNumber = 5;
if (myNumber % 2 === 0) {
    console.log("짝수입니다.")
} else {
    console.log("홀수입니다.")
}
console.log('----------------');

const englishDay = 'saturday';
let koreanDay;

switch(englishDay) {
    case 'monday':
        koreanDay = '월요일';
        break;  // break문 반드시 사용 !
    case 'tuesday':
        koreanDay = '화요일';
        break;
    case 'wednesday':
        koreanDay = '수요일';
    case 'thursday':
        koreanDay = '목요일';
    case 'friday':
        koreanDay = '금요일';
    default:
        koreanDay = '주말';
}
console.log(koreanDay)  // 주말
console.log('----------------');