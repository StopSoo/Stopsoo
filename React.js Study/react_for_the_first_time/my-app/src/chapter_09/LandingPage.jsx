import React, { useState } from 'react';
import Toolbar from './Toolbar';

function LandingPage(props) {
  const [isLoggedIn, setIsLoggedIn] = useState(false);

  const onClickLogin = () => {
    setIsLoggedIn(true);
  }

  const onClickLogout = () => {
    setIsLoggedIn(false);
  }

  return (
    <div>
      <Toolbar
        isLoggedIn = {isLoggedIn}
        onClickLogin = {onClickLogin}
        onClickLogout = {onClickLogout}
      />
      <div style={{ padding: 16 }}>지수와 함께 하는 즐거운 시간 ~</div>
    </div>
  );
}

export default LandingPage;