/* 기록용 */
import React, {useEffect, useMemo, useCallback, useRef} from 'react';

/* useEffect hook */
useEffect(() => {
  // 컴포넌트가 mount된 이후, 
  // 의존성 배열에 있는 변수들 중 하나라도 값이 변경될 경우 실행된다.
  // 의존성 배열에 빈 배열([])을 넣으면 mount와 unmount 시에 한 번만 실행된다.
  // 의존성 배열 생략 시 컴포넌트 업데이트 시마다 실행된다.
  return () => {
    // 컴포넌트가 mount 해제되기 전에 실행된다.
    // ...
  }
}, // [의존성 변수1, 의존성 변수2, ...]
);

/* useMemo hook */
// parameter : create 함수와 의존성 배열
// 의존성 배열에 들어있는 요소들이 변했을 때만 create 함수를 호출한다.
// useMemo hook을 사용하면, component의 재렌더링 시마다 연산량이 높은 작업을 반복하는 것을 피한다. -> 빠른 렌더링 속도
// 렌더링 동안 실행된다. 
const memoizedValue = useMemo(
  () => {
    // 연산량이 높은 작업을 수행하여 결과를 반환
    // return computeExpensiveValue(의존성 변수1, 의존성 변수2);
  }, 
  // [의존성 변수1, 의존성 변수2]
);

// 만약 의존성 배열을 넣지 않을 경우, 매 렌더링마다 함수가 실행된다.
// 따라서 useMemo hook에 의존성 배열을 넣지 않고 사용하는 것은 의미가 없다.
const memoizedValue2 = useMemo(
  () => computeExpensiveValue(a, b)
);

// 의존성 배열이 빈 배열일 경우, 컴포넌트 mount 시에만 함수가 실행된다.
const memoizedValue3 = useMemo(
  () => {
    return computeExpensiveValue(a, b);
  }, 
  []
);


/* useCallback hook */
// useMemo hook과 유사하지만, 값이 아닌 함수를 반환한다.
// parameter로 받는 함수를 callback이라고 부른다.
// 의존성 배열 요소 중 하나라도 변경되면, memoization된 callback 함수를 반환한다.
const memoizedCallback = useCallback(
  () => {
    // doSomething(의존성 변수1, 의존성 변수2);
  },
  // [의존성 변수 1, 의존성 변수2]
);

// 다음 두 줄의 코드는 완전히 동일한 역할을 한다.
// useCallback(함수, 의존성 배열);
// useMemo(() => 함수, 의존성 배열);

// useCallback hook을 사용하지 않고, 컴포넌트 내에서 저으이한 함수를 자식 컴포넌트 내 props로 넘겨 사용하는 경우,
// 부모 컴포넌트가 렌더링될 때마다 자식 컴포넌트도 함께 렌더링된다. 
// 하지만, useCallback hook 사용 시 특정 변수의 값이 변한 경우에만 함수를 재정의하게 되므로,
// 함수를 재정의하지 않을 때는 자식 컴포넌트도 재렌더링하지 않는다. 


/* useRef */
// Ref : 특정 컴포넌트에 접근할 수 있는 객체
// refObject.current : 현재 참조하고 있는 element를 가리킨다.
// useRef() hook은 내부의 데이터가 변경되었을 때 별도로 알리지 않는다.

/* Hook의 규칙 */
// 1. hook은 컴포넌트가 렌더링 될 때마다 매번 같은 순서로 호출되어야 한다.
//    조건문, 반복문 등에 의해 특정한 때만 호출되면 안된다는 뜻이다.
// 2. hook은 리액트 함수 컴포넌트에서만 호출해야 한다.
// => eslint-plugin-react-hooks 사용하기

/* Custom Hook 만들기 */
// - 중복되는 로직을 추출하여 custom hook으로 만든다.
// - 이름은 꼭 !!! "use"로 시작하고, 내부에서 다른 hook을 호출하는 하나의 js 함수
// - 여러 개의 컴포넌트에서 하나의 custom hook을 사용할 때, 컴포넌트 내부에 있는 모든 state와 effcts는 전부 분리되어 있다.
//   각 custom hook 호출에 대해서 분리된 state를 얻게 되기 때문이다.
// - 각 custom hook의 호출 또한 완전히 독립적이다.