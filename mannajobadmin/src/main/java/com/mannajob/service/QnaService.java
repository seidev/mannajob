package com.mannajob.service;

import java.util.List;

import com.mannajob.domain.Criteria;
import com.mannajob.domain.QnaVO;

public interface QnaService {
	public List<QnaVO> getList();
	
	public List<QnaVO> getList(Criteria cri);
	
	public void insert(QnaVO qna);
	
	public void insertSel(QnaVO qna);
	
	public void insertSub(QnaVO qna);
	
	public QnaVO read(int q_num);
	
	public boolean delete(int q_num);
	
	public boolean deleteSub(QnaVO qna);
	
	public boolean update(QnaVO qna);
	
	public boolean updateSub(QnaVO qna);
	
	public int getTotal(Criteria cri);
	
	public int chkQnaSub(int q_num);
}
