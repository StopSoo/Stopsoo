import { qs } from '../helpers.js';
import View from './View.js';

export default class KeywordListView extends View {
  constructor() {
    super(qs('#keyword-list-view'));
    // 추천 검색어 리스트에 대한 객체를 생성
    this.template = new Template();
  }
  // keyword에 대한 리스트를 인자로 받음
  show(data = []) {
    this.element.innerHTML = 
    data.length > 0 
      ? this.template.getList(data) 
      : this.template.getEmptyMessage();
    super.show();
  }
}

class Template {
  getList(data = []) {
    // data 배열을 돌면서 값들을 this._getItem() 함수에 넘겨주고, 이를 공백 없이 연결한다.
    return `
      <ul class="list">
        ${data.map(this._getItem).join("")}
      </ul>
    `;
  }

  getEmptyMessage() {
    return `
      <div class="empty-box">추천 검색어가 없습니다.</div>
    `;
  }

  _getItem({ id, keyword }) {
    // storage - keywordData 구성을 보고 아래와 같이 구현
    // li 태그에도 data-keyword 속성을 넣은 이유는 어떤 객체를 선택했는지 구별하기 위함 
    return `
      <li data-keyword="${keyword}">
        <span class="number">${id}</span>
        ${keyword}
      </li>
    `;
  }
}