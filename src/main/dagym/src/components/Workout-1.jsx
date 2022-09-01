import React, { useState } from 'react';

function Workout(props) {
    const [name, setName] = useState("레그프레스");
    const [count, setCount] = useState(3);
    // 상태를 관리해본다 - 바닐라 스크립트 처리
    const state = {
        count: 0,
    };
    
    const handleIncrement = (e) => {
        setCount(count + 1);
        setName("스쿼트");
    }
    const handleDecrement = (e) => {
        setCount(count <=0 ? 0: count-1);
        setName("랩풀다운");
    }

    return (
        <>
            <li className="workout">
                <span className="workout-name">{name}</span>
                <span className='workout-cout'>{count}</span>
                <button className='wo-button workout-increase' onClick={handleIncrement}>
                    <i className='fa-solid fa-plus'></i>
                </button>
                <button className='wo-button workout-decrease' onClick={handleDecrement}>
                    <i className='fas fa-minus-square'></i>
                </button>
                <button className='wo-button workout-delete'>
                    <i className='fa-solid fa-trash-can'></i>
                </button>
            </li>
        </>
    );
}

export default Workout;