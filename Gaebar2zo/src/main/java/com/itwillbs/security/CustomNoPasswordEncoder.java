package com.itwillbs.security;

import org.springframework.security.crypto.password.PasswordEncoder;

public class CustomNoPasswordEncoder implements PasswordEncoder{

	@Override
	public String encode(CharSequence rawPassword) {
		// 인코딩(암호화 작업 처리)
		System.out.println(" 임시 암호화 처리 ! ");
		
		
		return rawPassword.toString();
	}

	@Override
	public boolean matches(CharSequence rawPassword, String encodedPassword) {
		// 인코딩된(암호화된) 값을 비교하는 메서드
		System.out.println(" 암호화된 비밀번호 원본데이터와 비교 ! ");
		
		return rawPassword.toString().equals(encodedPassword);
	}

	// dsfsdee
	
	// 재커밋
	
	
	
}
