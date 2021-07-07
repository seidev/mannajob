package com.mannajob.service;

import java.util.List;

import com.mannajob.domain.BMatchVO;
import com.mannajob.domain.BestVO;

public interface MainService {
	public List<BMatchVO> searchEmplMat(String m_id);
	
	public int totalMat(String m_id);
	
	public List<BestVO> bestMento();

}
