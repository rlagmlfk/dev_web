package com.util;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;

/*
 * 자바에서 제공하는 JDBC API를 사용해서 오라클 서버와 연동하는 경우 반복되는 코드로 코드양이 많아 진다.
 * 이 문제를 해결하기 위해서 MyBatis가 제공되었다
 * 오라클 서버에 대한 물리적인 정보는 MapperConfig.xml문서에 적혀 있다
 * 또한 DML구문 즉 select, insert, update, delete를 자바 코드로 작성할 때 String객체를 사용하는데
 * 이것 또한 불편하고 특히 파라미터 값을 셋팅할 때 마다 더블쿼테이션과 싱글쿼테이션을 작성해야 하므로 불편했다
 * 마이바티스의 경우 모든 쿼리문을 xml문서에 작성하므로 이러한 문제를 고민할 필요가 없다
 * 바로 갈무리한다음 토드나 오렌지 같은 툴을 이용해서 즉시 실행해 볼 수도 있는 것이다.
 * 마지막으로는 select의 경우 반드시 ResultSet 인터페이스를 활용하여 오라클 서버에서 꺼내온 정보를
 * 자료구조에 담아야 했는데 이것도 생략이 가능하다 
 * 다만 쿼리문 속성으로 resultType=map을 주기만 하면 알아서 조회된 결과값이 들어간다
 * 여기에 다가 프로시저와 동적쿼리문도 제공되어서 if문이나 반복문도 사용할 수 있다.
 * 학자 - 30%이상이 줄어든다
 * 
 * 자바 설정 - Properties
 * XML설정 - spring2.0~spring3.0 주류 (어노테이션 2.5부터 제공은 됨 - 많이 부족함 - servlet에 의존적 - 별로)
 * 어노테이션 설정 - 자바 설정 - 메이븐 방식, 그레이들 방식(코틀린-2019공식 인정-jetbrain) 
 */
public class MyBatisCommonFactory {
	static Logger logger = Logger.getLogger(MyBatisCommonFactory.class);
	public static SqlSessionFactory sqlSessionFactory = null;

	// SqlSessionFactory객체를 생성해 주는 메소드 입니다. - 싱글톤 패턴 적용
	// 메소드를 통한 객체주입 코드(디자인 패턴 적용, 싱글톤, 의존성 주입, 제어역행, 개발방법론(MVC, MVP, MVVM)
	// 인스턴스화 5가지 유형
	public static void init() {
		try {
			// @ComponentScan - xml 문서 정보수집
			String resource = "com/mybatis/MapperConfig.xml";
			// IO패키지를 이용해 읽어들임 - POJO방식 - 자원관리 책임이 개발자에게 있다
			// 순제어 <-> 역제어, 제어역전(스프링) - 소스리뷰 재료, 주제
			Reader reader = Resources.getResourceAsReader(resource);
			logger.info("before sqlSessionFactory : " + sqlSessionFactory);
			// 싱글톤 패턴 - 사용자 정의 방식 처리하기 - 프레임 워크를 만들 수도 있다 - 서블릿과 JSP
			// 전통적인 방식 - A a = new A() - 이른 인스턴스화, 위치:선언부(멤버); ApplicationContext, Annotation~ApplicationContext [스프링컨테이너]
			// A a = null; 선언부 a = new A(); 생성부 -> 게으른 인스턴스화 비유
			if(sqlSessionFactory == null) { // null일때만 객체주입을 새로 받는다 -> 조건에 따라 객체 생성 -> 관리하기
				// 생성자 뒤에 메소드가 호출됨
				// 왜? @ComponentScan 없음, 객체관리도 직접 해야함, xml 문서에 적힌 문자열을 Read해야함
				// 두 번째 파라미터는 id이다.
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader, "development");
			}
			logger.info("after sqlSessionFactory : " + sqlSessionFactory);
		} catch (Exception e) {
			logger.info("[[ Exception ]] " + e.toString());
		}
	}// end of init
	// getter
	public static SqlSessionFactory getSqlSessionFactory() {
		init();
		return sqlSessionFactory;
	}

}
