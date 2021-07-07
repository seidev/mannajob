package com.mannajob.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mannajob.domain.Criteria;
import com.mannajob.domain.EmplFileVO;
import com.mannajob.domain.EmplVO;
import com.mannajob.domain.MemberVO;
import com.mannajob.domain.SearchVO;
import com.mannajob.mapper.AdminMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class AdminServiceImpl implements AdminService {
	@Setter(onMethod_ = @Autowired)
	private AdminMapper mapper;
	
	@Override
	public List<MemberVO> getMemListWithPaging(Criteria cri, SearchVO search) {
		if(search.getSearchType()==null||"".equals(search.getSearchType())){
			search.setSearchType("All");
			
		}
		if(search.getKeyword()==null||"".equals(search.getKeyword())){
			search.setKeyword("");
		}
		return mapper.getMemListWithPaging(cri, search);
	}

	@Override
	public int getTotal(Criteria cri, SearchVO search) {
		return mapper.getTotalCount(cri, search);
	}

	@Override
	public void resetPasswd(String m_id) {
		mapper.resetPasswd(m_id);
	}

	@Override
	public List<EmplVO> getEmplListWithPaging(Criteria cri, SearchVO search) {
		if(search.getSearchType()==null||"".equals(search.getSearchType())){
			search.setSearchType("All");
		}
		if(search.getKeyword()==null||"".equals(search.getKeyword())){
			search.setKeyword("");
		}
		return mapper.getEmplListWithPaging(cri, search);
	}

	@Override
	public void emplOk(int e_num) {
		mapper.emplOk(e_num);
	}

	@Override
	public int getemplTotal(SearchVO search) {
		return mapper.getemplTotalCount(search);
	}

	@Override
	public EmplFileVO emplApply(int e_num) {
		return mapper.emplApply(e_num);
	}

	@Override
	public String emplImage(int e_num) {
		return mapper.emplImage(e_num);
	}

}
