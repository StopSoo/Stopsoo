// 실제 화면에 렌더링하기 위한 파일
import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App';
import reportWebVitals from './reportWebVitals';

import Library from './chapter_03/Library'; // Library component 가져오기
// const root = ReactDOM.createRoot(document.getElementById('root'));
// root.render(
//   <React.StrictMode>
//     {/* ReactDOM을 사용하여 root dom node에 rendering */}
//     <Library /> 
//   </React.StrictMode>
// );

import Clock from './chapter_04/Clock';
// 1000ms마다 Clock component를 root div에 rendering 
// ReactDOM.render(element, document.getElementById('root')); 형태
setInterval(() => {
  ReactDOM.render(
    <React.StrictMode>
      <Clock />
    </React.StrictMode>,
    document.getElementById('root')
  );
}, 1000); // 매초 화면에 새로운 element를 만들어서 렌더링

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();
