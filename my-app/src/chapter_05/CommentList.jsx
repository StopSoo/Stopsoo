import React from 'react';
import Comment from './Comment.jsx';

const comments = [
  {
    name: "정지수",
    comment: `안녕하세요, 정지수입니다.`,
  },
  {
    name: "이시은",
    comment: `안녕하세요, 이시은입니다.`,
  },
  {
    name: "정수영",
    comment: `안녕하세요, 정수영입니다.`,
  },
];

function CommentList(props) {
  return(
    <div>
      {comments.map((comment) => {
        return (
          <Comment name={comment.name} comment={comment.comment} />
        );
      })}
    </div>
  );
}

export default CommentList;