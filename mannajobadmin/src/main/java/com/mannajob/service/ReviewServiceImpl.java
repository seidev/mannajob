package com.mannajob.service;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mannajob.mapper.ReviewMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ReviewServiceImpl implements ReviewService {
	@Setter(onMethod_ = @Autowired)
	private ReviewMapper mapper;

	@Override
	public void insertR(@Param("mat_num") int mat_num, @Param("r_good") String r_good, @Param("r_contents") String r_contents, @Param("r_w_m_id") String r_w_m_id, @Param("r_mat_m_id") String r_mat_m_id) {
		mapper.insertR(mat_num, r_good, r_contents, r_w_m_id, r_mat_m_id);
	}

	@Override
	public void updateR(@Param("r_num") int r_num, @Param("r_good") String r_good, @Param("r_contents") String r_contents) {
		mapper.updateR(r_num, r_good, r_contents);
	}

	@Override
	public void deleteR(int r_num) {
		mapper.deleteR(r_num);
	}

	@Override
	public String searchId(int r_num) {
		return mapper.searchId(r_num);
	}
}
