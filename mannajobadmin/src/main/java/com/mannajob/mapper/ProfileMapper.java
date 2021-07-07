package com.mannajob.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.mannajob.domain.EmplVO;
import com.mannajob.domain.MemberVO;
import com.mannajob.domain.ReviewVO;

public interface ProfileMapper {
	
	public MemberVO getMemProfile(String m_id);
	
	public void updateProfile(MemberVO member);
	
	public List<MemberVO> searchMReview(String m_id);
	
	public void deleteMem(String m_id);

	public EmplVO getEmplProfile(String m_id);

	public EmplVO getEmplProfile2(String m_id);

	public void EmplJoin(EmplVO empl);
	
	public void EmplJoin(String string, Map<String, Object> map);

	public void insertFile(Map<String, Object> map) throws Exception;

	public int checkEmpl(String m_id);
	
	
	public List<ReviewVO> searchReview(String m_id);
	
	public void updateEmpl(EmplVO empl);
	
	public void updateEmpl(String string, Map<String, Object> map);

	public void updateFile(Map<String, Object> map) throws Exception;
	
	public void deleteEmpl(String m_id);
	
	public int countG(@Param("m_id") String m_id);
	
	public int totalMat(@Param("m_id") String m_id);
}
