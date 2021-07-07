package com.mannajob.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mannajob.domain.EmplVO;
import com.mannajob.domain.MemberVO;
import com.mannajob.domain.ReviewVO;
import com.mannajob.mapper.ProfileMapper;
import com.mannajob.util.FileUtils;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ProfileServiceImpl implements ProfileService {

	@Setter(onMethod_ = @Autowired)
	private ProfileMapper mapper;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Override
	public MemberVO getMemProfile(String m_id) {
		return mapper.getMemProfile(m_id);
	}
	
	@Override
	public void updateProfile(MemberVO member) {
		mapper.updateProfile(member);
	}
	
	public List<MemberVO> searchMReview(String m_id) {
		return mapper.searchMReview(m_id);
	}

	@Override
	public void deleteMem(String m_id) {
		mapper.deleteMem(m_id);
	}
	
	@Override
	public EmplVO getEmplProfile(String m_id) {
		return mapper.getEmplProfile(m_id);
	}
	
	@Override
	public EmplVO getEmplProfile2(String m_id) {
		return mapper.getEmplProfile2(m_id);
	}
	
	@Transactional
	@Override
	public void EmplJoin(EmplVO empl, MultipartHttpServletRequest mpRequest) throws Exception {
		mapper.EmplJoin(empl);
		empl = mapper.getEmplProfile(empl.getM_id());
		log.info("empl:....................................." + empl.toString());
		List<Map<String, Object>>list = fileUtils.parseInsertFileInfo(empl, mpRequest);
		int size = list.size();
		for(int i = 0; i < size; i ++) {
			mapper.insertFile(list.get(i));
		}
	}
	
	@Override
	public void insertFile(Map<String, Object> map) throws Exception {
		mapper.EmplJoin("EmplMapper.insertFile", map);
	}



	@Override
	public List<ReviewVO> searchReview(String m_id) {
		return mapper.searchReview(m_id);
	}

	@Override
	public void updateEmpl(EmplVO empl, MultipartHttpServletRequest mpRequest) throws Exception {
		mapper.updateEmpl(empl);
		empl = mapper.getEmplProfile2(empl.getM_id());
		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(empl, mpRequest);
		int size = list.size();
		for(int i = 0; i < size; i ++) {
			mapper.updateFile(list.get(i));
		}
	}

	@Override
	public void updateFile(Map<String, Object> map) throws Exception {
		mapper.updateEmpl("EmplMapper.updateFile", map);
	}

	@Override
	public void deleteEmpl(String m_id) {
		mapper.deleteEmpl(m_id);
	}

	@Override
	public boolean cheakEmpl(String m_id) {
		return mapper.checkEmpl(m_id)==1;
	}
	
	@Override
	public int countG(String m_id) {
		return mapper.countG(m_id);
	}

	@Override
	public int totalMat(String m_id) {
		return mapper.totalMat(m_id);
	}
	
}
