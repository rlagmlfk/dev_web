<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 세션에 담긴 모든 정보가 삭제됨.
	session.invalidate();
// 세션에 담긴 정보 중 특정한 정보만 삭제하려면
//	session.removeAttribute("이름"); // 이름에 대응하는 값만 삭제가능함
	response.sendRedirect("./loginForm.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>