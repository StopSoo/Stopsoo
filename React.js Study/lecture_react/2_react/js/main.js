class App extends React.Component {
  constructor() {
    super();
    // state를 통해 브라우져가 관리하던 것들을 React component가 관리하게 함
    this.state = {
      searchKeyword: "",  // 검색어
    }
  }
  // 검색어에 변화가 있을 때마다 실행되는 함수
  handleChangeInput(event) {
    /* 아래와 같이 state 값만 변경한다고 화면이 rendering되지는 않음 (!)
      무조건 setState() 함수를 사용해서 state 값을 변경해야 한다 !!
    */
    // this.state.searchKeyword = event.target.value;
    // this.forceUpdate();

    /* setState 함수를 실행해야 React는 state 값이 변경된 지 깨닫고 render 함수를 다시 수행 */
    this.setState({
      searchKeyword: event.target.value,
    });
  }

  render() {
    return (
      <>
        <header>
          <h2 className="container">검색</h2>
        </header>
        <div className="container">
          <form>
            <input 
              type="text" 
              placeholder="검색어를 입력하세요" 
              autoFocus 
              value={this.state.searchKeyword}
              onChange={event => this.handleChangeInput(event)}
            />
            <button type="reset" className="btn-reset"></button>
          </form>
        </div>
      </>
    );
  }
}
// const element = React.createElement("h1", null, "Hello World"); // h1 태그 내 Hello World 문자열을 넣어 element를 생성
// 여러 줄 사용 시 소괄호()로 묶어주기
// jsx - class는 예약어이므로 className이라는 키워드를 사용
// jsx - 'onChange'와 같이 camel case로 작성할 것
// input 태그에 onChange 사용하는 이유 : 사용자가 값을 입력할 때마다 해당 값을 띄워줘야 하기 때문
ReactDOM.render(
  <App />, 
  document.querySelector('#app')
);