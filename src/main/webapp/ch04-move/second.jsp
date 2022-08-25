<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Action Tag</title>
</head>
<body>
<%!
// 디클러레이션 쓰지말자
// 인스턴스화 없이 함수호출 불가니까 안씀
	int age = 10; // 전역변수 선언
	public String getName(){ return "강감찬"; } // 메소드 선언 가능함 그러나 쓰지않는다.
	//왜? MVC패턴 - jsp역할은 화면, 출력을 따져야한다. 관심사 분리
	// (화면은 너가 해줘 나는 로직을 구현할게, 입력관심사, 출력관심사, 처리 관심사)
	// a.jsp -(jsp.api)-> a_jsp.java(서블릿) -> 브라우저에 쓰기
	// document.write("<b>굵은글씨</b>")
%>
<%
	// out.print(name); first에서 선언만 해주면 컴파일에러남
	String r_name = (String)request.getAttribute("r_name");
	out.print(r_name);
	// 스크립틀릿 안에 메소드, 전역변수 선언 불가
	/* public String getName(){} */
%>
	<h3>이 파일은 second.jsp</h3>
	Today is : <%=new java.util.Date() %>
</body>
</html>