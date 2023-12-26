import View from "./View.js";
import { qs } from "../helpers.js";

export default class SearchFormView extends View {
  constructor() {
    super(qs("#search-form-view")); // id가 'search-form-view'인 애를 찾아서 this.element에 저장한다. 

    this.resetElement = qs("[type=reset]", this.element); // type이 reset인 것을 찾아 this.element 하위에서 찾겠다. (=> X 버튼)
    this.showResetButton(false);  // 검색어를 입력하기 전에는 X 버튼이 보이지 않게 한다.
  }
  // 검색창의 X 버튼 쇼 여부 결정
  showResetButton(visible = true) {
    this.resetElement.style.display = visible ? "block" : "none";
  }
}