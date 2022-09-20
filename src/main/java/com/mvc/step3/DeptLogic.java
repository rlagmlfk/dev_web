package com.mvc.step3;

import java.util.Map;

import org.apache.log4j.Logger;

// 클래스 사이에 의존관계가 있다는 말에 나는 설명할 수 있나?
public class DeptLogic {
	Logger logger = Logger.getLogger(DeptLogic.class);
	private DeptDao deptDao = new DeptDao();
	public int deptInsert(Map<String, Object> pMap) {
		logger.info("deptInsert 호출");
		int result = 0;
		result = deptDao.deptInsert(pMap);
		return result;
	}

}
