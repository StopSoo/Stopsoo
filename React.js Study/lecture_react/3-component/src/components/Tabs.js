import React from 'react';

export const TabType = {
  KEYWORD: "KEYWORD",
  HISTORY: "HISTORY",
};

const TabLabel = {
  [TabType.KEYWORD]: "추천 검색어",
  [TabType.HISTORY]: "최근 검색어",
};

const Tabs = ({ selectedTab, onChange }) => {
  <>
    <ul className="tabs">
      {Object.values(TabType).map((tabType) => {
        return (
          <li 
            className={ selectedTab === tabType ? "active" : "" } 
            key={tabType}
            onClick={() => onChange(tabType)} // state가 없으므로 onChange 함수 발행
          >
            {TabLabel[tabType]}
          </li>
        );
      })}
    </ul>
  </>
}

export default Tabs;