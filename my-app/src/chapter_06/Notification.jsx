import React from "react";

// css 객체 정의
const styles = {
  wrapper: {
    margin: 8,
    padding: 8,
    display: "flex",
    flexDirection: "row",
    border: "1px solid grey",
    borderRadius: 16,
  },
  messageText: {
    color: "black",
    fontSize: 16
  },
};

class Notification extends React.Component {
  constructor(props) {  // 생성자
    super(props);

    this.state = {};
  }

  componentDidMount() { // component 생성 
    console.log(`${this.props.id} componentDidMount() called.`);
  }

  componentDidUpdate() {  // component 상태 변경
    console.log(`${this.props.id} componentDidUpdate() called.`);
  }

  componentWillUnmount() {  // component 삭제
    console.log(`${this.props.id} componentWillUnmount() called.`);
  }

  render() {
    return (
      <div style={styles.wrapper}>
        <span style={styles.messageText}>{this.props.message}</span>
      </div>
    );
  }
}

export default Notification;