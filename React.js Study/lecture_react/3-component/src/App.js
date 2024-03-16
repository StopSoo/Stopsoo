import React from "react";
import Header from "./components/Header.js";
import SearchForm from "./components/SearchForm.js";
import SearchResult from "./components/SearchResult.js";
import store from "./Store.js";

export default class App extends React.Component {
  constructor() {
    super();

    this.state = {
      searchKeyword: "",
      searchResult: [],
      submitted: false,   // 검색 결과 제출 여부
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
          {/* SearchForm - handleSubmit 함수를 통해 넘어온 searchKeyword */}
          <SearchForm 
            value={ this.state.searchKeyword }
            onChange={(value) => this.handleChangeInput(value)}
            onSubmit={() => this.search(searchKeyword)}
            onReset={() => this.handleReset()}
          />
          <div className="content">
            {submitted && <SearchResult data={searchResult} />}
          </div>
        </div>
      </>
    );
  }
}