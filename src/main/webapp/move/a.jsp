<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>a.jsp</title>
</head>
<body>
<!-- 포워드는 요청페이지와 응답페이지가 다르다
		URL이 안바뀐다(a.jsp에 b.jsp의 내용이 들어가있지만 a.jsp의 URL)
		a.jsp에 담긴다
		페이지 재사용성
 -->
여기는 a.jsp페이지입니다.
<%
	request.setAttribute("age", "30");
%>
1. 시작입니다.
<%@include file="b.jsp" %>
2. 마지막입니다.
</body>
</html>