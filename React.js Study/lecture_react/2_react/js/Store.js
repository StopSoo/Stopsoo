import storage from './storage.js';
import { createNextId } from "./helpers.js";

const tag = "[Store]";

class Store {
  constructor(storage) {
    console.log(tag);
    // storage가 MVC 패턴에서 model 역할을 한다.
    if (!storage) throw "no storage";

    this.storage = storage;
    // React에서 state를 사용하면서 변수들을 초기화해줄 필요가 없어졌으므로 초기화하는 코드는 삭제!
  }

  search(keyword) {
    // 순수 JS 프로젝트에서 작성한 것과 다르게 Store.js 파일 내부 변수들을 초기화하는 코드는 삭제하고, 검색 결과만 반환.
    return this.storage.productData.filter(
      (product) => product.name.includes(keyword)
    );
  }
  // 추천 검색어 목록을 storage에서 찾아서 반환하는 함수
  getKeywordList() {
    return this.storage.keywordData;
  }
  // 최근 검색어 목록을 storage에서 찾아서 날짜 순으로 정렬 후 반환하는 함수
  getHistoryList() {
    return this.storage.historyData.sort(this._sortHistory);
  }
  // 두 날짜를 비교하여 bool 값을 반환 => 최근 것이 위로 오게 됨
  _sortHistory(history1, history2) {
    return history2.date > history1.date
  }
  // 최근 검색어 목록에서 X버튼을 클릭하면 검색어 삭제
  removeHistory(keyword) {
    // storage.historyData에 저장되어 있는 keyword들 중 인자로 들어 온 keyword와 다른 것들만 반환 
    // => 인자로 들어온 keyword와 같은 객체는 삭제
    this.storage.historyData = this.storage.historyData.filter(
      (history) => history.keyword !== keyword
    );
  }

  addHistory(keyword) {
    keyword = keyword.trim(); // 검색어에서 공백을 제거
    /* 1. 검색어가 없을 경우 */
    if (!keyword) { return; }
    /* 2. 검색어가 있을 경우 */
    // array에서 some 함수 - 배열 내 한 개의 요소라도 특정 조건을 충족하는지 확인하는 데 사용한다 (!) 
    // 그럼 bool 값을 반환하겠죠 ?
    const hasHistory = this.storage.historyData.some(history => history.keyword === keyword);
    if (hasHistory) {
      this.removeHistory(keyword);  // 기존 검색 이력 삭제
    }
    // id, date 생성 후 배열에 해당 객체를 추가
    const id = createNextId(this.storage.historyData);
    const date = new Date();
    this.storage.historyData.push({id, keyword, date});
    this.storage.historyData = this.storage.historyData.sort(this._sortHistory);
  }
}

// 순수 JS 프로젝트에서는 main.js 파일에서 선언했던 store 객체를
// 리액트 프로젝트에서는 Store.js 파일에서 선언해버림.
const store = new Store(storage);
export default store;