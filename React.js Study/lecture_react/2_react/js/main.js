// const element = React.createElement("h1", null, "Hello World"); // h1 태그 내 Hello World 문자열을 넣어 element를 생성
// 여러 줄 사용 시 소괄호()로 묶어주기
// class는 예약어이므로 className이라는 키워드를 사용
const element = (
  <header>
    <h2 className="container">검색</h2>
  </header>
);

ReactDOM.render(element, document.querySelector('#app'));