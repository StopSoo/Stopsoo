/* DOM API를 직접 사용하지 않기 위해 아래 함수들처럼 래핑 */
// document.querySelector를 줄여놓은 함수
export function qs(selector, scope = document) {
  if (!selector) throw "no selector";

  return scope.querySelector(selector);
}

// document.querySelectorAll 함수를 호출
export function qsAll(selector, scope = document) {
  if (!selector) throw "no selector";

  // 유사 배열을 반환
  return Array.from(scope.querySelectorAll(selector)); 
}

// target element에서 event를 수신하고, addEventListener를 매핑
export function on(target, eventName, handler) {
  target.addEventListener(eventName, handler);
}

// 인자로 받은 handler를 그대로 사용하지 않고, emitEvent라는 handler로 래핑
// 특정 element 하위에 있는 자식 element들의 event를 처리할 때 사용한다.
export function delegate(target, eventName, selector, handler) {
  const emitEvent = (event) => {
    const potentialElements = qsAll(selector, target);

    for (const potentialElement of potentialElements) {
      if (potentialElement === event.target) {
        return handler.call(event.target, event);
      }
    }
  };

  on(target, eventName, emitEvent);
}

// event를 발행
export function emit(target, eventName, detail) {
  const event = new CustomEvent(eventName, { detail });
  target.dispatchEvent(event);
}

/* 참고용 */
export function formatRelativeDate(date = new Date()) {
  const TEN_SECOND = 10 * 1000;
  const A_MINUTE = 60 * 1000;
  const A_HOUR = 60 * A_MINUTE;
  const A_DAY = 24 * A_HOUR;

  const diff = new Date() - date;

  if (diff < TEN_SECOND) return `방금 전`;
  if (diff < A_MINUTE) return `${Math.floor(diff / 1000)}초 전`;
  if (diff < A_HOUR) return `${Math.floor(diff / 1000 / 60)}분 전`;
  if (diff < A_DAY) return `${Math.floor(diff / 1000 / 60 / 24)}시간 전`;
  return date.toLocaleString("ko-KR", {
    hour12: false,
    dateStyle: "medium",
  });
}

export function createPastDate(date = 1, now = new Date()) {
  if (date < 1) throw "date는 1 이상입니다";

  const yesterday = new Date(now.setDate(now.getDate() - 1));
  if (date === 1) return yesterday;

  return createPastDate(date - 1, yesterday);
}

export function createNextId(list = []) {
  return Math.max(...list.map((item) => item.id)) + 1;
}