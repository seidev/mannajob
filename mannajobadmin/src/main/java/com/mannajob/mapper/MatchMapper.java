package com.mannajob.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mannajob.domain.BMatchReviewVO;
import com.mannajob.domain.BMatchVO;
import com.mannajob.domain.Criteria;
import com.mannajob.domain.CriteriaProfile;
import com.mannajob.domain.MatchVO;
import com.mannajob.domain.MyScheduleVO;

public interface MatchMapper {
	
// 아직 매퍼xml을 만들지 않았으므로 사용에 주의
	public List<MatchVO> getList(BMatchVO bmatchVO);
//	
	public List<MatchVO> getListWithPaging(@Param("cri") Criteria cri, @Param("bmatchVO") BMatchVO bmatchVO);
//	
	public MatchVO getItem(BMatchVO bmatchVO);
//	
	public void delete(BMatchVO bmatchVO);
//		
	public void update(@Param("b_num")int b_num, @Param("matchVO") MatchVO matchVO);
//	
//	public int getTotal(BMatchVO bmatchVO);
//	
	public List<MatchVO> searchBmatMat(int b_num);
	
	public List<BMatchReviewVO> searchMat(@Param("m_id") String m_id, @Param("scri")CriteriaProfile scri);
	
	public List<BMatchVO> searchWMat(@Param("m_id")String m_id,  @Param("cri")Criteria cri);
	
	public List<BMatchVO> searchBMat(String m_id);
	
	public void insert(MatchVO matchVO);
	
	public void updateTime(MatchVO matchVO);
	
	public void reject(int mat_num);
	
	public void rejectother(@Param("b_num") int b_num, @Param("m_id") String m_id);
	
	public void finish(int mat_num);
	
	public void cancel(int mat_num);
	
	public int checkmat_num(@Param("b_num") int b_num, @Param("m_id") String m_id);
	
	public int checkWrite(@Param("b_num") int b_num, @Param("m_id") String m_id);
	
	public MatchVO findfinalMat(int b_num);
	
	public List<MatchVO> getbMatchMatlist(int b_num);
	
	public List<MatchVO> getMatlistPaging(@Param("b_num") int b_num, @Param("cri") Criteria cri);
	
	public int getTotalCountItem(int b_num);
	
	public int matchfinalCount(int b_num);
	
	public int getPersionTotalCount(String m_id);
	
	// 일정관리
	public List<MyScheduleVO> getListBMatch(@Param("m_id")String m_id,@Param("yearmonth") String yearmonth);
	public List<MyScheduleVO> getListMatch(@Param("m_id")String m_id,@Param("yearmonth") String yearmonth);
	
	
	public int getDailycount(int daygap);
}
