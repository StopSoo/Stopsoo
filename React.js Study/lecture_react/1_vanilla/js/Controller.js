/* View를 관리하는 Controller */
const tag = "[Controller]";

export default class Controller {
  constructor(store, { searchFormView }) {
    console.log(tag);
    this.store = store;
    this.searchFormView = searchFormView;
    // View가 발행하는 event를 수신
    this.subscribeViewEvents();
  }

  subscribeViewEvents() {
    // this.searchFormView에서 "@submit" event가 실행되면 event 객체를 인자로 넘겨 search 함수를 수행
    this.searchFormView.on("@submit", (event) => 
      this.search(event.detail.value)
    ).on("@reset", () => this.reset()); // on 함수는 this를 return하고 있어 chaining이 가능
  }

  search(keyword) {
    console.log(tag, keyword);  // 확인용 출력
  }

  reset() {
    console.log(tag, "reset");
  }
}