package com.mannajob.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mannajob.domain.Criteria;
import com.mannajob.domain.MatchVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@Log4j
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MatchMapperTest {
	@Setter(onMethod_=@Autowired)
	private MatchMapper mapper;
	
	public void insert() {
		MatchVO matchVO = new MatchVO();
		matchVO.setB_num(35);
		matchVO.setM_id("t3");
		matchVO.setMat_stdate("2020-11-30");
		matchVO.setMat_hour("15:00");
		mapper.insert(matchVO);
	}
	
//	@Test
	public void updateTime() {
		MatchVO matchVO = new MatchVO();
		matchVO.setB_num(35);
		matchVO.setM_id("lion");
		matchVO.setMat_stdate("2020-11-30");
		matchVO.setMat_hour("16:00");
		mapper.updateTime(matchVO);
	}
	
	public void reject() {
		mapper.reject(36);
	}
	
//	@Test
	public void rejectother() {
		mapper.rejectother(35, "lion");
	}
	
	public void finish() {
		mapper.finish(32);
	}
	
	public void cancel() {
		mapper.cancel(32);
	}
//	@Test
	public void checkWrite() {
		log.info(mapper.checkWrite(35, "t3"));
	}
//	@Test
	public void checkmat_num() {
		log.info(mapper.checkmat_num(35, "t3"));
	}
	
	public void getbMatchMatlist() {
		mapper.getbMatchMatlist(35).forEach(list -> log.info(list));
	}

	public void getMatlistPaging() {
		mapper.getMatlistPaging(35, new Criteria(1, 5)).forEach(list -> log.info(list));
	}
//	@Test	
	public void getTotalCountItem() {
		log.info(mapper.getTotalCountItem(35));
	}
//	@Test
	public void getListMatch() {
		log.info(mapper.getListMatch("tiger", "2020-11"));
	}
//	@Test
	public void getListBMatch() {
		log.info(mapper.getListBMatch("tiger", "2020-11"));
	}
	@Test
	public void getDailycount() {
		log.info(mapper.getDailycount(-2));
	}
}
