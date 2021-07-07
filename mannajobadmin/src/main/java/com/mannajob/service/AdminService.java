package com.mannajob.service;

import java.util.List;

import com.mannajob.domain.Criteria;
import com.mannajob.domain.EmplFileVO;
import com.mannajob.domain.EmplVO;
import com.mannajob.domain.MemberVO;
import com.mannajob.domain.SearchVO;

public interface AdminService {

	public List<MemberVO> getMemListWithPaging(Criteria cri, SearchVO search);
	
	public int getTotal(Criteria cri, SearchVO search);
	
	public void resetPasswd(String m_id);
	
	public List<EmplVO> getEmplListWithPaging(Criteria cri, SearchVO search);
	
	public void emplOk(int e_num);
	
	public int getemplTotal(SearchVO search);
	
	public EmplFileVO emplApply(int e_num);

	public String emplImage(int e_num);
}
