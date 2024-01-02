import React from "react";

function Clock(props) {
  // return ();    -> 괄호임 !!
  return (
    <div>
      <h1>안녕, 리액트!</h1>
      <h2>현재 시간: {new Date().toLocaleTimeString()}</h2>
    </div>
  );
}

export default Clock;

/**
 * 리액트 element는 js 객체 형태로 존재한다.
 * 리액트 element는 한 번 결정되면 변경할 수 없다.
 */