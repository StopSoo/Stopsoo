/**
 * Array Functions
 */
let friends = [
    '정지수',
    '정수영',
    '이시은',
    '배지성',
    '오지원',
    '이준혁',
    '최보경',
    '서민우',
    '박다빈',
]
console.log(friends);

/**
 * push()
 * - 객체를 직접 변경
 * - 값을 추가한 뒤에 길이를 반환
 */
friends.push('친구');
console.log(friends.push('friends'));   // 11
console.log(friends);   // 배열의 끝에 추가된 것을 확인할 수 있다.
console.log('---------------------');

/**
 * pop()
 * - 객체를 직접 변경
 * - array의 마지막 원소를 삭제하고 반환
 */
console.log(friends.pop()); // friends
console.log(friends);
console.log('---------------------');

/**
 * shift()
 * - 객체를 직접 변경
 * - array의 첫 번째 원소를 삭제하고 반환
 */
console.log(friends.shift());   // 정지수
console.log(friends);
console.log('---------------------');

/**
 * unshift()
 * - 객체를 직접 변경
 * - array의 첫 번째 자리에 값을 push
 * - push와 마찬가지로 값을 넣은 후의 길이를 반환
 */
console.log(friends.unshift('정지수'));
console.log(friends);
console.log('---------------------');

/**
 * splice()
 * - 객체를 직접 변경
 * - 인덱스를 통해 array의 원소 삭제
 * - 시작 인덱스, 삭제할 원소의 개수를 인자로 넣음
 */
console.log(friends.splice(0,3));   // 삭제할 값들을 array로 만들어서 반환
console.log(friends);
console.log('---------------------');

// 변수 값 재설정
friends = [
    '정지수',
    '정수영',
    '이시은',
    '배지성',
    '오지원',
    '이준혁',
    '최보경',
    '서민우',
    '박다빈',
]
console.log(friends);

/**
 * concat()
 * - 객체를 직접 변경 X
 * - 값을 추가한 새로운 array를 반환한다.
 */
console.log(friends.concat('바보'));
console.log(friends);   // 원래 friends array는 변경되지 않는다. 
console.log('---------------------');

/**
 * slice()
 * - 객체를 직접 변경 X
 * - 시작 인덱스, 마지막 인덱스 + 1
 */
console.log(friends.slice(0, 3));
console.log(friends);   // 원래 friends array는 변경되지 않는다. 
console.log('---------------------');

/**
 * spread operator
 * - ... 뒤에 spread할 array의 이름을 입력한다. 
 * - 해당 array의 모든 원소들이 퍼져 새로운 array에 들어가게 된다. 
 */
let friends2 = [
    ...friends,
]
console.log(friends2);
console.log('---------------------');

let friends3 = [    // spread하지 않아 배열 안에 배열이 들어간다. 
    friends,
]
console.log(friends3);
console.log('---------------------');

let friends4 = friends2;    // spread되어 들어간다. 
console.log(friends4);
console.log(friends4 === friends2); // true
console.log(friends === [...friends])   // false
console.log('---------------------');

/**
 * join()
 */
console.log(friends.join());    // 배열 원소들을 기본 문자인 ','로 연결
console.log(friends.join('/'));
console.log(friends.join(', '));

/**
 * sort()
 * - 오름차순
 * - 반환값이 존재 X
 */
friends.sort();
console.log(friends);   // 오름차순
console.log(friends.reverse()); // 내림차순


