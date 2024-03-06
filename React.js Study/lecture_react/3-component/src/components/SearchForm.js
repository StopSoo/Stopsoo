import React from "react";

// export default : 해당 컴포넌트를 기본 모듈로 등록
// class와 function 중 SearchForm 컴포넌트는 state를 사용해야 하므로 class를 선택
export default class SearchForm extends React.Component {
  constructor() {
    super();

    this.state = {
      searchKeyword: "",
    };
  }

  handleChangeInput(event) {
    const searchKeyword = event.target.value;
    this.setState({ searchKeyword });
  }

  render() {
    return (
      <form>
        <input 
          type="text"
          placeholder="검색어를 입력하세요"
          autoFocus
          value={this.state.searchKeyword}
          onChange={(event) => this.handleChangeInput(event)}
        />
        {this.state.searchKeyword.length > 0 && (
          <button type="reset" className="btn-reset" />
        )}
      </form>
    );
  }
}