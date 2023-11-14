import { TabType } from "./views/TabView.js";
import { createNextId } from "./helpers.js";

const tag = "[Store]";

export default class Store {
  constructor(storage) {
    // storage가 MVC 패턴에서 model 역할을 한다.
    if (!storage) throw "no storage";

    this.storage = storage;
  }

  
}