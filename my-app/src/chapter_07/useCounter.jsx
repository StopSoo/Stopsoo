import React, { useState } from "react";

function useCounter(initialValue) {
  // initialValue 값을 파라미터로 받아 count라는 변수에 저장하고, 이 값을 변화시키기 위해 setCount라는 함수를 사용한다.
  const [count, setCount] = useState(initialValue);

  const increaseCount = () => setCount((count) => count + 1);
  const decreaseCount = () => setCount((count) => Math.max(count-1, 0));  // 0 아래로 내려갈 수 없음

  return [count, increaseCount, decreaseCount];
}

export default useCounter;