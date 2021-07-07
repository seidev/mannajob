package com.mannajob.mapper;

import org.apache.ibatis.annotations.Param;

public interface ReviewMapper {
	public void insertR(@Param("mat_num") int mat_num, @Param("r_good") String r_good, @Param("r_contents") String r_contents, @Param("r_w_m_id") String r_w_m_id, @Param("r_mat_m_id") String r_mat_m_id);

	public void updateR(@Param("r_num") int r_num, @Param("r_good") String r_good, @Param("r_contents") String r_contents);
	
	public void deleteR(@Param("r_num") int r_num);
	
	public String searchId(int r_num);
}
