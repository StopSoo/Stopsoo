/**
 * Loops
 * 
 * 1) for
 * 2) while
 * 똑같이 continue, break 사용 가능
 */
for (let i = 0; i < 10; i++) {
    console.log(i);
}
console.log('-----------');

/**
 * for...in
 * 
 * array에서 key 값을 가져오고 싶을 때 사용
 */

const sooyoung = {
    name: '정수영',
    year: 1999,
    nickname: '바보'
}

for (let key in sooyoung) {
    console.log(key, sooyoung[key]);
}
console.log('-----------');

const Day6MembersArray = ['제이', '원필', '성진', '영케이', '도운'];
for (let key in Day6MembersArray) {
    console.log(key, Day6MembersArray[key]);    // 인덱스와 함께 출력 
}
console.log('-----------');

/**
 * for...of
 * 
 * array에서 value 값을 가져오고 싶을 때 사용
 */
for (let value of Day6MembersArray) {
    console.log(value);
}
console.log('-----------');

/**
 * while
 */
let n = 0;
while (n < 10) {
    n++;
    console.log(n);
}
console.log('-----------');

/**
 * do...while
 */
k = 0;
do {
    k++;
} while (k < 10);
console.log(k);
console.log('-----------');