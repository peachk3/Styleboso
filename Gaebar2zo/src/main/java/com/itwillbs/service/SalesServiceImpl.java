package com.itwillbs.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.persistence.SalesDAO;

@Service
public class SalesServiceImpl {
	@Inject
	private SalesDAO sdao;
	
	
	
}
