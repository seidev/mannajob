package com.mannajob.mapper;

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
public class CommMapperTest {
	@Setter(onMethod_ = @Autowired)
	private CommMapper mapper;
	
	
	public void testGetList() {
		mapper.getList(25).forEach(comm -> log.info(comm));
	}
	
	public void testReadComm() {
		int result = mapper.chkComm(25);
		if(result == 1) {
			mapper.readComm(25).forEach(cmain -> log.info(cmain));
		} else {
			log.info("질문이 없습니다.");
		}
	}
	
	public void testReadCommSub() {
		int result = mapper.chkCommSub(25);
		if(result == 1) {
			mapper.readCommSub(25).forEach(csub -> log.info(csub));
		} else {
			log.info("답변이 없습니다.");
		}
	}
	
	public void testInsert() {
		CommVO comm = new CommVO();
		comm.setB_num(15);
		comm.setCm_m_id("lion");
		comm.setCm_contents("질문테스트 13:32");
		comm.setCm_secret("N");
		mapper.insert(comm);
		log.info("Comm insert >>> " + comm);
	}
	
	public void testInsertSub() {
		CommVO comm = new CommVO();
		comm.setCm_num(4);
		comm.setCms_contents("답변테스트 13:32");
		mapper.insertSub(comm);
		log.info("Comm sub insert >>> " + comm);
	}
	
	public void testUpdate() {
		CommVO comm = new CommVO();
		comm.setCm_contents("질문 수정 테스트 13:40");
		comm.setCm_secret("Y");
		comm.setCm_num(4);
		int result = mapper.update(comm);
		log.info("Comm update >>> " + result);
	}
	
	public void testUpdateSub() {
		CommVO comm = new CommVO();
		comm.setCms_contents("답변 수정 테스트 13:40");
		comm.setCms_num(6);
		int result = mapper.updateSub(comm);
		log.info("Comm update >>> " + result);
	}
	
	public void testDelete() {
		int result = mapper.delete(4);
		log.info("Comm delete >>> " + result);
	}
	
	public void testDeleteSub() {
		int result = mapper.deleteSub(6);
		log.info("Comm sub delete >>> " + result);
	}
}
