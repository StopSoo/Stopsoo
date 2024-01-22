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
    // 검색어를 검색 기록에 리스트로 추가
    this.addHistory(keyword); 
    // 순수 JS 프로젝트에서 작성한 것과 다르게 Store.js 파일 내부 변수들을 초기화하는 코드는 삭제하고, 검색 결과만 반환.
    return this.storage.productData.filter(
      (product) => product.name.includes(keyword)
    );
  }
  // 검색어를 검색 기록에 추가
  addHistory(keyword = "") {
    // 키워드에서 공백을 제거
    keyword = keyword.trim();
    if (!keyword) {
      return;
    }
    // 검색 기록에 검색어가 존재하는지를 검사하고 있다면 제거
    const hasHistory = this.storage.historyData.some(
      (history) => history.keyword === keyword
    );
    if (hasHistory) this.removeHistory(keyword);

    const id = createNextId(this.storage.historyData);
    const date = new Date();
    this.storage.historyData.push({ id, keyword, date });
    this.storage.historyData = this.storage.historyData.sort(this._sortHistory);
  }

  // 추천 검색어 목록을 storage에서 찾아서 반환하는 함수
  getKeywordList() {
    return this.storage.keywordData;
  }

  getHistoryList() {
    return this.storage.historyData.sort(this._sortHistory);
  }

  _sortHistory(history1, history2) {
    // 날짜의 역순으로 정렬
    return history2.date > history1.date;
  }

  removeHistory(keyword) {
    // 해당 키워드에 대한 검색 기록만을 삭제하고 historyData에 재할당
    this.storage.historyData = this.storage.historyData.filter(
      (history) => history.keyword !== keyword
    );
  }
}

// 순수 JS 프로젝트에서는 main.js 파일에서 선언했던 store 객체를
// 리액트 프로젝트에서는 Store.js 파일에서 선언해버림.
const store = new Store(storage);
export default store;