package com.mannajob.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mannajob.domain.BMatchVO;
import com.mannajob.domain.BestVO;

public interface MainMapper {
	public List<BMatchVO> searchEmplMat(@Param("m_id") String m_id);
	
	public int totalMat(@Param("m_id") String m_id);
	
	public List<BestVO> bestMento();
	
}
