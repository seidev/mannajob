package com.mannajob.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mannajob.domain.EmplVO;
import com.mannajob.domain.MemberVO;
import com.mannajob.domain.ReviewVO;

public interface ProfileService {
	
	public MemberVO getMemProfile(String m_id);
	
	public void updateProfile(MemberVO member);
	
	public List<MemberVO> searchMReview(String m_id);
	
	public void deleteMem(String m_id);
	
	public EmplVO getEmplProfile(String m_id);

	public EmplVO getEmplProfile2(String m_id);

	public void EmplJoin(EmplVO empl, MultipartHttpServletRequest mpRequest) throws Exception;
	
	public void insertFile(Map<String, Object> map) throws Exception;
	
	public boolean cheakEmpl(String m_id);
	
	public List<ReviewVO> searchReview(String m_id);
	
	public void updateEmpl(EmplVO empl, MultipartHttpServletRequest mpRequest) throws Exception;

	public void updateFile(Map<String, Object> map) throws Exception;
	
	public void deleteEmpl(String m_id);
	
	public int countG(String m_id);
	
	public int totalMat(String m_id);

}
