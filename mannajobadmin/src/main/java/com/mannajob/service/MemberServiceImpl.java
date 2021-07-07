package com.mannajob.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.mannajob.domain.MemberVO;
import com.mannajob.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;
	
	@Override
	public boolean LoginSelect(MemberVO member) {
		return mapper.LoginSelect(member) == 1;	 //�α��� ���� �� true ����
	}

	@Override
	public boolean SecretLogin(MemberVO member) {
		if(pwencoder.matches(member.getM_passwd(), mapper.SecretLogin(member).getM_passwd())) {
			return true;
		} else {
			return false;
		}
	}

}
