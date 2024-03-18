import React from 'react';
import List from "./List.js";
import { formatRelativeDate } from '../helpers.js';

export default class HistoryList extends List {
  componentDidMount() {
    this.fetch();
  }

  fetch() {
    const data = store.getHistoryList();
    this.setState({ data });
  }

  handleClickRemoveHistory(event, keyword) {
    event.stopPropagation();  // 다른 쪽 핸들러의 동작을 차단
    store.removeHistory(keyword); // 키워드 삭제 요청
    this.fetch();
  }

  renderItem(item) {
    return (
      <>
        <span>{item.keyword}</span>
        <span className="date">{formatRelativeDate(item.date)}</span>
        <button
          className='btn-remove'
          onClick={(event) => this.handleClickRemoveHistory(event, item.keyword)}
        />
      </>
    );
  }
}