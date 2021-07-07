package com.mannajob.service;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mannajob.domain.Criteria;
import com.mannajob.domain.QnaVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class QnaServiceTest {
	@Setter(onMethod_ = @Autowired)
	private QnaService service;
	
	
	public void testService() {
		log.info("Service............" + service);
	}
	
	public void testGetList2() {
		log.info("getList............");
		service.getList().forEach(qna -> log.info(qna));
	}
	
	public void testGetList() {
		log.info("getListWithPaging............");
		service.getList(new Criteria(1,5)).forEach(qna -> log.info(qna));
	}
	
	public void testInsert() {
		log.info("insert............");
		QnaVO qna = new QnaVO();
		qna.setQ_category("Q");
		qna.setQ_subject("Qna 21:28");
		qna.setQ_contents("Qna");
		qna.setM_id("tiger");
		service.insert(qna);
		log.info("Qna insert >>> " + qna);
	}
	
	public void testInsertSel() {
		log.info("insertSel............");
		QnaVO qna = new QnaVO();
		qna.setQ_category("Q");
		qna.setQ_subject("Qna 21:29");
		qna.setQ_contents("Qna");
		qna.setM_id("tiger");
		service.insertSel(qna);
		log.info("Qna insertSel >>> " + qna);  
	}
	
	public void testInsertSub() {
		log.info("insertSub............");
		QnaVO qna = new QnaVO();
		qna.setQ_num(2);
		qna.setAd_id("admin");
		qna.setQs_contents("답변입니다 21:29");
		service.insertSub(qna);
		log.info("Qna sub insert >>> " + qna);
	}
	
	public void testRead() {
		log.info("read............");
		QnaVO qna = service.read(2);
		log.info("Qna read >>> " + qna);
	}
	
	public void testUpdate() {
		log.info("update............");
		QnaVO qna = new QnaVO();
		qna.setQ_category("Q");
		qna.setQ_subject("Qna 21:31");
		qna.setQ_contents("Qna22");
		qna.setQ_num(4);
		boolean result = service.update(qna);
		log.info("Qna update >>> " + result);
	}
	
	public void testUpdateSub() {
		log.info("updateSub............");
		QnaVO qna = new QnaVO();
		qna.setQs_num(3);
		qna.setQs_contents("답변입니다 21:32");
		boolean result = service.updateSub(qna);
		log.info("Qna sub update >>> " + result);
	}
	
	public void testDelete() {
		log.info("delete............");
		boolean result = service.delete(5);
		log.info("Qna delete >>> " + result);
	}
	
	public void testDeleteSub() {
		log.info("deleteSub............");
		QnaVO qna = new QnaVO();
		boolean result = service.deleteSub(qna);
		log.info("Qna sub delete >>> " + result);
	}
}
