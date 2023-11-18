import React, { useState } from "react";

// function으로 변경
function ConfirmButton(props) {
  // isConfirmed 변수의 초기값은 false
  // isConfirmed 변수 값을 설정하는 함수 이름은 setIsConfirmed
  const [isConfirmed, setIsConfirmed] = useState(false);

  const handleConfirm = () => {
    setIsConfirmed((prevIsConfirmed) => !prevIsConfirmed);
  };

  return (
    <button 
      onClick={handleConfirm}
      disabled={isConfirmed}
    >
      {isConfirmed ? "확인됨" : "확인하기"}
    </button>  
  );
}

export default ConfirmButton;