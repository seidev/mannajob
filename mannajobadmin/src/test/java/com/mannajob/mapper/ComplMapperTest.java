package com.mannajob.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mannajob.domain.ComplVO;
import com.mannajob.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@Log4j
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ComplMapperTest {
	@Setter(onMethod_=@Autowired)
	private ComplMapper mapper;
//	@Test
	public void insertTest() {
		ComplVO complVO = new ComplVO();
		complVO.setC_category("B");
		complVO.setC_why("게시글과 상관없는 내용 도배");
		complVO.setM_id("haha");
		complVO.setBoard_num(31);
		mapper.insert(complVO);
	}
//	@Test
	public void getListWithPagingTest() {
		Criteria cri = new Criteria();
		mapper.getListWithPaging(cri, "B").forEach(list->log.info(list));
	}
    //@Test
	public void getItemTest() {
		log.info(mapper.getItem("haha"));
	}
	
	public void updateTest() {
		ComplVO complVO = new ComplVO();
		complVO.setC_num(3);
		complVO.setC_category("B");
		complVO.setC_why("게시글과 상관없는 내용 도배");
		complVO.setM_id("haha");
		mapper.update(complVO);
	}
	
//	@Test
	public void StateChangeTest() {
		ComplVO complVO = new ComplVO();
		complVO.setC_num(3);
		complVO.setC_state("C");
		mapper.StateChange(complVO);
		
	}
//	@Test
	public void getTotalBTest() {
		log.info(mapper.getTotalB("B"));
	}
//	@Test
//	public void getcomplTest() {
//		mapper.getList().forEach(compl -> log.info(compl));	
//	}
	  
}
