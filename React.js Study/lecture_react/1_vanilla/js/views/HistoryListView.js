import { qs, formatRelativeDate } from '../helpers.js';
import KeywordListView from './KeywordListView.js';

// KeywordListView와 비슷한 점이 많아 이를 상속 받아 사용
export default class HistoryListView extends KeywordListView {
  constructor() {
    // KeywordListView의 constructor를 사용
    super(qs('#history-list-view'), new Template());
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