/* View를 관리하는 Controller */
const tag = "[Controller]";

export default class Controller {
  constructor(store, { searchFormView, searchResultView, tabView }) {
    console.log(tag);

    this.store = store; // Store.js에서 store 객체를 가져옴 

    this.searchFormView = searchFormView;
    this.searchResultView = searchResultView;
    this.tabView = tabView;

    this.subscribeViewEvents(); // View가 발행하는 event를 수신
    this.render();  // 뷰를 렌더링
  }

  subscribeViewEvents() {
    // this.searchFormView에서 "@submit" event가 실행되면 event 객체를 인자로 넘겨 search 함수를 수행
    // on 함수는 this를 return하고 있어 chaining이 가능
    this.searchFormView
      .on("@submit", (event) => this.search(event.detail.value))  // 사용자가 작성한 검색어를 가지고 search 함수를 통해 검색
      .on("@reset", () => this.reset()); // reset 이벤트는 this.reset 함수에 바인딩
    // 탭이 바뀌었을 때 "@change" 이벤트가 발행되므로 이를 받아 changeTab 함수를 실행
    this.tabView.on("@change", event => this.changeTab(event.detail.value));
  }

  search(searchKeyword) {
    console.log(tag, "search", searchKeyword);  
    this.store.search(searchKeyword); // 검색어에 대해 store에서 검색
    this.render();  // 검색 결과를 출력
  }

  reset() {
    console.log(tag, "reset");
    // 즉각 hide()를 호출하는 것이 아닌 render() 함수가 무엇에 의존하고 있는지 살필 것 (!)
    this.store.searchKeyword = "";  // 검색어 초기화
    this.store.searchResult = []; // 검색 결과 리스트 초기화
    this.render();  // 검색 결과가 삭제될 것
  }

  changeTab(tab) {
    console.log(tag, 'changeTab', tab);
    this.store.selectedTab = tab; // 모델 내 탭 값을 방금 선택한 탭 값으로 변경
    this.render();  // 선택한 탭으로 변경될 것
  }

  // 컨트롤러가 관리하고 있는 뷰들을 화면에 출력하는 기능
  render() {
    // 검색어 존재
    if (this.store.searchKeyword.length > 0) {
      return this.renderSearchResult();
    }
    // 검색어 존재 X
    this.tabView.show(this.store.selectedTab);
    this.searchResultView.hide();
  }
  // 검색 결과를 보여주는 함수
  renderSearchResult() {
    this.tabView.hide();
    this.searchResultView.show(this.store.searchResult);
  }
}