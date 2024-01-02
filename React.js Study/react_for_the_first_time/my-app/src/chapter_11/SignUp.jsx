import React, { useState } from 'react';

function SignUp(props) {
  const [name, setName] = useState("");
  const [gender, setGender] = useState("여자");

  const handleChangeName = (event) => {
    setName(event.target.value);
  };
  
  const handleChangeGener = (event) => {
    setGender(event.target.value);
  };

  const handleSubmit = (event) => {
    alert(`이름: ${name}, 성별: ${gender}`);
    event.preventDefault();
    setName('');  // 제출 버튼을 누르면 입력 칸 비우기
    setGender('여자');
  };

  return (
    <form onSubmit={handleSubmit}>
      <label>
        이름:
        <input 
          type="text" 
          value={name} 
          onChange={handleChangeName} />
      </label>
      <br />
      <label>
        성별:
        <select value={gender} onChange={handleChangeGener}>
          <option value="여자">여자</option>
          <option value="남자">남자</option>
        </select>
      </label>
      <button type="submit">제출</button>
    </form>
  );
}

export default SignUp;