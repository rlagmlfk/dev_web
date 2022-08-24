<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	// 한 문제당 배점을 담을 변수
	int perJumsu = 20;
	// 맞힌 개수
	int cnt = 0;
	// 판정 결과
	boolean isPass = false;
	// 합격점수 
	int pass = 60;
	String daps[] = {"3","4","1","2","4"};
	String tests[] = new String[5];
	Cookie[] cs = request.getCookies();
	if(cs != null && cs.length > 0){
		for(int i=0;i<cs.length;i++){
			String c_name = cs[i].getName();
			if("test1".equals(c_name)){
				tests[0] = cs[0].getValue();
			}
			else if("test2".equals(c_name)){
				tests[1] = cs[1].getValue();
			}
			else if("test3".equals(c_name)){
				tests[2] = cs[2].getValue();
			}
			else if("test4".equals(c_name)){
				tests[3] = cs[3].getValue();
			}
			else if("test5".equals(c_name)){
				tests[4] = cs[4].getValue();
			}
		}
	}
	for(int i=0;i<daps.length;i++){
		for(int j=0;j<daps.length;j++){
			if(daps[i].equals(tests[j])){
				if(i==j){
					cnt++;
				}
			}
		}
	}
	if(pass<=perJumsu*cnt){
		isPass = true;
	}
	else{
		isPass = false;
	}
	// out도 내장객체이다. request, response
	// 여기는 자바
	// out.print("");
	// 5번 답안지 생성 후 판정 페이지로 이동하기
	// 서버사이드에서 선실행 값이 다운로드가 일어난다. 그래서 소스보기를 보면 자바코드를 볼 수 없다.
	// 무조건 페이지가 이동한다 - 이전페이지와 연결이 끊어진다.
	// 아래코드가 있는 상태에서는 score.jsp페이지는 눈으로 볼 수가 없다.
	response.sendRedirect("account.jsp?isPass="+isPass);
	
%>
<!-- 여기는 html -->
맞힌 갯수 : <%=cnt%><!-- expression-출력 선결정된다.-->
<br>
당신의 점수는 : <%=perJumsu*cnt%> 입니다.
