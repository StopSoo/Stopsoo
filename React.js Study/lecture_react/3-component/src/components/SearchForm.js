import React from "react";
// export default : 해당 컴포넌트를 기본 모듈로 등록
// class와 function 중 SearchForm 컴포넌트는 state를 사용해야 하므로 class를 선택
// state를 사용할 필요가 없어졌으므로 function으로 변경
// function component로 들어오는 걸 props로 하거나, 해체 문법을 이용헤 다 나열하거나 !
const SearchForm = ({ value, onChange, onSubmit, onReset }) => {
  const handleSubmit = (event) => {
    event.preventDefault();
    onSubmit();
  }

  const handleReset = () => {
    onReset();
  }

  const handleChangeInput = (event) => {
    onChange(event.target.value);
  }

  return (
    <form onSubmit={handleSubmit} onReset={handleReset}>
      <input 
        type="text"
        placeholder="검색어를 입력하세요"
        autoFocus
        value={value}
        onChange={handleChangeInput}
      />
      {value.length > 0 && (
        <button type="reset" className="btn-reset" />
      )}
    </form>
  );
}

export default SearchForm;