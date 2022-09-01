import React from 'react';
import {Container, Navbar, Nav, Button} from "react-bootstrap";
import styled from 'styled-components';
let BtnColor = styled.button`
    background: ${props => props.bgc};
    color: ${props => (props.bgc === 'pink'?'black':'white')};
    padding: 5px;
    border-radius:50%;
    margin: 10px 10px;
`;
function bootStrapApp(props) {
    return (
        /* 헤더 영역 시작 */
        <>
        <Navbar bg="dark" variant="dark">
            <Container>
            <Navbar.Brand href="#home">JAVA CAMP</Navbar.Brand>
            <Nav className="me-auto">
                <Nav.Link href="#home">Home</Nav.Link>
                <Nav.Link href="#features">텐트</Nav.Link>
                <Nav.Link href="#pricing">매트/침낭</Nav.Link>
            </Nav>
            </Container>
        </Navbar>
        <Button>Home</Button>
        <BtnColor bgc="gray">Home</BtnColor>
        <BtnColor bgc="pink">Home</BtnColor>
        <BtnColor bgc="green">Home</BtnColor>
        </>
        /* 헤더 영역 끝 */
    );
}

export default bootStrapApp;