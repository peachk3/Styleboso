package com.itwillbs.service;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.UsersVO;
import com.itwillbs.persistence.UsersDAO;

@Service
public class UsersServiceImpl implements UsersService{

	private static final Logger logger = LoggerFactory.getLogger(UsersServiceImpl.class);
	
	@Inject
	private UsersDAO udao;

	
	

	
	
	
}
