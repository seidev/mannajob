package com.mannajob.service;

import java.util.List;

import com.mannajob.domain.Criteria;
import com.mannajob.domain.NoticeVO;

public interface NoticeService {
	public List<NoticeVO> getList();
	
	public List<NoticeVO> getList(Criteria cri);
	
	public void insert(NoticeVO notice);
	
	public void insertSel(NoticeVO notice);
	
	public NoticeVO read(int n_num);
	
	public boolean readUpCount(int n_num);
	
	public boolean delete(int n_num);
	
	public boolean update(NoticeVO notice);
	
	public int getTotal(Criteria cri);
	

}
