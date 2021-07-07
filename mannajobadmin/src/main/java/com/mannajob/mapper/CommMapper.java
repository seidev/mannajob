package com.mannajob.mapper;

import java.util.List;

import com.mannajob.domain.CommVO;

public interface CommMapper {
	public List<CommVO> getList(int b_num);
	
	public List<CommVO> readComm(int b_num);
	
	public List<CommVO> readCommSub(int b_num);
	
	public void insert(CommVO comm);
	
	public void insertSub(CommVO comm);
	
	public int update(CommVO comm);
	
	public int updateSub(CommVO comm);

	public int delete(int cm_num);
	
	public int deleteSub(int cms_num);
	
	public int chkComm(int b_num);
	
	public int chkCommSub(int b_num);	
}
