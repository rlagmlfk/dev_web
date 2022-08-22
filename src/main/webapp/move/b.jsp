<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>b.jsp</title>
</head>
<body>
여기는 b.jsp페이지 입니다.
<%
	String age = (String)request.getAttribute("age");
	out.print("age : "+age);
%>
</body>
</html>