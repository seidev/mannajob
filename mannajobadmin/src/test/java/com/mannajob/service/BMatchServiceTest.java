package com.mannajob.service;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mannajob.domain.BMatchVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@Log4j
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BMatchServiceTest {
	@Setter(onMethod_=@Autowired)
	private BMatchService service;
	
//	@Test
	public void getListTest() {
		 BMatchVO bMatchVO = new BMatchVO();
		 bMatchVO.setB_category("A");
		service.getList(bMatchVO).forEach(list -> log.info(list));
	};
	
	public void getListWithPagingTest(){};
	
//	@Test
	public void searchTest(){
		BMatchVO bMatchVO = new BMatchVO();
		
		bMatchVO.setB_corp("전자");
		service.search(bMatchVO).forEach(list -> log.info(list));
	};
//	@Test
	public void searchWithPagingTest(){
		BMatchVO bMatchVO = new BMatchVO();
		
		bMatchVO.setB_corp("전자");
		service.search(bMatchVO).forEach(list -> log.info(list));
	};
	
	public void readTest(){};
	
	public void updateTest(){};
	
	public void deleteTest(){};
	
	public void getTotalCountTest(){};
	
	public void insertTest(){};
	
	public void StateChangeTest(){};
}
