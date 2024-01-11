import store from './js/Store.js';

class App extends React.Component {
  constructor() {
    super();
    // state를 통해 브라우져가 관리하던 것들을 React component가 관리하게 함
    this.state = {
      searchKeyword: "",  // 검색어
      searchResult: [], // 검색 결과
      submitted: false, // 검색 여부
    }
  }
  // 검색어에 변화가 있을 때마다 실행되는 함수
  handleChangeInput(event) {
    /* 
      기본적으로 state는 js 객체이다.
      아래와 같이 state 값만 변경한다고 화면이 rendering되지는 않음 (!)
      무조건 setState() 함수를 사용해서 state 값을 변경해야 한다 !!
    */
    // this.state.searchKeyword = event.target.value;
    // this.forceUpdate();

    /* setState 함수를 실행해야 React는 state 값이 변경된 지 깨닫고 render 함수를 다시 수행 */
    const searchKeyword = event.target.value;
    this.setState({
      searchKeyword: searchKeyword,
    });
    // 검색어가 없을 경우 검색 결과를 삭제 
    if (searchKeyword == "") {
      // handleReset() 함수에서 searchKeyword에 관한 상태를 관리하고 있기 때문에 여기서는 return한다. (이해가 잘 안됨)
      return this.handleReset();
    }
  }
  // 검색어를 입력하고 폼 제출 시 실행되는 함수
  handleSubmit(event) {
    event.preventDefault(); // 리렌더링 방지
    console.log('handleSubmit', this.state.searchKeyword);
    this.search(this.state.searchKeyword);  // search 함수로 역할을 위임
  }
  // 검색어를 인자로 받아 검색 결과를 반환하는 함수
  search(searchKeyword) {
    const searchResult = store.search(searchKeyword); // 검색 결과를 가져오기
    this.setState({ 
      searchResult: searchResult,
      submitted: true,  // 검색 여부를 true로 변경
    });
  }
  // 검색 결과를 삭제하는 함수
  handleReset() {
    // 검색어를 삭제하는데 아래와 같이 작성할 경우 this.state.searchKeyword는 여전히 남아 있게 됨.
    // this.setState({
    //   searchKeyword: "",
    // });

    // setState() 함수의 인자로 값을 업데이트할 수 있는 함수, 업데이트 완료 시 실행될 callback 함수(필수X)를 넣는다. 
    this.setState(() => {
      return { searchKeyword: "" }
    }, () => {
      console.log('handleReset', this.state.searchKeyword);
    })
  }

  render() {
    // 조건부 렌더링 방법 1
    // let resetButton = null;
    // if (this.state.searchKeyword.length > 0) {
    //   // X버튼의 노출 여부를 결정
    //   // 처음에 값이 null일 때는 무시해서 아무 것도 출력되지 않음 (!)
    //   resetButton = <button type="reset" className="btn-reset"></button>
    // }
    // 조건부 렌더링 방법 2 : 삼항 연산자 사용하기
    // 조건부 렌더링 방법 3 : && 연산자 사용하기

    return (
      <>
        <header>
          <h2 className="container">검색</h2>
        </header>
        <div className="container">
          <form 
            onSubmit={(event) => this.handleSubmit(event)}
            onReset={() => this.handleReset()}
          >
            <input 
              type="text" 
              placeholder="검색어를 입력하세요" 
              autoFocus 
              value={this.state.searchKeyword}
              onChange={event => this.handleChangeInput(event)}
            />
            {this.state.searchKeyword.length > 0 && (
              <button type="reset" className="btn-reset"></button>
            )}
          </form>
          <div className="content">
            {this.state.submitted && (
              this.state.searchResult.length > 0 ? (
                // 검색 결과가 존재할 때 = searchResult 배열이 채워져 있을 때
                <ul className="result">
                  {this.state.searchResult.map(item => {
                    return (
                      <li key={item.id}>
                        <img src={item.imageUrl} alt={item.name} />
                        <p>{item.name}</p>
                      </li>
                    );
                  })}
                </ul>
              ) : (
                // 검색 결과가 없을 때 = searchResult 배열이 비어 있을 때
                <div className="empty-box">검색 결과가 없습니다.</div>
              ))}
          </div>
        </div>
      </>
    );
  }
}
// const element = React.createElement("h1", null, "Hello World"); // h1 태그 내 Hello World 문자열을 넣어 element를 생성
// 여러 줄 사용 시 소괄호()로 묶어주기
// jsx - class는 예약어이므로 className이라는 키워드를 사용 & 'onChange'와 같이 camel case로 작성할 것
// <input> 태그에 onChange 사용하는 이유 : 사용자가 값을 입력할 때마다 해당 값을 띄워줘야 하기 때문
// X버튼의 type이 'reset'이므로, X버튼을 클릭하면 버튼을 감싸고 있는 form에서 'reset' 이벤트가 발행될 것 (!) 따라서 onReset 속성으로 작성하면 됨.
// setState() 함수는 "비동기"로 동작한다 (!)
// map 함수를 사용하면 두 번째 인자로 index 값이 들어오므로 이를 li 태그의 key 값으로 사용할 수도 있지만, 이는 최후의 수단으로 하는 것이 좋다.
ReactDOM.render(
  <App />, 
  document.querySelector('#app')
);