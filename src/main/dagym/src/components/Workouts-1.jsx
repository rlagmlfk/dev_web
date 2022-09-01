import React from 'react';
import Workout from './Workout';

function Workouts(props) {
    console.log(props);
    return (
        <div className='workouts'>
            <ul>
                <Workout/>
            </ul>
        </div>
    );
}

export default Workouts;