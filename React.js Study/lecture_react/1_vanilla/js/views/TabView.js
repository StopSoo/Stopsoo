import View from "./View.js";
import { qs, qsAll, delegate } from "../helpers.js";

export const TabType = {  // Store.js 파일에서 사용하기 위해 export
  KEYWORD: 'KEYWORD', // 추천 검색어
  HISTORY: 'HISTORY', // 최근 검색어
}

const TabLabel = {
  [TabType.KEYWORD]: '추천 검색어',
  [TabType.HISTORY]: '최근 검색어',
}

const tag = "[TabView]";

export default class TabView extends View {
  constructor() {
    console.log(tag, "constructor");  // 확인용 출력
    super(qs('#tab-view')); // this.element에 tabView element를 넣음
    this.template = new Template(); // 탭 객체 생성
    this.bindEvents();
  }

  bindEvents() {
    // li 태그에서 click 이벤트가 발생했을 때 handler를 실행한다. 
    delegate(this.element, "click", "li", (event) => this.handleClick(event));
  }

  handleClick() {
    // 탭에 따른 검색 결과를 출력하는 것은 뷰 바깥의 역할이므로 emit 이벤트를 발행
    const value = event.target.dataset.tab;
    this.emit("@change", { value });
  }

  // View에 있는 show 함수를 overriding
  // selectedTab은 TabType이 들어올 예정
  show(selectedTab) {
    // getTabList 함수를 통해 반환 받는 탭 리스트를 뷰에 표시
    this.element.innerHTML = this.template.getTabList();
    // this.element 하에서 li 태그 객체를 모두 찾아 forEach를 수행
    qsAll("li", this.element).forEach(li => {
      // li 태그에서 'data-tab'이라는 속성을 li.dataset.tab으로 표현
      // style.css 파일에서 선택된 탭을 class='active'로 표현되게 지정해 놓음
      li.className = li.dataset.tab === selectedTab ? "active" : "";
    });
    
    super.show();
  }
}

class Template {
  getTabList() {
    return `
      <ul class="tabs">
        ${Object.values(TabType)  // TabType 문자열이 배열로 반환됨
          .map((tabType) => ({ tabType, tabLabel: TabLabel[tabType] })) // 한 TabType에 대해 해당 객체를 반환
          .map(this._getTab)
          .join("")  
        }
      </ul>
    `;
  }

  _getTab({ tabType, tabLabel }) {
    // 탭의 클릭 여부를 구분하기 위해 'data-tab'이라는 이름의 속성으로 저장
    return `
      <li data-tab="${tabType}">
        ${tabLabel}
      </li>
    `;
  }
}