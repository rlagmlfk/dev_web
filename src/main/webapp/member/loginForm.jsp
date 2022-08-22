<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
페이지 디렉티브 - 언어, 마임타입, 인코딩<->디코딩
웹서비스에서 이용하는 프로토콜(http)은 비상태 프로토콜이다
상태가 유지되지 않는다.
요청을 하면 연결을 하고 요청에 대한 응답이 나가고 나면 연결이 끊어진다.
현재 내가 요청한 페이지에 내용이 아직도 보여지고 있는데 왜 끊어졌다는걸까?
html, css, js는 로컬pc에 다운로드가 일어난다 - 브라우저
주소 - URL
장바구니, 찜
쿠키 - 문자열 - 텍스트 - base2, base8, base16, base32, base64 - 메모리 주소번지와 관계가 있다.
- 개인PC에 저장됨 - 노출될 수 있다.
세션 - Object타입 - 서버컴 cash memory - 노출
둘 다 저장소이다.
session.setAttribute("s_name","김유신");
요청이 유지되는 동안에만 사용가능함 - 시간설정은 불가함
request.setAttribute("s_name","이성계");
-->
<% 
	String s_name = (String)session.getAttribute("s_name"); // 세션에 담긴 이름을 넣기
	//s_name="히라";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/common/easyui_common.jsp" %>
<script>
	function login(){
		location.href="loginAction.jsp"
	}
	function logout(){
		location.href="logout.jsp"; // 모델1방식 - 이건 MVC패턴이 아님
	}
</script>
</head>
<body>
<!-- 세션값이 null일때 -->
<% 
// 로그인을 하지 않고 페이지를 열었을 때 - 로그인 버튼 출력
	if(s_name == null){
%>
<form id="f_login">
<input class="easyui-textbox" label="아이디" name="mem_id" data-options="iconCls:'icon-man'" style="width:200px">
<br>
<input class="easyui-textbox" label="비밀번호" name="mem_pw" data-options="iconCls:'icon-lock'" style="width:200px">
<a id="btn_login" href="javascript:login()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">로그인</a>
</form>
<% 
	} // 너 로그인 안했는데...
	else { // 로그인을 성공했을 때 - 로그아웃 버튼 출력
%>
<!-- 세션값이 존재할 때 
로그아웃 버튼을 누르면 해당 사용자에 관한 모든 세션을 회수함
-->
	<%=s_name %>님 환영합니다.
	<a id="btn_logout" href="javascript:logout()" class="easyui-linkbutton">로그아웃</a>
<% 
	} // end of else
%>
</body>
</html>