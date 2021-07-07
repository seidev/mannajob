package com.mannajob.service;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mannajob.domain.Criteria;
import com.mannajob.domain.NoticeVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class NoticeServiceTest {
	@Setter(onMethod_ = @Autowired)
	private NoticeService service;
	
	public void testService() {
		log.info("Service............" + service);
	}
	
	public void testGetList2() {
		log.info("getList............");
		service.getList().forEach(notice -> log.info(notice));
	}
	
	public void testGetList() {
		log.info("getListWithPaging............");
		service.getList(new Criteria(1,5)).forEach(notice -> log.info(notice));
	}
	
	public void testInsert() {
		log.info("insert............");
		NoticeVO notice = new NoticeVO();
		notice.setN_subject("공지사항 14:00");
		notice.setN_contents("공지사항");
		notice.setAd_id("admin");
		service.insert(notice);
		log.info(notice);
	}
	
	public void testRead() {
		log.info("read............");
		boolean result = service.readUpCount(4);
		log.info("result >>> " + result);
		NoticeVO notice = service.read(4);
		log.info(notice);
	}
	
	public void testUpdate() {
		log.info("update............");
		NoticeVO notice = new NoticeVO();
		notice.setN_subject("공지사항 14:03");
		notice.setN_contents("공지사항2");
		notice.setN_num(4);
		boolean result = service.update(notice);
		log.info("result >>> " + result);
	}
	
	public void testDelete() {
		log.info("delete............");
		boolean result = service.delete(7);
		log.info("result >>> " + result);
	}
}
