import * as React from 'react';
import './App.css';

/* 1. Function 형태 */
// function App() {
//   return (
//     <div className="App">
//       <header className="App-header">
//         <p>
//           Edit <code>src/App.tsx</code> and save to reload.
//         </p>
//         <a
//           className="App-link"
//           href="https://reactjs.org"
//           target="_blank"
//           rel="noopener noreferrer"
//         >
//           Learn React
//         </a>
//       </header>
//     </div>
//   );
// }


/* 2. Class 형태 */
// 이런 식으로 props와 state를 모아서 작성하기도 한다.
export interface AppProps {
  name: string;
}

interface AppState {
  age: number;
}
// generic 첫 번째는 props 자리 -> { 이름: 자료형; }
// generic 두 번째는 state 자리 -> { 이름: 자료형; }
class App extends React.Component<AppProps, AppState> {
  // state 초기화 방법 1
  // public state: { age: number; } = {
  //   age: 24
  // };
  // state 초기화 방법 2
  constructor(props: AppProps) {
    super(props); // super() 반드시 작성
    this.state = {
      age: 24
    };
    setInterval(() => {
      // 바뀌는 부분만 작성
      this.setState({
        age: this.state.age + 1
      });
    }, 2000);
  }
  render() {
    return (
      <div className="App">
        { this.props.name }, { this.state.age }
      </div>
    );
  }
}

export default App;
