// 1. 배열의 구조 분해 할당
let arr = [1, 2, 3];

let [one, two, three] = arr;
console.log(one, two, three); // 1 2 3

let [oneone, twotwo] = arr; // 배열에 저장된 원수 개수보다 적게도 할당 가능
console.log(oneone, twotwo);  // 1 2

// 2. 객체의 구조 분해 할당
let person = {
  name: "정지수",
  age : 26,
  hobby: "독서",
};

let { name, age, hobby } = person;  // 객체는 {}를 사용할 것 (!)
console.log(name, age, hobby);

// 3. 객체 구조 분해 할당을 이용해 함수의 매개변수를 받는 방법
const func = ({ name, age, hobby }) => {
  console.log(name, age, hobby);
}

func(person); // 객체를 넘겼을 때만 객체 구조 분해 할당이 가능 