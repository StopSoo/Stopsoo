import React from "react";
import Header from "./components/Header.js";
import SearchForm from "./components/SearchForm.js";

export default class App extends React.Component {
  constructor() {
    super();

    this.state = {
      searchKeyword: "",
    };
  }
  
  handleChangeInput(searchKeyword) {
    if (searchKeyword.length <= 0) {
      this.handleReset();
    }
    
    this.setState({ searchKeyword });
  }

  search() {

  }

  handleReset() {
    
  }
  
  render() {
    return (
      <>
        <Header title="검색" />
        <div className="container">
          {/* SearchForm - handleSubmit 함수를 통해 넘어온 searchKeyword */}
          <SearchForm 
            value={ this.state.searchKeyword }
            onChange={(value) => this.handleChangeInput(value)}
            onSubmit={(searchKeyword) => this.search(searchKeyword)}
            onReset={() => this.handleReset()}
          />
        </div>
      </>
    );
  }
}