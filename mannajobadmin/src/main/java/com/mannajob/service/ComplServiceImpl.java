package com.mannajob.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mannajob.domain.ComplVO;
import com.mannajob.domain.Criteria;
import com.mannajob.domain.SearchVO;
import com.mannajob.mapper.ComplMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class ComplServiceImpl implements ComplService{
	private ComplMapper mapper;
//  신고 추가
	@Override
	public void insert(ComplVO complVO) {
		mapper.insert(complVO);
	}
// 현직자, 취준생을 기준으로 전체 조회 페이징
	@Override
	public List<ComplVO> getListWithPaging(Criteria cri, String b_category) {
		return mapper.getListWithPaging(cri, b_category);
	}
//  신고 대상자아이디를 통해 신고 사항 확인
	@Override
	public List<ComplVO> getItem(String m_id) {
		return mapper.getItem(m_id);
	}
	// c_num을 통해 신고 사유 변경
	@Override
	public void update(ComplVO complVO) {
		mapper.update(complVO);
	}

	// 신고 번호로 상태 변경(A가 기본, B가 완료, C가 취소)
	@Override
	public void StateChange(ComplVO complVO) {
		mapper.StateChange(complVO);
	}
	// 신고대상의 아이디를 기준으로 정보 가져오기
	@Override
	public int getTotalB(String b_category) {
		// TODO Auto-generated method stub
		return 0;
	}
	

	@Override
	public List<ComplVO> getComplListWithPaging(Criteria cri, SearchVO search) {
		// TODO Auto-generated method stub
		if(search.getSearchType()==null||"".equals(search.getSearchType())){
			search.setSearchType("All");
			
		}
		if(search.getKeyword()==null||"".equals(search.getKeyword())){
			search.setKeyword("");
		}
		return mapper.getComplListWithPaging(cri, search);
	}
	@Override
	public int getTotal(Criteria cri, SearchVO search) {
		return mapper.getTotalCount(cri, search);
	}
	
	@Override
	public void stopdate(String m_id) {
		// TODO Auto-generated method stub
		mapper.stopdate(m_id);
	}
	@Override
	public void changestate(int c_num, String c_state) {
		// TODO Auto-generated method stub
		mapper.changestate(c_num, c_state);
	}

	
	

}
