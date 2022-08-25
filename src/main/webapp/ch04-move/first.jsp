<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = "이순신";
	request.setAttribute("r_name", name);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>First</title>
</head>
<body>
	<h3>이 파일은 first.jsp입니다.</h3>
	<jsp:include page="second.jsp" flush="false"></jsp:include>
	<p>JAVA SERVER PAGE</p>
</body>
</html>