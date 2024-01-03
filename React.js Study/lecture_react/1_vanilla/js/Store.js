import { TabType } from "./views/TabView.js";
/* 요구 사항 
- Store.js 파일은 MVC 패턴에서 "model" 역할을 한다.
- 검색 결과(검색어, 검색어에 합당한 결과)를 가지고 있어야 한다. 
- 기본적으로 선택된 탭에 대한 값을 가지고 있어야 한다. 
*/
const tag = "[Store]";

export default class Store {
  constructor(storage) {
    console.log(tag);
    // storage가 MVC 패턴에서 model 역할을 한다.
    if (!storage) throw "no storage";

    this.storage = storage;

    this.searchKeyword = "";  // 검색어
    this.searchResult = []; // storage에 있는 데이터 중 검색 결과
    this.selectedTab = TabType.KEYWORD; // 추천 검색어 탭을 기본으로 함
  }

  search(keyword) {
    this.searchKeyword = keyword;
    this.searchResult = this.storage.productData.filter((product) =>
      product.name.includes(keyword)
    );
  }
  // 추천 검색어 목록을 storage에서 찾아서 반환하는 함수
  getKeywordList() {
    return this.storage.keywordData;
  }
}