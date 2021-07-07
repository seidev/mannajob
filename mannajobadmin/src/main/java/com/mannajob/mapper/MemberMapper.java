package com.mannajob.mapper;

import com.mannajob.domain.MemberVO;

public interface MemberMapper {

	public int LoginSelect(MemberVO member);
	
	public MemberVO SecretLogin(MemberVO member);

}
