import React from "react";
import Header from "./components/Header.js";
import SearchForm from "./components/SearchForm.js";

export default class App extends React.Component {
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
            onSubmit={(searchKeyword) => this.search(searchKeyword)}
            onReset={() => this.handleReset()}
          />
        </div>
      </>
    );
  }
}