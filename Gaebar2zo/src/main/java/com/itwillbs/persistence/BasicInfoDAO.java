package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.ClientVO;
import com.itwillbs.domain.WarehouseCodeVO;

public interface BasicInfoDAO {

	List<WarehouseCodeVO> listAll();

	List<ClientVO> cliListAll();

}