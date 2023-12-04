import React from 'react';

// ThemeContext의 값은 추후에 Provider를 통해 설정할 예정
const ThemeContext = React.createContext();
ThemeContext.displayName = "ThemeContext";  // 이름

export default ThemeContext;