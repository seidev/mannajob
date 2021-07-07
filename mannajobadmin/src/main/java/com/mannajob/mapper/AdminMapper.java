package com.mannajob.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mannajob.domain.Criteria;
import com.mannajob.domain.EmplFileVO;
import com.mannajob.domain.EmplVO;
import com.mannajob.domain.MemberVO;
import com.mannajob.domain.SearchVO;

public interface AdminMapper {
	
	public List<MemberVO> getMemListWithPaging(@Param("cri") Criteria cri,@Param("search") SearchVO search);
	
	public int getTotalCount(@Param("cri") Criteria cri, @Param("search") SearchVO search);
	
	public void resetPasswd(String m_id);
	
	public List<EmplVO> getEmplListWithPaging(@Param("cri") Criteria cri,@Param("search") SearchVO search);

	public void emplOk(int e_num);

	public int getemplTotalCount(@Param("search") SearchVO search);
	
	public EmplFileVO emplApply(int e_num);

	public String emplImage(int e_num);
}
