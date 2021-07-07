package com.mannajob.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mannajob.domain.ComplVO;
import com.mannajob.domain.Criteria;
import com.mannajob.domain.SearchVO;

public interface ComplMapper {
	
	public void insert(ComplVO complVO);
	
	public List<ComplVO> getListWithPaging(@Param("cri") Criteria cri, @Param("b_category") String b_category);
	
	public List<ComplVO> getItem(String m_id);
	
	public void update(ComplVO complVO);
	
	public void StateChange(ComplVO complVO);
	
	public int getTotalB(String b_category);
	
	public List<ComplVO> getComplListWithPaging(@Param("cri")Criteria cri, @Param("search")SearchVO search);
	
	public int getTotalCount(@Param("cri") Criteria cri, @Param("search") SearchVO search);
	
	public void stopdate(String m_id);
	
	public void changestate(@Param("c_num") int c_num, @Param("c_state") String c_state);
	
	
}
