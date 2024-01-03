import Controller from "./Controller.js";
import Store from "./Store.js";
import storage from "./storage.js";
import KeywordListView from "./views/KeywordListView.js";
import SearchFormView from "./views/SearchFormView.js";
import SearchResultView from "./views/SearchResultView.js";
import TabView from "./views/TabView.js";

const tag = "[main]"
// Application 진입점에서 main 함수가 호출된다.
// DOM이 로딩되었을 때 main 함수를 호출
document.addEventListener("DOMContentLoaded", main);

function main() {
  console.log(tag, "main");

  const store = new Store(storage);  // storage 객체를 이용해 model을 생성 

  const views = {
    searchFormView: new SearchFormView(),
    searchResultView: new SearchResultView(),
    tabView: new TabView(),
    keywordListView: new KeywordListView(),
  };
  // MVC 각 계층의 객체들을 초기화하는 역할
  // 위에서 생성한 뷰 리스트를 인자로 넘긴다.
  new Controller(store, views); 
}