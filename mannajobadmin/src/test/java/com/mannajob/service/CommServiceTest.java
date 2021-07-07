package com.mannajob.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mannajob.domain.CommVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CommServiceTest {
	@Setter(onMethod_ = @Autowired)
	private CommService service;
	
	public void testService() {
		log.info("Service............" + service);
	}
	
	public void testGetList() {
		log.info("getList............");
		service.getList(25).forEach(comm -> log.info(comm));
	}
	
	public void testReadComm() {
		log.info("readComm............");
		int result = service.chkComm(25);
		if(result == 1) {
			service.readComm(25).forEach(cmain -> log.info(cmain));
		} else {
			log.info("질문이 없습니다.");
		}
	}
	
	public void testReadCommSub() {
		log.info("readCommSub............");
		int result = service.chkCommSub(25);
		if(result == 1) {
			service.readCommSub(25).forEach(csub -> log.info(csub));
		} else {
			log.info("답변이 없습니다.");
		}
	}
	
	public void testInsert() {
		log.info("insert............");
		CommVO comm = new CommVO();
		comm.setB_num(19);
		comm.setCm_m_id("lion");
		comm.setCm_contents("질문테스트 14:37");
		comm.setCm_secret("N");
		service.insert(comm);
		log.info("Comm insert >>> " + comm);
	}
	
	public void testInsertSub() {
		log.info("insertSub............");
		CommVO comm = new CommVO();
		comm.setCm_num(5);
		comm.setCms_contents("답변테스트 14:37");
		service.insertSub(comm);
		log.info("Comm sub insert >>> " + comm);
	}
	
	public void testUpdate() {
		log.info("update............");
		CommVO comm = new CommVO();
		comm.setCm_contents("질문 수정 테스트 14:49");
		comm.setCm_secret("Y");
		comm.setCm_num(5);
		boolean result = service.update(comm);
		log.info("Comm update >>> " + result);
	}
	
	public void testUpdateSub() {
		log.info("updateSub............");
		CommVO comm = new CommVO();
		comm.setCms_contents("답변 수정 테스트 14:49");
		comm.setCms_num(7);
		boolean result = service.updateSub(comm);
		log.info("Comm sub update >>> " + result);
	}
	
	public void testDelete() {
		log.info("delete............");
		boolean result = service.delete(5);
		log.info("Comm delete >>> " + result);
	}
	@Test
	public void testDeleteSub() {
		log.info("deleteSub............");
		boolean result = service.deleteSub(7);
		log.info("Comm sub delete >>> " + result);
	}	
}
