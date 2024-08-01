package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.CodeVO;
import com.itwillbs.domain.ItemCodeVO;
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


	// 그룹 코드에 따라 품목 정보를 출력
	@Override
	public List<ItemCodeVO> itemCodeListAll(String group_code) throws Exception {
		logger.debug("itemCodeListAll(String group_code) 실행 ");
		
		return sdao.itemCodeListAll(group_code);
	}

	//공통 품목 코드 수정(update)

	@Override
	public void updateItemCode(ItemCodeVO icVo) throws Exception {
		logger.debug("공통 품목코드 수정 ");
		
		sdao.updateItemCode(icVo);
		
	}

	//공통 품목코드 삭제
	@Override
	public void deleteItemCode(List<String> itemCodes) throws Exception {
		logger.debug("공통 품목코드 삭제");
		
		sdao.deleteItemCode(itemCodes);
	}

	//공통 품목코드 등록
	@Override
	public void saveItemCode(ItemCodeVO icVo) throws Exception {
		logger.debug("공통 품목코드 등록");
		
		sdao.saveItemCode(icVo);
	}
	
	//공통 품목 중복체크&유효성
	@Override
	public boolean checkItemCode(String s_cate_item_code) throws Exception {
		
		ItemCodeVO icVo = sdao.getItemCodeAndCheck(s_cate_item_code);
		logger.debug("service : 공통 품목 중복체크 & 유효성");
		return icVo != null;
	}




	
	
	  
}
	

	





