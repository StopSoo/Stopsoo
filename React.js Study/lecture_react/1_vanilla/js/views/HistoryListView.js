import { qs, delegate, formatRelativeDate } from '../helpers.js';
import KeywordListView from './KeywordListView.js';

const tag = "[HistoryListView]";
// KeywordListView와 비슷한 점이 많아 이를 상속 받아 사용
export default class HistoryListView extends KeywordListView {
  constructor() {
    // KeywordListView의 constructor를 사용
    super(qs('#history-list-view'), new Template());
  }
  // KeywordListView가 가지고 있는 bindEvents() 함수를 overriding
  // button 중에 "class명이 btn-remove"인 요소에서 "click" 이벤트가 발생했을 경우 
  bindEvents() {
    delegate(this.element, "click", "button.btn-remove", (event) => 
      this.handleClickRemoveButton(event)
    );
    
    super.bindEvents();
  }

  handleClickRemoveButton(event) {
    // 확인용 출력
    console.log(tag, "handleClickRemoveButton", event.target);
    // 검색 이력을 삭제하는 것은 모델의 역할이므로, 외부로 이벤트를 발행
    // 검색 기록 객체인 li element의 "data-keyword" 속성 값을 넘겨준다. 
    const value = event.target.parentElement.dataset.keyword;
    this.emit("@remove", { value });
  }
}

class Template {
  getEmptyMessage() {
    return `
      <div class="empty-box">
        검색 이력이 없습니다.
      </div>
    `;
  }

  getList(data = []) {
    // data 배열을 돌면서 값들을 this._getItem() 함수에 넘겨주고, 이를 공백 없이 연결한다.
    return `
      <ul class="list">
        ${data.map(this._getItem).join("")}
      </ul>
    `;
  }

  _getItem({ id, keyword, date }) {
    // storage - historyData 구성을 보고 아래와 같이 구현
    // li 태그에도 data-keyword 속성을 넣은 이유는 어떤 객체를 선택했는지 구별하기 위함 
    // 검색 키워드와 검색 날짜를 표시 후 삭제 버튼 추가
    return `
      <li data-keyword="${keyword}">
        ${keyword}
        <span class="date">${formatRelativeDate(date)}</span>
        <button class="btn-remove"></button>
      </li>
    `;
  }
}