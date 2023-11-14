import { emit, on } from "../helpers.js";

const tag = "[View]";

export default class View {
  // DOM API를 직접적으로 사용하기 때문에 view가 관리할 element를 인자로 받는다.
  constructor(element) {
    console.log(tag, "constructor");
    // element가 존재할 경우에만 내부 변수로 관리한다.
    if (!element) throw "no element";
    this.element = element;

    this.originalDisplay = this.element.style.display || "";  // 객체 노출 여부

    return this;
  }

  hide() {
    this.element.style.display = "none";
    return this;
  }

  show() {
    this.element.style.display = this.originalDisplay;
    return this;
  }

  on(eventName, handler) {  // helpers.js 안에 있는 유틸리티성 함수
    // this.element에 eventName이라는 이벤트가 발생하면 handler를 실행해라.
    on(this.element, eventName, handler);
    return this;
  }
  
  emit(eventName, data) {
    // this.element에서는 eventName이라는 이름에 data라는 데이터를 갖는 이벤트를 발행한다. 
    emit(this.element, eventName, data);
    return this;
  }
}