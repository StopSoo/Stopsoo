import Controller from "./Controller.js";
import Store from "./Store.js";
import storage from "./storage.js";

const tag = "[main]"
// DOM이 로딩되었을 때 main 함수를 호출
document.addEventListener("DOMContentLoaded", main);

function main() {
  console.log(tag, "main");

  const store = new Store(storage);  // storage 객체를 이용해 model을 생성 

  const views = {
    // TODO
  };

  new Controller(store, views); // MVC 각 계층의 객체들을 초기화하는 역할
}