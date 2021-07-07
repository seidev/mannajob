package com.mannajob.service;

import java.util.List;

import com.mannajob.domain.CommVO;

public interface CommService {
	public List<CommVO> getList(int b_num);
	
	public List<CommVO> readComm(int b_num);
	
	public List<CommVO> readCommSub(int b_num);
	
	public void insert(CommVO comm);
	
	public void insertSub(CommVO comm);
	
	public boolean update(CommVO comm);
	
	public boolean updateSub(CommVO comm);

	public boolean delete(int cm_num);
	
	public boolean deleteSub(int cms_num);
	
	public int chkComm(int b_num);
	
	public int chkCommSub(int b_num);
}
