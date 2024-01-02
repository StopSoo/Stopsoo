/* 기록용 */
import React from "react";
import styled from "styled-components";
/**
 * display 속성의 대표적인 값들
 * 1. display: none;
 * - element를 화면에서 숨기기 위해 사용
 * - <script> 태그의 display 속성 기본 값은 display: none;
 * 
 * 2. display: block;
 * - 블록 단위로 element를 배치
 * - <p>,<div>, <h1>~<h6> 태그의 display 속성 기본 값
 * 
 * 3. display: inline;
 * - element를 라인 안에 넣는 것
 * - <span> 태그의 display 속성 기본 값
 * 
 * 4. display: flex;
 * - element를 block 레벨의 flex container로 표시
 * - container이기 때문에 내부에 다른 element들을 포함
 */

/**
 * visibility 속성의 대표적인 값들
 * 1. visibility: visible;
 * - element를 화면에 보이게 하는 것
 * 
 * 2. visibility: hidden;
 * - 화면에서 안 보이게 감추는 것
 * - element를 안 보이게만 하는 것이고, 화면에서의 영역은 그대로 차지
 */

/**
 * position 속성의 대표적인 값들
 * 1. static
 * - 기본 값으로 element를 원래의 순서대로 위치시킴
 * 
 * 2. fixed
 * - element를 브라우저 window에 상대적으로 위치시킴
 * 
 * 3. relative
 * - element를 보통의 위치에 상대적으로 위치시킴
 * - left: 16px;과 같은 코드를 추가하면 element 왼쪽에 16px의 공간이 생김
 * 
 * 4. absolute
 * - element를 절대 위치에 위치시킴
 */

/**
 * 가로, 세로 길이와 관련된 속성
 * - width, height, min-width, min-height, max-width, max-height
 * - auto / 16px 등과 같은 실제 value
 */

/**
 * Flexbox
 */
// 예시 코드
// div {
  // display: flex;
//   flex-direction: row | column | row-reverse | column-reverse;
//   align-items: stretch | flex-start | center | flex-end | baseline;
//   justify-content: flex-start | center | flex-end | space-between | space-around;
// }

/**
 * flex-direction 속성의 대표적인 값들
 * 1. row
 * - 기본 값이며 아이템을 행(row)을 따라 가로 순서대로 왼쪽부터 배치
 * 
 * 2. column
 * - 아이템을 열(column)을 따라 세로 순서대로 위쪽부터 배치
 * 
 * 3. row-reverse
 * - 아이템을 행(row)의 역(reverse) 방향으로 오른쪽부터 배치
 * 
 * 4. column-reverse
 * - 아이템을 열(column)의 역(reverse) 방향으로 아래쪽부터 배치
 */

/**
 * align-items
 * : container 내에서 아이템들을 어떻게 배치할 것인지에 관한 속성
 * : cross-axis를 기준으로 정렬
 * 
 * 1. stretch
 * - 기본값으로써 아이템을 늘려서 컨테이너를 가득 채움
 * 
 * 2. flex-start
 * - cross axis의 시작 지점으로 아이템을 정렬
 * 
 * 3. center
 * - cross axis의 중앙으로 아이템을 정렬
 * 
 * 4. flex-end
 * - cross axis의 끝 지점을 아이템을 정렬
 * 
 * 5. baseline
 * - 아이템을 baseline 기준으로 정렬
 */

/**
 * justify-content
 * : 컨테이너 내에서 아이템들을 어떻게 맞출 것인지에 관한 속성
 * : main axis를 기준으로 정렬
 * 
 * 1. flex-start
 * - main axis의 시작 지점으로 아이템을 맞춤
 * 
 * 2. center
 * - main axis의 중앙으로 아이템을 맞춤
 * 
 * 3. flex-end
 * - main axis의 끝 지점으로 아이템을 맞춤
 * 
 * 4. space-between
 * - main axis를 기준으로 첫 아이템은 시작 지점에 맞추고, 마지막 아이템은 끝 지점에 맞추며, 
 * - 중간에 있는 아이템들 사이의 간격이 일정하게 되도록 맞춤
 * 
 * 5. space-around
 * - main axis를 기준으로 각 아이템의 주변 간격을 동일하게 맞춤
 */


/**
 * 일반적인 글꼴 분류 (Generic font family)
 * 1. serif
 * - 각 글자의 모서리에 작은 테두리를 갖고 있는 형태의 글꼴
 * 
 * 2. sans-serif
 * - 모서리에 테두리가 없이 깔끔한 선을 가진 글꼴
 * - 컴퓨터 모니터에서는 serif보다 가독성이 좋음
 * 
 * 3. monospace
 * - 모든 글자가 같은 가로 길이를 가지는 글꼴
 * - 코딩을 할 때 주로 사용
 * 
 * 4. cursive
 * - 사람이 쓴 손글씨 모양의 글꼴
 * 
 * 5. fantasy
 * - 장식이 들어간 형태의 글꼴
 */

/**
 * font-style 속성의 값들
 * 1. normal
 * - 일반적인 글자의 형태를 의미
 * 
 * 2. italic
 * - 글자가 기울어진 형태로 나타남
 * - 별도로 기울어진 형태의 글자들을 직접 디자인해서 만든 것
 * 
 * 3. oblique
 * - 글자가 비스듬한 형태로 나타남
 * - 그냥 글자를 기울인 것
 */

/**
 * border
 * - border-width border-style border-color
 * - Ex> 1px solid black
 */


/**
 * styled-components
 */
// Ex1 : 사용 예시
const wrapper = styled.div`
  padding: 1em;
  background: gray;
`;

function MainPage(props) {
  return (
    <wrapper>
      안녕, 리액트 !
    </wrapper>
  );
}

export default MainPage;

// Ex2 : tagged/untagged template literal
// 1. untagged template literal
// 단순한 문자열
`string text`
// 여러 줄(multi-line)에 걸친 문자열
`string text 1
string text 2`
// 대체 가능한 expression이 들어있는 문자열
`string text ${expression} string text`

// 2. tagged template literal
// myFunction의 파라미터로 expression으로 구분된 문자열 배열과 expression이 순서대로 들어간 형태로 호출됨
myFunction`string text ${expression} string text`;

const name = '인제';
const region = '서울';

function myTagFunction(strings, nameExp, regionExp) {
  let str0 = strings[0];
  let str1 = strings[1];
  let str2 = strings[2];

  // 여기에서도 template literal을 사용하여 리턴할 수 있다.
  return `${str0}${nameExp}${str1}${regionExp}${str2}`;
}

const output = myTagFunction`제 이름은 ${name}이고, 사는 곳은 ${region}입니다.`;

// Ex3 : styled-components에서 props 사용하기 + 확장 
const Button = styled.button`
  color: ${props => props.dark ? "white" : "dark"};
  background: ${props => props.dark ? "black" : "white"};
  border: 1px solid black;
`;

const RoundedButton = styled(Button)` 
  // 이와 같이 Button 컴포넌트에 style을 추가해서 새로운 컴포넌트를 만들 수 있다 !
  border-radius: 16px;
`;

function Sample(props) {
  return (
    <div>
      <Button>Normal</Button>
      <Button dark>Dark</Button>
      <RoundedButton>Rounded</RoundedButton>
    </div>
  );
}

