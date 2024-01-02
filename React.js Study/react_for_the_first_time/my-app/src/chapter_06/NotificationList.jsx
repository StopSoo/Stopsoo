import React from "react";
import Notification from "./Notification";

// 알림 객체 리스트 선언
const reservedNotifications = [
  {
    id: 1,
    message: "안녕하세요, 오늘 일정을 알려드립니다.",
  },
  {
    id: 2,
    message: "점심 식사 시간입니다.",
  },
  {
    id: 3,
    message: "이제 곧 미팅이 시작됩니다.",
  },
];

var timer;
// Notification component를 list 형태로 보여주기 위한 component
class NotificationList extends React.Component {
  constructor(props) {  // 생성자
    super(props);

    this.state = {
      // 앞으로 사용할 배열을 초기화하여 선언
      notifications: [],
    };
  }

  componentDidMount() { // 생명 주기 함수 중 하나 : component 생성 시 바로 실행되는 함수
    const { notifications } = this.state;
    // setInterval() 함수를 이용해 1초마다 정해진 작업을 수행
    timer = setInterval(() => {
      if (notifications.length < reservedNotifications.length) {
        const index = notifications.length;
        // 상단에 미리 만들어 놓은 알림 배열인 reservedNotifications 배열에서 하나씩 가져와서 state에 있는 notifications 배열을 업데이트 
        notifications.push(reservedNotifications[index]); 
        // state를 업데이트하기 위해 setState() 함수를 사용 (!) => 직접 state를 바꿀 수 없기 때문
        this.setState({
          notifications: notifications,
        });
      } else {
        this.setState({
          // notifications를 비움으로써 component 사망
          notifications: [],
        });
        clearInterval(timer);
      }
    }, 1000);
  }

  render() {
    return (
      <div>
        {this.state.notifications.map((notification) => {
          return (
            <Notification 
              key={notification.id} // 리액트 element를 구분하기 위한 고유 값 => map 함수 사용 시 필수
              id={notification.id}
              message={notification.message} 
            />
          );
        })}
      </div>
    );
  }
}

export default NotificationList;