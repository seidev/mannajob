package com.mannajob.mapper;

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
public class NoticeMapperTest {
	@Setter(onMethod_ = @Autowired)
	private NoticeMapper mapper;
	
	
	public void testGetList2() {
		mapper.getList().forEach(notice -> log.info(notice));
	}
	
	
	public void testGetList() {
		mapper.getListWithPaging(new Criteria(1,5)).forEach(notice -> log.info(notice));
	}
	
	public void testInsert() {
		NoticeVO notice = new NoticeVO();
		notice.setN_subject("공지사항 12:15");
		notice.setN_contents("공지사항");
		notice.setAd_id("admin");
		mapper.insert(notice);
		log.info("공지사항 insert >>> " + notice);
	}
	
	public void testInsertSel() {
		NoticeVO notice = new NoticeVO();
		notice.setN_subject("공지사항 12:15");
		notice.setN_contents("공지사항");
		notice.setAd_id("admin");
		mapper.insertSel(notice);
		log.info("공지사항 insertSel >>> " + notice);  
	}
	
	public void testRead() {
		int result = mapper.readUpCount(4);
		log.info("공지사항 조회수 >>> " + result);
		NoticeVO notice = mapper.read(4);
		log.info("공지사항 read >>> " + notice);
	}
	
	public void testDelete() {
		int result = mapper.delete(4);
		log.info("공지사항 delete >>> " + result);
	}
	//@Test
	public void testUpdate() {
		NoticeVO notice = new NoticeVO();
		notice.setN_subject("공지사항 12:20");
		notice.setN_contents("공지사항 update");
		notice.setN_num(4);
		int result = mapper.update(notice);
		log.info("공지사항 update >>> " + result);
	}
}
