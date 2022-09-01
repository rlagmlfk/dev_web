import "./app.css";
import React, { useState } from 'react';
import {Container, Navbar, Nav, Button} from "react-bootstrap";
import {Link, Routes, Route, useNavigate} from 'react-router-dom';
import styled from 'styled-components';
import TentPage from './components/pages/TentPage';
import goods from "./tentData";

function BootStrapApp(props) {
    // 변수 선언 위치, 함수 선언 위치
    // 상태관리를 위해 제공되는 훅(16.8버전 후에 지원: 이전 함수로는 state관리가 불가)
    // 기존 클래스에서 this의 이슈로 에러가 발생함 - 미숙 - 관리자 입장 문제임
    let [tents, setTents] = useState(goods);
    let navigate = useNavigate(); // 함수형 프로그래밍 - 클래스가 아닌 훅으로 처리함
    return (
        <>
        {/* 헤더 영역 시작 */}
        <Navbar bg="dark" variant="dark">
            <Container>
            <Navbar.Brand href="#home">JAVA CAMP</Navbar.Brand>
            <Nav className="me-auto">
                <Nav.Link onClick={() => {
                    navigate("/");
                }}>Home</Nav.Link>
                <Nav.Link onClick={()=>{
                    navigate("/tents");
                }}>텐트</Nav.Link>
                <Nav.Link href="#pricing">매트/침낭</Nav.Link>
            </Nav>
            </Container>
        </Navbar>
        {/* 헤더 영역 끝 */}
        <div className='main-bg'></div>
{/*         <Link to="/">홈</Link>
        <Link to="/tents">텐트페이지</Link> */}
        <Routes>
            <Route path="/" element={<div>홈페이지 입니다.</div>} />
            <Route path="/tents" element={<TentPage tents={tents}/>} />
        </Routes>
        </>
    );
}

export default BootStrapApp;

/*
    리액트에서는 싱글페이지 어플리케이션으로 구현할것
    따라서 a태그를 사용하여 페이지URL이 변경되지 않도록 하면서 
    화면 전환이 이루어지도록 처리함

    이전페이지 이동
    history.go();  history.go(-1);이전페이지 이동 history.go(1);다음페이지로 이동
    리액트에서는 useNavigate훅을 이용해서 처리함
*/