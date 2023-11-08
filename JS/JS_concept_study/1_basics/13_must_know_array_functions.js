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
 * - 새로운 객체를 생성하는 것
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
console.log('---------------------');

/**
 * sort()
 * - 오름차순
 * - 반환값이 존재 X
 */
friends.sort();
console.log(friends);   // 오름차순
console.log(friends.reverse()); // 내림차순

let numbers = [1, 9, 7, 5, 3,];
console.log(numbers);

// a, b를 비교했을 때 (오름차순) 
// 1) a를 b보다 나중에 정렬하려면 (뒤에 두려면) 0보다 큰 숫자를 반환
// 2) a를 b보다 먼저 정렬하려면 (앞에 두려면) 0보다 작은 숫자를 반환
// 3) 원래 순서를 그대로 두려면 0을 반환
numbers.sort((a, b) => {    
    return a > b ? 1 : -1;
});
console.log(numbers);
// 내림차순
numbers.sort((a, b) => a > b ? -1 : 1);
console.log(numbers);
console.log('---------------------');

/**
 * map()
 * - array 내 모든 값들을 순회하면서 값들을 변형시키는 역할 수행
 */
console.log(friends.map((x) => `99즈 ${x}`));
console.log(friends.map((x) => {
    if (x === '정수영') {
        return `바보 ${x}`;
    } else {
        return `99즈 ${x}`;
    }
}))
console.log(friends);   // 원래의 array는 변경되지 않음

/**
 * filter()
 * - map()과 비슷하게 모든 값들을 순회하면서 값을 변형시키는 역할을 수행
 * - but, true를 반환할 때만 값을 변형시킨다. 
 */
numbers = [1, 8, 7, 6, 3];
console.log(numbers.filter((x) => true));
console.log(numbers.filter((x) => x % 2 === 0).sort()); // 조건에 해당하는 8, 6만 반환 + 정렬까지

/**
 * find()
 * - filter()와 같이 조건이 true가 되는 값을 반환시킨다.
 * - but, 앞에서부터 돌면서 true를 반환하는 "첫 번째" 값만 반환한다는 점이 다르다.
 */
console.log(numbers.find((x) => x % 2 === 0));

/**
 * findIndex()
 */
console.log(numbers.findIndex((x) => x % 2 === 0));

/**
 * reduce()
 * - reduce 함수는 두 개의 파라미터를 갖는다. 첫 번쨰는 함수, 두 번째는 값
 * - 첫 번째 인자로 들어가는 함수는 두 개의 파라미터를 갖는다. p(previous), n(next)
 * - p는 이전 Loop에서 넘어온 값이라고 생각하면 되고, n은 reduce 함수를 실행하는 array에서 하나씩 받는 값이다.
 * - 두 번째 인자는 첫 번째 실행 때 p에 값이 없으므로 그 때 넣는 값이다. 
 */
console.log(numbers.reduce((p, n) => p + n, 0));