package com.mannajob.service;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mannajob.domain.BMatchVO;
import com.mannajob.domain.BestVO;
import com.mannajob.mapper.MainMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MainServiceImpl implements MainService {
	@Setter(onMethod_ = @Autowired)
	private MainMapper mapper;
	
	@Override
	public List<BMatchVO> searchEmplMat(String m_id) {
		return mapper.searchEmplMat(m_id);
	}
	
	@Override
	public int totalMat(String m_id) {
		return mapper.totalMat(m_id);
	}

//	@Override
//	public List<BestVO> bestMento() {
//		List<BestVO> list = mapper.bestMento();
//		for (int i = 0; i < mapper.bestMento().size(); i++) {
//			String m_id = mapper.bestMento().get(i).getM_id();
//			int countM = mapper.totalMat(m_id);
//			list.get(i).setCountM(countM);
//		}
//		return list.subList(0, 5);
//	}
	
	/* BEST mento 리스트 정렬 */
	@Override
	public List<BestVO> bestMento() {
		List<BestVO> list = mapper.bestMento();
		for(int i = 0; i < mapper.bestMento().size(); i ++) {
			String m_id = mapper.bestMento().get(i).getM_id();
			int countM = mapper.totalMat(m_id);
			list.get(i).setCountM(countM);
		}
		
		Comparator<BestVO> listsort1 = new Comparator<BestVO>() {
			@Override
			public int compare(BestVO o1, BestVO o2) {
				int ret = 0;
				if(o2.getCountG() > o1.getCountG()) {
					ret = 1;
				}
				if(o2.getCountG() == o1.getCountG()) {
					if(o2.getCountM() > o1.getCountM()) {
						ret = 1;
					} else if (o2.getCountM() == o1.getCountM()) {
						ret = 0;
					} else if (o2.getCountM() < o1.getCountM()) {
						ret = -1;
					}
				}
				if(o2.getCountG() < o1.getCountG()) {
					ret = -1;
				}
				return ret;
			}
		};
		
		Collections.sort(list, listsort1);
		
		if(list.size() < 5) {
			list = list.subList(0, list.size());
		} else {
			list = list.subList(0, 5);
		};
		
		return list; 
	}

}
