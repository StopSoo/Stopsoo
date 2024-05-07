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