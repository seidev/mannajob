package com.mannajob.service;

import java.util.List;

import com.mannajob.domain.BMatchVO;
import com.mannajob.domain.Criteria;
import com.mannajob.domain.CriteriaProfile;
import com.mannajob.domain.EmplVO;

public interface BMatchService {

	public List<BMatchVO> getList(BMatchVO bMatchVO);
	
	public List<BMatchVO> getListWithPaging(Criteria cri,BMatchVO bMatchVO);
	
	public List<BMatchVO> search(BMatchVO bMatchVO);
	
	public List<BMatchVO> searchWithPaging(BMatchVO bMatchVO ,Criteria cri);
	
	public BMatchVO read(int b_num);
	
	public void update(BMatchVO bMatchVO);
	
	public void delete(int b_num);
	
	public int getTotalCount(Criteria cri,BMatchVO bMatchVO);
	
	public void insert(BMatchVO bMatchVO);
	
	public boolean StateChange(int b_num, int state);
	
	public List<EmplVO> searchEmpl(BMatchVO bMatchVO);
	
	public int getEmplCount(BMatchVO bMatchVO);
	
	public List<EmplVO> searchEmplPaging(CriteriaProfile cri, BMatchVO bMatchVO);
	
	public void cancel(int b_num);
	
	public int getPersonTotalCount(String m_id);
	
	public int getDailycount(int daygap);
	
	public List<BMatchVO> rankCorp();
	public List<BMatchVO> rankLocation();
	public List<BMatchVO> rankTask();

}
