package com.mannajob.service;

import java.util.List;

import com.mannajob.domain.BMatchReviewVO;
import com.mannajob.domain.BMatchVO;
import com.mannajob.domain.Criteria;
import com.mannajob.domain.CriteriaProfile;
import com.mannajob.domain.MatchVO;
import com.mannajob.domain.MyScheduleVO;

public interface MatchService {
	
	public List<MatchVO> searchBmatMat(int b_num);
	
	public List<BMatchReviewVO> searchMat(String m_id, CriteriaProfile scri);
	
	public List<BMatchVO> searchBMat(String m_id);
	
	public List<BMatchVO> searchWMat(String m_id, Criteria cri);
	
	public boolean insert(MatchVO matchVO);
	
	public void updateTime(MatchVO matchVO);
	
	public void reject(MatchVO matchVO);
	
	public void finish(MatchVO matchVO);
	
	public void cancel(MatchVO matchVO);
	
	public int checkMatNum(MatchVO matchVO);
	
	public int checkWrite(MatchVO matchVO);
	
	public MatchVO findfinalMat(int b_num);
	
	public List<MatchVO> getbMatchMatlist(int b_num);
	
	public List<MatchVO> getMatlistPaging(int b_num, Criteria cri);
	
	public int getCount(int b_num);
	
	public boolean matchfinalCount(int b_num);
	
	public int getPersionTotalCount(String m_id);
	
	public List<MyScheduleVO> getListBMatch(String m_id,String yearmonth);
	public List<MyScheduleVO> getListMatch(String m_id,String yearmonth);
	
	public int getDailycount(int daygap);
}
