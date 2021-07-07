package com.mannajob.mapper;

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
public class QnaMapperTest {
	@Setter(onMethod_ = @Autowired)
	private QnaMapper mapper;
	
	
	public void testGetList2() {
		mapper.getList().forEach(qna -> log.info(qna));
	}
	
	
	public void testGetList() {
		mapper.getListWithPaging(new Criteria(1,5)).forEach(qna -> log.info(qna));
	}
	
	public void testInsert() {
		QnaVO qna = new QnaVO();
		qna.setQ_category("Q");
		qna.setQ_subject("Qna 19:42");
		qna.setQ_contents("Qna");
		qna.setM_id("tiger");
		mapper.insert(qna);
		log.info("Qna insert >>> " + qna);
	}
	
	public void testInsertSel() {
		QnaVO qna = new QnaVO();
		qna.setQ_category("Q");
		qna.setQ_subject("Qna 19:47");
		qna.setQ_contents("Qna");
		qna.setM_id("tiger");
		mapper.insertSel(qna);
		log.info("Qna insertSel >>> " + qna);  
	}
	
	public void testInsertSub() {
		QnaVO qna = new QnaVO();
		qna.setQ_num(2);
		qna.setAd_id("admin");
		qna.setQs_contents("답변입니다 20:43");
		mapper.insertSub(qna);
		log.info("Qna sub insert >>> " + qna);
	}
	
	public void testRead() {
		QnaVO qna = mapper.read(2);
		log.info("Qna read >>> " + qna);
	}
	
	public void testUpdate() {
		QnaVO qna = new QnaVO();
		qna.setQ_category("Q");
		qna.setQ_subject("Qna 19:42222");
		qna.setQ_contents("Qna22");
		qna.setQ_num(4);
		int result = mapper.update(qna);
		log.info("Qna update >>> " + result);
	}
	
	public void testUpdateSub() {
		QnaVO qna = new QnaVO();
		qna.setQs_num(3);
		qna.setQs_contents("답변입니다 20:50");
		int result = mapper.updateSub(qna);
		log.info("Qna sub update >>> " + result);
	}
	
	public void testDelete() {
		int result = mapper.delete(4);
		log.info("Qna delete >>> " + result);
	}
	
	public void testDeleteSub() {
		QnaVO qna = new QnaVO();
		int result = mapper.deleteSub(qna);
		log.info("Qna sub delete >>> " + result);
	}
}
