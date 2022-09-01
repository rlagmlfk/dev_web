import React from 'react';
import Workout from './Workout';

/* 
http://localhost:3000/index.html 요청하는 것과 같음
index.html - div -> id:root

index.js -> App등록(workoutApp.jsx)
root.render(출력화면);

workoutApp.jsx <- Workouts.jssx <- Workout.jsx

부모태그에서 자손태그로의 데이터 전달은 가능
그 반대는 불가

운동목록 처리([{ }]) - Workouts.jsx 추가
[].map((workout =>(<Workout />))
한 개 로우처리 - Workout.jsx추가
*/

function Workouts(props) {
    console.log(props); // 객체로 받는 경우
    console.log(props.workouts); // 배열로 받는 경우

    const handleIncrement = (workout) => {
        props.onIncrement(workout);
    };
    // 바닐라 스크립트에서 함수는 객체이다.
    const handleDecrement = (workout) => {
        props.onDecrement(workout);

    };
    const handleDelete = (workout) => {
        props.onDelete(workout);
    };

    return (
        <div className='workouts'>
            <ul>
            {
                /* 스크립트 쓸 수 있다 */
                props.workouts.map(workout => (
                    <Workout //
                    key={workout.id} // 
                    onIncrement={handleIncrement}
                    onDecrement={handleDecrement}
                    onDelete={handleDelete}
                    workout={workout} //
                    />
                ))
            }
            </ul>
        </div>
    );
}

export default Workouts;