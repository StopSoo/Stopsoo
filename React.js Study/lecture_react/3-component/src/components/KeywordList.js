import React from 'react';
import List from "./List.js";

export default class KeywordList extends React.Component {
  constructor() {
    super();

    this.state = {
      keywordList: [],
    }
  }

  componentDidMount() {
    const keywordList = store.getKeywordList();
    this.setState({ keywordList });
  }

  render() {
    return (
      <List 
        data={keywordList} 
        onClick={onClick} 
        hasIndex={true}
      />
    );
  }
}