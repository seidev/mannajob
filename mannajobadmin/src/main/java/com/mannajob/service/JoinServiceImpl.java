package com.mannajob.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.mannajob.domain.MemberVO;
import com.mannajob.mapper.JoinMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class JoinServiceImpl implements JoinService {
	@Setter(onMethod_ = @Autowired)
	private JoinMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;
	
	@Override
	public void MemJoin(MemberVO member) {
		MemberVO mem = new MemberVO();
		mem.setM_id(member.getM_id());
		mem.setM_passwd(pwencoder.encode(member.getM_passwd()));
		mem.setM_name(member.getM_name());
		mem.setM_phone(member.getM_phone());
		mem.setM_email(member.getM_email());
		mapper.MemJoin(mem);
	}

	@Override
	public void ApiJoin(MemberVO member) {
		MemberVO mem = new MemberVO();
		mem.setM_id(member.getM_id());
		mem.setM_name(member.getM_name());
		mem.setM_api(member.getM_api());
		mem.setM_passwd(pwencoder.encode(member.getM_passwd()));
		mem.setM_phone(member.getM_phone());
		mem.setM_email(member.getM_email());
		mapper.ApiJoin(mem);
	}
}
