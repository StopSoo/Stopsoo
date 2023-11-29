import React from 'react';

const students = [
  {
    id: 1,
    name: "Jisoo",
  },
  {
    id: 2,
    name: "Sieun",
  },
  {
    id: 3,
    name: "Sooyoung",
  },
  {
    id: 4,
    name: "Bogyung",
  },
  {
    id: 5,
    name: "Jiseong",
  },
  {
    id: 6,
    name: "Minwoo",
  },
  {
    id: 7,
    name: "Jiwon",
  },
  {
    id: 8,
    name: "Junhyuk",
  },
  {
    id: 9,
    name: "Dabin",
  },
];

// 주의 ! map 함수를 사용해서 리스트를 렌더링할 경우, 반드시 각 element에 key가 존재해야 한다.
// 1. key 값은 id와 같이 중복 없는 값을 사용할 것.
// 2. key 값은 백틱(`)을 사용해서 문자열로 넣을 수도 있다. 
// 3. map 함수를 사용할 때 index라는 두 번째 인자를 사용해서 key 값을 넣어줄 수도 있다.
function AttendanceBook(props) {
  return (
    <ul>
      {students.map((student) => {
        return <li key={`student-id : ${student.id}`}>{student.name}</li>;
      })}
    </ul>
  );
}

export default AttendanceBook;