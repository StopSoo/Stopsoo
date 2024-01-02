import View from "./View.js";
import { qs } from "../helpers.js";

export default class SearchResultView extends View {
  constructor() {
    // 해당 id로 dom element를 저장하면 this.element에 저장된다. 
    super(qs('#search-result-view'));
    // 검색 결과 템플릿 객체 생성
    this.template = new Template();
  }
  // show 함수 overriding 
  show(data = []) {
    // 데이터가 존재한다면 getList 함수를, 존재하지 않는다면 getEmptyMessage 함수를 실행
    this.element.innerHTML = 
      data.length > 0
        ? this.template.getList(data) 
        : this.template.getEmptyMessage();
    // 부모 메소드를 호출해서 실제로 화면에 노출될 수 있도록 함
    super.show(); 
  }
}

class Template {
  // 결과적으로 ul 안에 li들이 생성되는 형태
  getList(data = []) {
    return `
      <ul class="result">
        ${data.map(this._getItem).join("")}
      </ul>
    `;
  }

  getEmptyMessage() {
    return `
      <div class="empty-box">검색 결과가 없습니다.</div>
    `;
  }

  _getItem({ imageUrl, name }) {
    return `
      <li>
        <img src="${imageUrl}" alt="${name}" />
        <p>${name}</p>
      </li>
    `;
  }
}