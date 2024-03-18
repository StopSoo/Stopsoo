import React from 'react';
import List from "./List.js";
import { formatRelativeDate } from '../helpers.js';

export default class HistoryList extends React.Component {
  constructor() {
    super();

    this.state = {
      historyList: [],
    }
  }
  
  componentDidMount() {
    this.fetch();
  }

  fetch() {
    const historyList = store.getHistoryList();
    this.setState({ historyList });
  }

  handleClickRemove(event, keyword) {
    store.removeHistory(keyword); // 키워드 삭제 요청
    this.fetch();
  }

  render() {
    const { onClick } = this.props;
    const { historyList } = this.state;

    return (
      <List 
        data={historyList}
        onClick={onClick}
        hasDate
        onRemove={(keyword) => this.handleClickRemove(keyword)}
      />
    );
  }
}