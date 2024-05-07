// CJS(Common JS)
// 외부 모듈을 불러 오는 방법 1 
// const moduleData = require("./math.js"); 
// console.log(moduleData);
// console.log(moduleData.add(1, 2));
// console.log(moduleData.sub(5, 3));

// 외부 모듈을 불러 오는 방법 2
// const { add, sub } = require("./math.js"); 
// console.log(add(1, 2));
// console.log(sub(5, 3));

// ESM (ES Module)
import { add, sub } from "./math.js";
console.log(add(1, 2));
console.log(sub(5, 3));

// npm i randomcolor
// package-lock.json : package.json 파일보다 더 구체적
// node_modules 파일 안에 다운 받은 라이브러리 파일이 생성됨
// npm에서 다운로드 받은 라이브러리 사용 예시
import randomColor from "randomcolor";  // 라이브러리 import
const color = randomColor();
console.log(color); // 랜덤 색깔 코드가 출력됨