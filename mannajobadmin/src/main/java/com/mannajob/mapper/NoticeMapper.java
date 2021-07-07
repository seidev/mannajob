package com.mannajob.mapper;

import java.util.List;

import com.mannajob.domain.Criteria;
import com.mannajob.domain.NoticeVO;

public interface NoticeMapper {
	public List<NoticeVO> getList();
	
	public List<NoticeVO> getListWithPaging(Criteria cri);
	
	public void insert(NoticeVO notice);
	
	public void insertSel(NoticeVO notice);
	
	public NoticeVO read(int n_num);
	
	public int readUpCount(int n_num);
	
	public int delete(int n_num);
	
	public int update(NoticeVO notice);
	
	public int getTotalCount(Criteria cri);
}
