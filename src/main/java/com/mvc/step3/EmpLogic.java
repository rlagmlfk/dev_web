package com.mvc.step3;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;

public class EmpLogic {
	Logger logger = Logger.getLogger(EmpLogic.class);
	private DeptDao deptDao = new DeptDao();
	private EmpDao empDao = new EmpDao();

	// @Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={DataAccessException.class})
	//public int doEmp() { // 한번에 커밋
	public int cudEmp() { // 건건이 커밋
		logger.info("doEmp 호출");
		int empResult = 0;
		int deptResult = 0;
		Map<String, Object> emap = new HashMap<>();
		emap.put("empno", 9005);
		emap.put("ename", "김유신");
		emap.put("deptno", 89);
		Map<String, Object> dmap = new HashMap<>();
		dmap.put("deptno", 89);
		dmap.put("dname", "개발부");
		dmap.put("loc", "부산");
		deptResult = deptDao.deptInsert(dmap);
		empResult = empDao.empInsert(emap);
		if(deptResult == 1 && empResult == 1) {
			EmpDao.sqlSession.commit();
		}else {
			EmpDao.sqlSession.rollback();
		}
		return 0;
	}

}
