<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 오라클에서 꺼내온 이름을 모든 페이지에서 공유하고 싶다면 어떡하지?
	// 서블릿과 JSP[출력페이지]사이에서 유지하기 - forward - request scope
	String s_name = "이순신";
	int s_age = 30;
	// forward와 상관없이 값을 유지(사용) 가능함
	// scope:request
	// page | request(forward)-sendRedirect |
	// A a new A(); Socket, ServerSocket
	// sendRedirect이든 forward(req-싱글톤패턴비밀, res)
	// 상관없이 그 시간동안 무조건 유지된다
	session.setAttribute("s_name", s_name);
	session.setMaxInactiveInterval(3000);
	session.setAttribute("s_age", s_age);
%>
<jsp:useBean id="myName" scope="page" class="java.lang.String"/>
<jsp:useBean id="yourName" scope="request" class="java.lang.String"/>
<jsp:useBean id="herName" scope="session" class="java.lang.String"/>
<jsp:useBean id="himName" scope="application" class="java.lang.String"/>