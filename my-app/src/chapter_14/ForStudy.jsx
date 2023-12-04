/* 기록용 */
// 2-3번 더 듣는 게 좋을 것 같음 !
import React, { useState } from 'react';

// 리액트에서 렌더링이 일어날 때 context 객체를 구독하는 하위 컴포넌트가 나오면 
// 현재 컨텍스트의 값을 가장 가까이에 있는 상위 레벨의 Provider로부터 받아오게 된다.
// 만약 상위 레벨에 매칭되는 프로바이더가 없다면 이 경우에는 기본 값이 사용된다.
// + 기본 값으로 undefined를 넣으면 기본 값이 사용되지 않는다. 
const MyContext = React.createContext('기본 값');  // Context 객체 생성

// 모든 컨텍스트 객체는 Provider라는 React 컴포넌트를 가지고 있다.
// context.provider 컴포넌트로 하위 컴포넌트들을 감싸주면 모든 하위 컴포넌트들이 해당 컨텍스트의 데이터에 접근할 수 있게 된다.
<MyContext.Provider value={'무슨 값'}></MyContext.Provider>

// Provider의 value를 사용하는 하위 컴포넌트들을 컨슈밍 컴포넌트라고 부른다. 
// 컨슈밍 컴포넌트는 컨텍스트 value의 변화를 지켜보다가, 값이 변경되면 재렌더링된다.
// + 하나의 Provider 컴포넌트는 여러 개의 컨슈밍 컴포넌트와 연결될 수 있고, 여러 개의 프로바이더 컴포넌트는 중첩되어 사용될 수 있다.

/* Provider value에서 주의해야 할 사항 */
// 컨텍스트는 재렌더링 여부를 결정할 때 레퍼런스 정보를 사용하기 때문에 Provider의 부모 컴포넌트가 재렌더링되었을 경우 
// 의도치 않게 컨슈머 컴포넌트가 재렌더링이 일어날 수 있다는 문제점이 존재한다.

// Example Code
// value prop을 위한 새로운 객체가 매번 새롭게 생성되기 때문에, provider 컴포넌트가 재렌더링될 때마다 모든 하위 컨슈머 컴포넌트도 재렌더링된다.
function App(props) {
  return (
    <MyContext.Provider value={{ something: 'something' }}>
      <Toolbar />
    </MyContext.Provider>
  );
}
// 이를 방지하기 위해서는 value prop을 컴포넌트의 state로 옮기고 해당 state의 값을 넣어주어야 한다.
// 수정 후 Code
function App(props) {
  const [value, setValue] = useState({ something: 'something' });
  return (
    <MyContext.Provider value={{ value }}>
      <Toolbar />
    </MyContext.Provider>
  );
}

// 컨슈머 컴포넌트는 Consumer 키워드를 사용한다.
// Consumer 컴포넌트 자식으로 함수가 올 수 있는데 이를 'function as a child'라고 한다.
// 자식으로 들어간 함수가 현재 컨텍스트의 value를 받아 react node로 반환한다. 
<MyContext.Consumer>
  {/* {value => 컨텍스트 값에 따라 컴포넌트들을 렌더링 } */}
</MyContext.Consumer>

// Context.displayName -> Context 객체가 갖는 문자열 속성
// Chrome의 React 개발자 도구에서 context의 provider/consumer 표시 시 displayName을 함께 표시한다.
// Example Code
const MyContext2 = React.createContext('');
MyContext2.displayName = 'MyDisplayName';
// 개발자 도구에 'MyDisplayName.Provider'로 표시된다.
{/* <MyContext2.Provider /> */}
// 개발자 도구에 'MyDisplayName.Consumer'로 표시된다.
{/* <MyContext2.Consumer /> */}

// But, useContext hook을 사용하자 !
function MyComponent(props) {
  const value = useContext(MyContext2); // parameter로 context 객체를 반드시 넣어주어야 한다 ! (consumer/provider는 불가능)

  // return (
  //   ...
  // );
}