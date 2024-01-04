import { TabType } from "./views/TabView.js";

/* View를 관리하는 Controller */
const tag = "[Controller]";

export default class Controller {
  constructor(
    store, 
    { 
      searchFormView, 
      searchResultView, 
      tabView, 
      keywordListView,
      historyListView,
    }
  ) {
    console.log(tag);

    this.store = store; // Store.js에서 store 객체를 가져옴 
    // 컨트롤러 내부에 뷰들을 저장
    this.searchFormView = searchFormView;
    this.searchResultView = searchResultView;
    this.tabView = tabView;
    this.keywordListView = keywordListView;
    this.historyListView = historyListView;

    this.subscribeViewEvents(); // View가 발행하는 event를 수신
    this.render();  // 뷰를 렌더링
  }

  subscribeViewEvents() {
    // this.searchFormView에서 "@submit" event가 실행되면 event 객체를 인자로 넘겨 search 함수를 수행
    // on 함수는 this를 return하고 있어 chaining이 가능
    this.searchFormView
      .on("@submit", (event) => this.search(event.detail.value))  // 사용자가 작성한 검색어를 가지고 search 함수를 통해 검색
      .on("@reset", () => this.reset()); // reset 이벤트는 this.reset 함수에 바인딩
    // 탭이 바뀌었을 때 "@change" 이벤트가 뷰에서 발행되므로 이를 받아 changeTab 함수를 실행
    this.tabView.on("@change", (event) => this.changeTab(event.detail.value));
    // 추천 검색어 클릭 시 "@click" 이벤트가 뷰에서 발행되므로 이를 받아 해당 키워드에 대해 search 함수를 실행 
    this.keywordListView.on("@click", (event) => 
      this.search(event.detail.value)
    );
    // 최근 검색어 클릭 시 "@click" 이벤트가 뷰에서 발행되므로 이를 받아 해당 키워드에 대해 search 함수를 실행 
    // 최근 검색어에서 X버튼 클릭 시 "@remove" 이벤트가 뷰에서 발행되므로 이를 받아 해당 검색 기록을 삭제
    this.historyListView
      .on("@click", (event) => this.search(event.detail.value))
      .on("@remove", (event) => this.removeHistory(event.detail.value));
  }

  search(searchKeyword) {
    console.log(tag, "search", searchKeyword);  
    this.store.search(searchKeyword); // 검색어에 대해 store에서 검색
    this.render();  // 검색 결과를 화면에 출력
  }

  reset() {
    console.log(tag, "reset");
    // 즉각 hide()를 호출하는 것이 아닌 render() 함수가 무엇에 의존하고 있는지 살필 것 (!)
    this.store.searchKeyword = "";  // 검색어 초기화
    this.store.searchResult = []; // 검색 결과 리스트 초기화
    this.render();  // 검색 결과가 삭제될 것
  }
  // 탭이 바뀔 때마다 실행되는 함수
  changeTab(tab) {
    this.store.selectedTab = tab; // 모델 내 탭 값을 방금 선택한 탭 값으로 변경
    this.render();  // 선택한 탭으로 변경될 것
  }
  // 최근 검색어에서 X버튼을 누르면 해당 검색어를 삭제하는 함수
  removeHistory(keyword) {
    // store에 removeHistory 함수를 정의해놓았기 때문에 이를 호출
    this.store.removeHistory(keyword);
    this.render();  // 갱신된 최근 검색어 목록이 보여질 것
  }
  // 컨트롤러가 관리하고 있는 뷰들을 화면에 출력하는 기능
  render() {
    /* 1. 검색어 존재 */
    if (this.store.searchKeyword.length > 0) {
      return this.renderSearchResult();
    }

    /* 2. 검색어 존재 X */
    this.tabView.show(this.store.selectedTab);
    // 탭의 종류에 따라 뷰를 show or hide
    if (this.store.selectedTab === TabType.KEYWORD) {
      this.keywordListView.show(this.store.getKeywordList());
      this.historyListView.hide();
    } else if (this.store.selectedTab === TabType.HISTORY) {
      this.keywordListView.hide();
      this.historyListView.show(this.store.getHistoryList());
    } else {
      throw "사용할 수 없는 탭입니다.";
    }

    this.searchResultView.hide();
  }
  // 검색어 존재 시 검색 결과를 보여주는 함수
  // 보여줄 화면만 show()하고, 나머지는 모두 hide() 하는 게 포인트 (!)
  renderSearchResult() {
    this.searchFormView.show(this.store.searchKeyword); // 검색어를 검색창에 띄우는 역할
    this.tabView.hide();
    this.keywordListView.hide();
    this.historyListView.hide();
    this.searchResultView.show(this.store.searchResult);  // 검색 결과만 뷰에서 보이게 함
  }
}