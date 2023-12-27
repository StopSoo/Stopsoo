import View from "./View.js";
import { on, qs } from "../helpers.js";

export default class SearchFormView extends View {
  constructor() {
    super(qs("#search-form-view")); // id가 'search-form-view'인 애를 찾아서 this.element에 저장한다. 

    this.inputElement = qs("[type=text]", this.element);  // type이 text인 것을 this.element 하위에서 찾겠다. 
    this.resetElement = qs("[type=reset]", this.element); // type이 reset인 것을 this.element 하위에서 찾겠다. (=> X 버튼)
    
    this.showResetButton(false);  // 검색어를 입력하기 전에는 X 버튼이 보이지 않게 한다.
    this.bindEvent();  // view가 생성되었을 때 event를 바인딩하는 logic을 구현
  }
  
  showResetButton(visible = true) {
    // 검색창의 X 버튼 쇼 여부 결정
    this.resetElement.style.display = visible ? "block" : "none";
  }

  bindEvent() {
    // this.inputElement에서 event인 'keyup'을 수신하고, 'keyup'에 handleKeyup이라는 handler를 추가(addEventListner)
    on(this.inputElement, "keyup", () => this.handleKeyup());
  }
  
  handleKeyup() {
    // 입력 키워드의 존재 여부에 따라 showResetButton 함수 호출 
    const { value } = this.inputElement;
    this.showResetButton(value.length > 0);
  }
}