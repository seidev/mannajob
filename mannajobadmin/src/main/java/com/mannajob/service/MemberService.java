package com.mannajob.service;

import com.mannajob.domain.MemberVO;

public interface MemberService {

	public boolean LoginSelect(MemberVO member);
	
	public boolean SecretLogin(MemberVO member);

}
