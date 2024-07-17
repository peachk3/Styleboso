package com.itwillbs.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.WarehouseCodeVO;

@Service
public interface BasicInfoService {

	List<WarehouseCodeVO> listAll();

}