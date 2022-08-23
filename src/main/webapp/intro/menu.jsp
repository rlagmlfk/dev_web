<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	// include directive 방식으로 할 때는 같은 이름의 변수는 사용 불가
	// String s_name = (String)session.getAttribute("s_name");
	// Integer s_age = (Integer)session.getAttribute("s_age");
	// out.print("세션에 담긴 값들 "+s_name+", "+s_age);
%>
<table border="1" borderColor="gray" width="100%" height="100%">
	<tr>
		<td align="left" valign="top">
		<% 
			if(c_name == null){
		%>
			<form id="f_login" method="get" action="clogin.pj">
			<table border="1" width="150px">
				<tr>
					<td><input type="text" name="mem_id" size="10"></td>
					<td rowspan="2"><input type="button" value="로그인" onclick="login()"></td>
				</tr>
				<tr>
					<td><input type="text" name="mem_pw" size="10"></td>
				</tr>
			</table>
			</form>
		<% 
			}else{
		%>
		<%=c_name %>님 환영합니다.
		<input type="button" value="로그아웃" onclick="logout()">
		<% 
			}
		%>
			<table>
				<tr>
					<td><a href="index.jsp?menu=intro">인트로</a></td>
				</tr>
				<tr>
					<td><a href="index.jsp?menu=notice">공지사항</a></td>
				</tr>
				<tr>
					<td><a href="index.jsp?menu=qna">Q&A게시판</a></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
