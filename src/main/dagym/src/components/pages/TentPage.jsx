import React from 'react';
import { useParams } from 'react-router-dom';
import TentDetail from './TentDetail';
// 자바스크립트는 싱글스레드이다. - forEach문 -> for문 처리
// 콜백이슈
// 문제해결능력
function TentPage(props) {
    const tents = props.tents;
    //console.log(tents);
    const {id, name} = useParams();
    //console.log(id + ", "+name);
    return (
        <div className='container'>
            <div className='row'>
                {tents.map((tent, i)=>(
                    <TentDetail key={i} tent={tent}/>
                ))}
            </div>
        </div>
    );
}

export default TentPage;