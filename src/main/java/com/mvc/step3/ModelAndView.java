package com.mvc.step3;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;

// 왜 굳이 ModelAndView를 추가했나? Model, ModelMap
// spring2.5까지 많이 사용하던 클래스이다.
// req.setAttribute("boardList",boardList);
// 이 코드를 쓰지 않고 화면에서 boardList를 사용하고 싶다. 어떡하지?
// 서블릿에 의존적이지 않은 프레임워크가 정답
// req 없이도 조회된 결과를 화면에 전달할 수 있었으면 해
// 내 안에 scope있다 - request
public class ModelAndView {
	Logger logger = Logger.getLogger(ModelAndView.class);
	HttpServletRequest req = null;
	// 접두어 /WEB-INF/jsp/
	// 접미어 .jsp
	// 접두어와 접미어를 붙여서 응답페이지에 URL을 완성한다.
	private String viewName = null;
	List<Map<String,Object>> reqList = new ArrayList<>();
	// String viewName = new String(); 원본이 아닌 복사본
	// 객체 재사용을 static(싱글톤패턴 - 오직 하나를 공유) 쓰지 않기 -> 생성자를 이용해서 하기
	public ModelAndView() {}
	// 왜 파라미터가 있는 생성자이어야만 하는가?
	// JButton jbtn = new JButton();
	// jbn.setText("전송");
	// JButton jbtn = new JButton("전송");
	// 내가 갖고 있지 않아? -> req -> ActionSupport에 있어 -> 거기서 가져와야 해
	// Controller -> HandlerMapping(스프링에서 훔쳤다) ->SimpleHandlerMapping(스프링)
	// 생성자의 파라미터를 통해서 객체를 주입 받는다.
	// setter 객체주입법과 생성자 객체 주입법을 스프링이 제공하고 있다.
	public ModelAndView(HttpServletRequest req) {
		this.req = req;
	}
	public void setViewName(String viewName) {
		this.viewName = viewName;
	}
	public String getViewName() {
		return viewName;
	}
	public void addObject(String name, Object obj) {
		logger.info(name+", "+obj);
		Map<String, Object> pMap = new HashMap<>();
		pMap.put(name, obj);
		// 메소드 호출하기 - scope 적용함
		// 메소드의 파라미터를 결정할 수 있나?
		// 메소드의 리턴타입을 결정할 수 있나?
		// 파라미터의 클래스 타입으로 원본을 보낼 수 있나?
		// 파라미터로 전달하는 건 문자열만 가능함
		// 그러나 첨부파일은 바이너리 타입으로 처리해야함
		// 전송 - post, get
		// 바이너리(문자, 숫자 분리 - 부피가 줄어든다)는 처리는 무조건 post
		// 일반 request로는 바이너리 방식의 값을 읽을 수 없다.
		req.setAttribute(name, obj);
		reqList.add(pMap);
	}
}
