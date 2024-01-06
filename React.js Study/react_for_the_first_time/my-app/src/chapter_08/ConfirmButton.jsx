import React from "react";

class ConfirmButton extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      isConfirmed: false, // 확인 여부를 저장
    };
    // callback에서 `this`를 사용하기 위해서는 바인딩이 필수 !
    // 클래스 함수들은 JS에서 기본적으로 바인딩되지 않기 때문 
    // bind하지 않으면 this.handleConfirm은 global scope에서 호출됨, undefined이므로 사용 불가능
    this.handleConfirm = this.handleConfirm.bind(this); // bind 사용
  }
  // event handler
  handleConfirm() {
    this.setState((prevState) => ({
      isConfirmed: !prevState.isConfirmed,
    }));
  }

  render() {
    return (
      <button 
        onClick={this.handleConfirm}  // bind를 해줬기 때문에 함수명만 전달 가능 (괄호를 사용하지 않고!)
        disabled={this.state.isConfirmed}
      >
        {this.state.isConfirmed ? "확인됨" : "확인하기"}
      </button>
    );
  }
}

export default ConfirmButton;