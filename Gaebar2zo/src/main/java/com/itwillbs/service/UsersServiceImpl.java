package com.itwillbs.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.UsersVO;
import com.itwillbs.persistence.UsersDAO;

@Service
public class UsersServiceImpl implements UsersService{

	@Inject
	private UsersDAO udao;


	
	
	
}
