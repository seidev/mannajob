package com.mannajob.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mannajob.domain.BMatchVO;
import com.mannajob.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@Log4j
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BMatchMapperTest {
	@Setter(onMethod_= @Autowired)
	public BMatchMapper mapper;
//	@Test
	public void getListTest() {
		mapper.getList("A").forEach(list -> log.info(list));
	};
//	@Test
	public void getListWithPagingTest() {
		Criteria cri = new Criteria(1,1);
		mapper.getListWithPaging(cri,"A").forEach(list->log.info(list));
	};
//	@Test	
	public void insertTest() {
		BMatchVO bMatchVO = new BMatchVO();
		bMatchVO.setB_category("B");
		bMatchVO.setM_id("cat");
		bMatchVO.setB_corp("삼성전자");
		bMatchVO.setB_task("IT/통신");
		bMatchVO.setB_price(10000);
		bMatchVO.setB_location("충북 천안시 서북구");
		bMatchVO.setB_stdate("2020-11-01");
		bMatchVO.setB_endate("2020-11-30");
		bMatchVO.setB_period("2");
		bMatchVO.setB_subject("삼성전자 멘토 구합니다.");
		bMatchVO.setB_contents("안녕하세요 혹시 삼성전자에 일하시는 분 계신가요?");
		mapper.insert(bMatchVO);
	};
	
//	@Test
	public void readTest() {
		mapper.read(5);
	};
//	@Test
	public void deleteTest() {
		mapper.delete(3);
	};
//	@Test
	public void updateTest() {
		BMatchVO bMatchVO = new BMatchVO();
		bMatchVO.setB_corp("삼성전자");
		bMatchVO.setB_task("IT/통신");
		bMatchVO.setB_price(10000);
		bMatchVO.setB_location("충북 천안시 서북구");
		bMatchVO.setB_stdate("2020-11-01");
		bMatchVO.setB_endate("2020-11-30");
		bMatchVO.setB_period("2");
		bMatchVO.setB_subject("삼성전자 멘토 구합니다.");
		bMatchVO.setB_contents("안녕하세요 혹시 삼성전자에 일하시는 분 계신가요?");
		mapper.update(bMatchVO);
	};
	
	@Test
	public void getTotalCountTest() {
		Criteria cri = new Criteria(1,1);
		BMatchVO bMatchVO = new BMatchVO();
		bMatchVO.setB_corp("");
		bMatchVO.setB_task("");
		bMatchVO.setB_price(10000);
		bMatchVO.setB_location("");
		bMatchVO.setB_stdate("");
		bMatchVO.setB_endate("2020-11-30");
		bMatchVO.setB_period("2");
		bMatchVO.setB_subject("삼성전자 멘토 구합니다.");
		bMatchVO.setB_contents("안녕하세요 혹시 삼성전자에 일하시는 분 계신가요?");
		bMatchVO.setB_category("A");
		log.info(mapper.getTotalCount(cri,bMatchVO));
	};
//	@Test
	public void stateFinishTest() {
		mapper.stateFinish(4);
	};
//	@Test
	public void stateCancelTest() {
		mapper.stateCancel(5);
	};
	
//	@Test
	public void searchTest() {
		BMatchVO bMatchVO = new BMatchVO();
//		bMatchVO.setB_corp("삼성전자");
		bMatchVO.setB_corp("");
		bMatchVO.setB_task("");
		bMatchVO.setB_location("");
		mapper.search(bMatchVO).forEach(list-> log.info(list));
	}
//	@Test
	public void searchWithPaging() {
		BMatchVO bMatchVO = new BMatchVO();
//		bMatchVO.setB_corp("삼성전자");
		bMatchVO.setB_corp("");
		bMatchVO.setB_task("");
		bMatchVO.setB_location("");
		bMatchVO.setB_category("");
		mapper.searchWithPaging(bMatchVO, new Criteria(1, 10));
	}

}
