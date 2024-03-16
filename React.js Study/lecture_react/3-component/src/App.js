import React from "react";
import Header from "./components/Header.js";
import SearchForm from "./components/SearchForm.js";
import SearchResult from "./components/SearchResult.js";
import store from "./Store.js";
import Tabs, { TabType } from './component/Tabs.js';

export default class App extends React.Component {
  constructor() {
    super();

    this.state = {
      searchKeyword: "",
      searchResult: [],
      submitted: false,   // 검색 결과 제출 여부
      selectedTab: TabType.KEYWORD,  // 추천 검색어를 기본 탭으로 설정
    };
  }
  
  handleChangeInput(searchKeyword) {
    if (searchKeyword.length <= 0) {
      this.handleReset();
    }

    this.setState({ searchKeyword });
  }

  search(searchKeyword) {
    const searchResult = store.search(searchKeyword);

    this.setState({
      searchResult: searchResult,
      submitted: true,  // 검색 결과 제출 여부를 true로 변경
    });
  }

  handleReset() {
    this.setState({ 
      searchKeyword: "",   // 검색 키워드를 빈 문자열로 초기화
      submitted: false,   // 검색 결과 제출 여부를 false로 재설정
      searchResult: [],   // 검색 결과 리스트를 빈 배열로 초기화 
    }); 
  }
  
  render() {
    const { searchKeyword, submitted, searchResult } = this.state;

    return (
      <>
        <Header title="검색" />
        <div className="container">
          <SearchForm 
            value={ searchKeyword }
            onChange={(value) => this.handleChangeInput(value)}
            onSubmit={() => this.search(searchKeyword)}
            onReset={() => this.handleReset()}
          />
          <div className="content">
            {/* 검색어 제출 여부에 따라 다른 화면을 렌더링 */}
            {submitted ? (
              <SearchResult data={searchResult} />
            ) : (
              <>
                <Tabs 
                  selectedTab={selectedTab} 
                  onChange={(selectedTab) => this.setState({ selectedTab })}
                />
                {/* 선택된 탭에 따른 렌더링 */}
                {selectedTab === TabType.KEYWORD && <>TODO: 추천 검색어 목록</>}
                {selectedTab === TabType.HISTORY && <>TODO: 최근 검색어 목록</>}
              </>
            )}
          </div>
        </div>
      </>
    );
  }
}