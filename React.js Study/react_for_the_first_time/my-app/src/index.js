// 실제 화면에 렌더링하기 위한 파일
import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App.js';
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
/* setInterval 함수를 이용해서 1000ms(=1s)마다 Clock component를 root div에 rendering
  ReactDOM.render(element, document.getElementById('root')); 형태 */
// setInterval(() => {
//   ReactDOM.render(
//     <React.StrictMode>
//       <Clock />
//     </React.StrictMode>,
//     document.getElementById('root')
//   );
// }, 1000); // 매초 화면에 새로운 element를 만들어서 렌더링

import CommentList from './chapter_05/CommentList';
// ReactDOM.render(
//   <React.StrictMode>
//     <CommentList />
//   </React.StrictMode>,
//   document.getElementById('root')
// );

// import NotificationList from './chapter_06/NotificationList';
// ReactDOM.render(
//   <React.StrictMode>
//     <NotificationList />
//   </React.StrictMode>,
//   document.getElementById('root')
// );

import ConfirmButton from './chapter_08/ConfirmButton';
// ReactDOM.render(
//   <React.StrictMode>
//     <ConfirmButton />
//   </React.StrictMode>,
//   document.getElementById('root')
// );

import Accommodate from './chapter_07/Accommodate';
// ReactDOM.render(
//   <React.StrictMode>
//     <Accommodate />
//   </React.StrictMode>,
//   document.getElementById('root')
// );

import LandingPage from './chapter_09/LandingPage';

// ReactDOM.render(
//   <React.StrictMode>
//     <LandingPage />
//   </React.StrictMode>,
//   document.getElementById('root')
// );

import AttendanceBook from './chapter_10/AttendanceBook';

// ReactDOM.render(
//   <React.StrictMode>
//     <AttendanceBook />
//   </React.StrictMode>,
//   document.getElementById('root')
// );

import SignUp from './chapter_11/SignUp';

// ReactDOM.render(
//   <React.StrictMode>
//     <SignUp />
//   </React.StrictMode>,
//   document.getElementById('root')
// );

import Calculator from './chapter_12/Calculator';

// ReactDOM.render(
//   <React.StrictMode>
//     <Calculator />
//   </React.StrictMode>,
//   document.getElementById('root')
// );

import ProfileCard from './chapter_13/ProfileCard';

// ReactDOM.render(
//   <React.StrictMode>
//     <ProfileCard />
//   </React.StrictMode>,
//   document.getElementById('root')
// );

import DarkOrLight from './chapter_14/DarkOrLight';

ReactDOM.render(
  <React.StrictMode>
    <DarkOrLight />
  </React.StrictMode>,
  document.getElementById('root')
);

// import Blocks from './chapter_15/Blocks';

// ReactDOM.render(
//   <React.StrictMode>
//     <Blocks />
//   </React.StrictMode>,
//   document.getElementById('root')
// );


// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();