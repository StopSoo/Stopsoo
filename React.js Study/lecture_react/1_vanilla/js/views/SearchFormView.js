import View from "./View.js";
import { on, qs } from "../helpers.js";

const tag = "[SearchFormView]";

export default class SearchFormView extends View {
  constructor() {
    super(qs("#search-form-view")); // id가 'search-form-view'인 애를 찾아서 this.element에 저장한다. 

    this.inputElement = qs("[type=text]", this.element);  // type이 text인 것을 this.element 하위에서 찾겠다. 
    this.resetElement = qs("[type=reset]", this.element); // type이 reset인 것을 this.element 하위에서 찾겠다. (=> X 버튼)
    
    this.showResetButton(false);  // 검색어를 입력하기 전에는 X 버튼이 보이지 않게 한다.
    this.bindEvents();  // view가 생성되었을 때 event를 바인딩하는 logic을 구현
  }
  
  showResetButton(visible = true) {
    // 검색창의 X 버튼 쇼 여부 결정
    this.resetElement.style.display = visible ? "block" : "none";
  }

  bindEvents() {
    // this.inputElement에서 event인 'keyup'을 수신하고, 'keyup'에 handleKeyup이라는 handler를 추가(addEventListener)
    on(this.inputElement, "keyup", () => this.handleKeyup());
    // this.element에서 "submit" event가 실행되면 event 객체를 인자로 넘겨 handleSubmit handler를 추가한다. 
    on(this.element, "submit", event => this.handleSubmit(event));
    // this.resetElement에서 "click" event가 실행되면 검색 결과를 삭제한다.
    on(this.resetElement, "click", () => this.handleReset());
  }
  
  handleKeyup() {
    // 사용자가 입력한 내용을 객체 형태로 저장
    const { value } = this.inputElement;
    // 입력 키워드의 존재 여부에 따라 showResetButton 함수 호출 
    this.showResetButton(value.length > 0);
    // 검색어를 삭제했을 때 검색 결과를 삭제하는 handleReset 함수를 호출
    if (value.length <= 0) {
      this.handleReset();
    }
  }

  handleSubmit(event) {
    // 검색창에서 enter 시 검색 결과를 보여줘야 하므로 뷰가 리렌더링되는 것을 방지
    event.preventDefault();
    console.log(tag, "handleSubmit"); // 확인용 출력
    // 사용자가 입력한 내용을 객체 형태로 저장
    const { value } = this.inputElement;
    // custom event임을 구분하기 위해 eventName에 @를 추가, 입력 객체 전달
    this.emit("@submit", {value});
  }

  handleReset() {
    console.log(tag, "handleReset");
    // 검색 결과를 삭제하는 것은 검색창 바깥의 일이므로 밖으로 넘겨주기
    this.emit("@reset");
  }
  // View에 있는 show 함수를 overriding
  // 추천 검색어 클릭 시 검색창에도 해당 키워드가 보이도록 함
  show(value = "") {
    this.inputElement.value = value;  // 검색어를 검색창에 띄움
    this.showResetButton(this.inputElement.value.length > 0); // 검색어 존재 시 X버튼 보이게
    super.show();
  }
}