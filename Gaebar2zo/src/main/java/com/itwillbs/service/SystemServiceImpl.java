package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.CodeVO;
import com.itwillbs.domain.UsersVO;
import com.itwillbs.persistence.SystemDAO;

@Service
public class SystemServiceImpl implements SystemService{

	private static final Logger logger = LoggerFactory.getLogger(SystemServiceImpl.class);
	
	@Inject
	private SystemDAO sdao;

	
	//이메일 중복 체크
	@Override
	public int emailCheck(String user_email) throws Exception {

		 int result = sdao.emailCheck(user_email);
		logger.info("result " + result);
		
		return result;
	}



	//운영자,관리자,사원 전체 리스트 출력
	@Override
	public List<UsersVO> employeeListAll() throws Exception {
		logger.info("운영자/관리자/사원 전체 리스트 출력");
	
		return sdao.employeeListAll();
	}

	//공통코드 전체 리스트 출력
	@Override
	public List<CodeVO> codeListAll() throws Exception {
		logger.info("공통 코드Code ");
	
		return sdao.codeListAll();
	}
	
	
	
	





}