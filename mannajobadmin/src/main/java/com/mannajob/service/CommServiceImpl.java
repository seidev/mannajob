package com.mannajob.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mannajob.domain.CommVO;
import com.mannajob.mapper.CommMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class CommServiceImpl implements CommService {
	@Setter(onMethod_ = @Autowired)
	private CommMapper mapper;
	
	@Override
	public List<CommVO> getList(int b_num) {
		log.info("getList..................");
		return mapper.getList(b_num);
	}

	@Override
	public List<CommVO> readComm(int b_num) {
		log.info("readComm..................");
		return mapper.readComm(b_num);
	}

	@Override
	public List<CommVO> readCommSub(int b_num) {
		log.info("readCommSub..................");
		return mapper.readCommSub(b_num);
	}

	@Override
	public void insert(CommVO comm) {
		log.info("insert..................");
		mapper.insert(comm);
	}

	@Override
	public void insertSub(CommVO comm) {
		log.info("insertSub..................");
		mapper.insertSub(comm);
	}

	@Override
	public boolean update(CommVO comm) {
		log.info("update..................");
		return mapper.update(comm) == 1;
	}

	@Override
	public boolean updateSub(CommVO comm) {
		log.info("updateSub..................");
		return mapper.updateSub(comm) == 1;
	}

	@Override
	public boolean delete(int cm_num) {
		log.info("delete..................");
		return mapper.delete(cm_num) == 1;
	}

	@Override
	public boolean deleteSub(int cms_num) {
		log.info("deleteSub..................");
		return mapper.deleteSub(cms_num) == 1;
	}

	@Override
	public int chkComm(int b_num) {
		log.info("chkComm..................");
		return mapper.chkComm(b_num);
	}

	@Override
	public int chkCommSub(int b_num) {
		log.info("chkCommSub..................");
		return mapper.chkCommSub(b_num);
	}

}
