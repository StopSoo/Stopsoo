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
}

// 순수 JS 프로젝트에서는 main.js 파일에서 선언했던 store 객체를
// 리액트 프로젝트에서는 Store.js 파일에서 선언해버림.
const store = new Store(storage);
export default store;