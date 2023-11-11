import React from "react";
import Book from "./Book";

function Library(props) {
    // return ();   -> 괄호임 !
    // {}를 사용할 경우 JS 코드가 들어간다. 
    // name, numOfPage 등 속성의 값들이 모두 Book component의 props 값으로 들어가게 된다.
    return (
        <div>
            <Book 
                name="처음 만난 파이썬" 
                numOfPage={300} 
            />
            <Book 
                name="처음 만난 AWS" 
                numOfPage={400} 
            />
            <Book 
                name="처음 만난 리액트" 
                numOfPage={500} 
            />
        </div>
    );
}

export default Library;