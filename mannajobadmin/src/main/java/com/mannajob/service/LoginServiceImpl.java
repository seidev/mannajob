package com.mannajob.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mannajob.mapper.LoginMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class LoginServiceImpl implements LoginService {
	@Setter(onMethod_ = @Autowired)
	private LoginMapper mapper;

	public int MemCheck(String m_id) {
		int check = mapper.MemCheck(m_id);
		return check;
	}

}
