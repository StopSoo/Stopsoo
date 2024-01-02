/* 기록용 */
import React from "react";
/* Conditional Rendering : 조건부 렌더링 
  - 어떠한 조건에 따라 렌더링이 달라지는 것
  - Ex> 조건이 True이면 버튼을 보여주고, False이면 버튼을 보여주지 않는 것
*/
// 예시 코드
function UserGreeting(props) {
  return <h1>다시 오셨군요 !</h1>
}
function GuestGreeting(props) {
  return <h1>회원가입을 해주세요.</h1>
}

function Greeting(props) {
  const isLoggedIn = props.isLoggedIn;
  // 조건부 렌더링
  if (isLoggedIn) {
    return <UserGreeting />;
  }
  return <GuestGreeting />;
}

/* Truthy : true는 아니지만 true로 여겨지는 값 
-> {} (empty object)
-> [] (empty array)
-> 42 (number, not zero)
-> "0", "false" (string, not empty)
  Falsy : false는 아니지만 false로 여겨지는 값
-> 0, -0 (zero, minus zero)
-> 0n (BigInt zero)
-> '', "", `` (empty string)
-> null
-> undefined
-> NaN (not a number)
*/

/* Element Variable */
// 예시 코드
function LoginButton(props) {
  return (
    <button onClick={props.onClick}>
      로그인
    </button>
  );
}
function LogoutButton(props) {
  return (
    <button onClick={props.onClick}>
      로그아웃
    </button>
  );
}

function LoginControl(props) {
  const [isLoggedIn, setIsLoggedIn] = useState(false);

  const handleLoginClick = () => {
    setIsLoggedIn(true);
  }

  const handleLogoutClick = () => {
    setIsLoggedIn(false);
  }

  let button; // 컴포넌트로부터 만들어진 리액트 element
  // 선택적 렌더링
  if (isLoggedIn) {
    button = <LogoutButton onClick={handleLogoutClick} />;
  } else {
    button = <LoginButton onClick={handleLoginClick} />;
  }

  return (
    <div>
      <Greeting isLoggedIn={isLoggedIn} />
      {button}
    </div>
  );
}

/* Inline Conditions */
// 1. inline if : if문의 경우 && 연산자를 사용
// 조건문이 false일 경우 뒤 문장이 실행되지 않지만, false라는 결과값이 그대로 return되기 때문에 주의해야 한다(!)
// 예시 코드
function Mailbox(props) {
  const unreadMessages = props.unreadMessages;

  return (
    <div>
      <h1>안녕하세요 !</h1>
      {/* && 앞쪽은 조건문으로 사용됨 */}
      {unreadMessages.length > 0 &&
      <h2>
        현재 {unreadMessages.length}개의 읽지 않은 메세지가 있습니다.
      </h2>
      }
    </div>
  );
}

// 2. inline if-else : ? 연산자를 사용하여 조건에 따라 다른 값을 보여준다.
// 문자열이 아닌 element를 넣어서 사용할 수도 있다. 
// 예시 코드
function UserStatus(props) {
  return (
    <div>
      이 사용자는 현재 <b>{props.isLoggedIn ? "로그인" : "로그인하지 않은"}</b> 상태입니다.
    </div>
  );
}

function LoginControl(props) {
  const [isLoggedIn, setIsLoggedIn] = useState(false);

  const handleLoginClick = () => {
    setIsLoggedIn(true);
  }
  const handleLogoutClick = () => {
    setIsLoggedIn(false);
  }

  return (
    <div>
      <Greeting isLoggedIn={isLoggedIn} />
      {isLoggedIn
        ? <LogoutButton onClick={handleLogoutClick} />
        : <LoginButton onClick={handleLoginClick} />
      }
    </div>
  );
}

// Q. 컴포넌트를 렌더링하고 싶지 않을 떄는 ?
// A. null을 리턴하면 렌더링되지 않는다.
function WarningBanner(props) {
  if (!props.warning) {
    return null;
  }
  // props.warning이 true일 때만 렌더링된다. 
  return (
    <div>경고!</div>
  );
}

function MainPage(props) {
  const [showWarning, setShowWarning] = useState(false);

  const handleToggleClick = () => {
    setShowWarning(prevShowWarning => !prevShowWarning); 
  }

  return (
    <div>
      <WarningBanner warning={showWarning} />
      <button onClick={handleToggleClick}>
        {showWarning ? '감추기' : '보이기'}
      </button>
    </div>
  );
}