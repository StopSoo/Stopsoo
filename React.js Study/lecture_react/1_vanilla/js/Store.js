/* 요구 사항 
- 검색 결과를 가지고 있어야 한다. 
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
  }

  search(keyword) {
    this.searchKeyword = keyword;
    this.searchResult = this.storage.productData.filter((product) =>
      product.name.includes(keyword)
    );
  }
}