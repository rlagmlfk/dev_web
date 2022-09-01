import React, { useState } from 'react';

function Workout(props) {
    // console.log(props.workout.name + props.workout.count);
    // 상태를 관리해본다 - 바닐라 스크립트 처리
    // 태그안에 {}써서 자바스크립트 코드 작성 가능
    // {} 안에 이벤트 함수나 자료구조를 넘길 수 있음.
    // 이벤트 소스는 Workout.jsx에서 감지됨 그러나 처리는 상위 요소로 전달하여 처리
    // 왜? (캡쳐링-상위에서 하위로, 버블링-하위에서 상위로)
    // 데이터 소스가 어디에 있지? - workoutApp.jsx에 있다.
    // 그리고 그 안에 count가 있다. - count수정해야 함
    // 이러한 이유로 리액트 코딩에서는 상위노드에서 이벤트처리를 함
    const state = {
        count: 0,
    };
    // 바닐라 스크립트에서 함수는 객체이다
    const handleDecrement = (workout) => {
    // 이벤트 발생 소스는 여기(Workout.jsx)에 있지만 이벤트 처리는 workoutApp.jsx에서 함
    // 함수의 파라미터로 값을 넘길때 props뒤에 오는 이름은 상위 노드에서 속성이름을 작성함
        props.onDecrement(props.workout);
    };
    const handleIncrement = (workout) => {
        props.onIncrement(props.workout);
    };

    const handleDelete = (workout) => {
        props.onDelete(props.workout);
    };

    return (
        <>
            <li className="workout">
                <span className="workout-name">{props.workout.name}</span>
                <span className='workout-cout'>{props.workout.count}</span>
                <button className='wo-button workout-increase' onClick={handleIncrement}>
                    <i className='fa-solid fa-plus'></i>
                </button>
                <button className='wo-button workout-decrease' onClick={handleDecrement}>
                    <i className='fas fa-minus-square'></i>
                </button>
                <button className='wo-button workout-delete' onClick={handleDelete}>
                    <i className='fa-solid fa-trash-can'></i>
                </button>
            </li>
        </>
    );
}

export default Workout;