package com.itwillbs.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.persistence.SystemDAO;

@Service
public class SystemServiceImpl implements SystemService{
	
	@Inject
	private SystemDAO sdao;





}