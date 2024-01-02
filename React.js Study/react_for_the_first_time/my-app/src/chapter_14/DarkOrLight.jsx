import { useState, useCallback } from 'react';
import ThemeContext from './ThemeContext';
import MainContent from './MainContent';

function DarkOrLight(props) {
  const [theme, setTheme] = useState('light');
  // useCallback 함수에 대해 더 공부해야 할 듯 ?
  const toggleTheme = useCallback(() => {
    if (theme == 'light') {
      setTheme('dark');
    } else if (theme == 'dark') {
      setTheme('light');
    }
  }, [theme]);

  return (
    // context를 사용함으로써 ThemeContext 내 value를 하위 컴포넌트들이 사용할 수 있게 해줌!
    <ThemeContext.Provider value={{ theme, toggleTheme }}>
      <MainContent />
    </ThemeContext.Provider>
  );
}

export default DarkOrLight;