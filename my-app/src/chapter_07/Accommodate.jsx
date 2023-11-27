import React, { useState, useEffect } from "react";
import useCount from "./useCounter";

const MAX_CAPACITY = 10;

function Accommodate(props) {
  const [isFull, setIsFull] = useState(false);
  const [count, increaseCount, decreaseCount] = useCount(0);
  // 의존성 배열이 없는 형태
  // 컴포넌트 mount 직후에 호출, 컴포넌트가 업데이트될 때마다 호출됨
  useEffect(() => {
    console.log("===========================");
    console.log("useEffect() is called.");
    console.log(`isFull: ${isFull}`);
  });
  // 의존성 배열이 있는 형태
  // 컴포넌트 mount 직후에 호출, count 값이 바뀔 때마다 호출됨
  useEffect(() => {
    setIsFull(count >= MAX_CAPACITY); // 용량이 가득 찼는지의 여부(bool 값)를 isFull 변수에 저장
    console.log(`Current count value: ${count}`);
  }, [count]);

  return(
    <div style={{ padding: 16 }}>
      <p>{`총 ${count}명 수용했습니다.`}</p>

      <button onClick={increaseCount} disabled={isFull}>입장</button>
      <button onClick={decreaseCount}>퇴장</button>

      {isFull && <p style={{ color: "red" }}>정원이 가득 찼습니다.</p>} 
      {/* 조건문 사용 */}
    </div>
  );
}

export default Accommodate;