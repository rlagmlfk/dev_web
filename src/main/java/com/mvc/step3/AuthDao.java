package com.mvc.step3;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;

import com.util.MyBatisCommonFactory;
import com.vo.MemberVO;

public class AuthDao {
	Logger logger = Logger.getLogger(AuthDao.class);
	SqlSessionFactory sqlSessionFactory = null;
	// 쿼리문 요청과 커밋 그리고 롤백 처리
	SqlSession sqlSession = null;	
	public AuthDao() {
		sqlSessionFactory = MyBatisCommonFactory.getSqlSessionFactory();
	}
	public MemberVO login(Map<String, Object> pMap) {
		logger.info("login 호출 성공"+pMap);
		MemberVO mVO = null;
		try {
			sqlSession = sqlSessionFactory.openSession();
			mVO = sqlSession.selectOne("login", pMap); //selectOne은 Object 1개 row만 담음
			// insert here
			logger.info(mVO.getMem_name());
		} catch (Exception e) {
			logger.info("Exception : "+e.toString());
		} finally {
			sqlSession.close();
		}
		return mVO;
	}

}
