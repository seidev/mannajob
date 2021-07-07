package com.mannajob.service;

import java.util.List;

import com.mannajob.domain.ComplVO;
import com.mannajob.domain.Criteria;
import com.mannajob.domain.SearchVO;

public interface ComplService {
	
	public void insert(ComplVO complVO);
	
	public List<ComplVO> getListWithPaging(Criteria cri, String b_category);
	
	public List<ComplVO> getItem(String m_id);
	
	public void update(ComplVO complVO);
	
	
	public void StateChange(ComplVO complVO);
	
	public int getTotalB(String b_category);		
	
	public List<ComplVO> getComplListWithPaging(Criteria cri, SearchVO search);
	
	public int getTotal(Criteria cri, SearchVO search);
	
	public void stopdate (String m_id);
	
	public void changestate(int c_num, String c_state);
	
	 
}
