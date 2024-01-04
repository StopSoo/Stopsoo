import { qs, delegate } from '../helpers.js';
import View from './View.js';

const tag = "[KeywordListView]";

// HistoryListView.js 파일에서 KeywordListView class를 상속 받아 사용하므로 constructor에서 인자를 받도록 수정
export default class KeywordListView extends View {
  constructor(element = qs('#keyword-list-view'), template = new Template()) {
    // 확인용 출력
    console.log(tag, "constructor");

    super(element);
    // 추천 검색어 리스트에 대한 객체를 생성
    this.template = template;
    // 추천 검색어 객체를 클릭 시 해당 검색어에 대한 검색 결과로 넘어가는 이벤트를 생성
    this.bindEvents();
  }
  // keyword에 대한 리스트를 인자로 받음
  show(data = []) {
    this.element.innerHTML = 
    data.length > 0 
      ? this.template.getList(data) 
      : this.template.getEmptyMessage();
    super.show();
  }
  // li element에서 click 이벤트가 발생했는지 체크
  bindEvents() {
    delegate(this.element, "click", "li", event => this.handleClick(event));
  }
  // li element에서 click 이벤트가 발생하면 실행되는 함수
  handleClick(event) {
    console.log(tag, "handleClick", event.target.dataset.keyword);  // 확인용 출력
    // 뷰 바깥의 일이므로 emit 이벤트를 발행
    const value = event.target.dataset.keyword;
    this.emit("@click", { value });
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
      <div class="empty-box">
        추천 검색어가 없습니다.
      </div>
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