<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration" %>
<% 
	// 브라우저에 요청을 하면 서버는 세션 아이디를 발행하여 쿠키에 저장해 둔다.
	// 이것으로 너를 구분할 수도 있다.
	// 쿠키는 로컬PC에 문자열로만 저장가능하다. 즉 자료구조는 담을 수 없다.
	// 세션은 서버사이드에 저장됨. 좀 더 정확히는 cache memory에 기억됨
	// 브라우저 개발자 도구에서 확인 불가
	// 자료구조도 담을 수 있다. 문자도 물론
	// 캐시 메모리는 인텔 계열 CPU와 AMD계열 CPU마다 차이가 있으며 고가이다.
	// 용량의 제약이 많다.
	// 찜 상품, 장바구니는 어디에 담는게 좋을까?
	// 찜 상품은 최대 3일동안 보관된다고 한다 -> 이것의 의미는?
	// 3일 후에는 자동 비워지거나 삭제 - 시간을 관리하여 유지시키고 삭제시킬수 있음
	// 이것들과 관련된 모든 api는 찾아보고 테스트 해볼 것
	String s_name = (String)session.getAttribute("s_name");
	Integer s_age = (Integer)session.getAttribute("s_age");
	//out.print("세션에 담긴 값들 "+s_name+", "+s_age);
	Enumeration<String> snames = session.getAttributeNames();
	while(snames.hasMoreElements()){
		String name = snames.nextElement();
		// out.print(name+"<br />");
	}
%>
<table border="1" borderColor="green" width="100%" height="100%">
	<tr>
		<td align="center">TerrGYM Project</td>
	</tr>
</table>
