function MyButton(props) {
    const [isClicked, setIsClicked] = React.useState(false);

    /**
     * createElement
     * - type : html 태그, react component
     * - [props] : 속성
     * - [...children] : 자식 element
     */
    return React.createElement(
        'button',
        { onClick: () => setIsClicked(true) },
        isClicked ? 'Clicked!' : 'Click here!'
    )
}
// react component를 dom container에 rendering
const domContainer = document.querySelector('#root');
ReactDOM.render(React.createElement(MyButton), domContainer);