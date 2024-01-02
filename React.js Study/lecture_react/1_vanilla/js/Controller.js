/* View를 관리하는 Controller */
const tag = "[Controller]";

export default class Controller {
  constructor(store, { searchFormView, searchResultView }) {
    console.log(tag);

    this.store = store;

    this.searchFormView = searchFormView;
    this.searchResultView = searchResultView;
    // View가 발행하는 event를 수신
    this.subscribeViewEvents();
  }

  subscribeViewEvents() {
    // this.searchFormView에서 "@submit" event가 실행되면 event 객체를 인자로 넘겨 search 함수를 수행
    // on 함수는 this를 return하고 있어 chaining이 가능
    this.searchFormView
      .on("@submit", (event) => this.search(event.detail.value))
      .on("@reset", () => this.reset()); 
  }

  search(searchKeyword) {
    console.log(tag, "search", searchKeyword);  
    this.store.search(searchKeyword); // 검색어에 대해 store에서 검색
    this.render();  // 검색 결과를 출력
  }

  reset() {
    console.log(tag, "reset");
  }
  // 컨트롤러가 관리하고 있는 뷰들을 화면에 출력하는 기능
  render() {
    if (this.store.searchKeyword.length > 0) {
      this.searchResultView.show(this.store.searchResult);
      return;
    }
    // searchKeyword가 없을 때
    this.searchResultView.hide();
  }
}