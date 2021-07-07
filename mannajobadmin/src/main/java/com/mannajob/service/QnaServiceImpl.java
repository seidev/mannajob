package com.mannajob.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mannajob.domain.Criteria;
import com.mannajob.domain.QnaVO;
import com.mannajob.mapper.QnaMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class QnaServiceImpl implements QnaService {
	@Setter(onMethod_ = @Autowired)
	private QnaMapper mapper;

	@Override
	public List<QnaVO> getList() {
		log.info("getList..................");
		return mapper.getList();
	}

	@Override
	public List<QnaVO> getList(Criteria cri) {
		log.info("getList..................");
		return mapper.getListWithPaging(cri); 
	}

	@Override
	public void insert(QnaVO qna) {
		log.info("insert..................");
		mapper.insert(qna);
	}

	@Override
	public void insertSel(QnaVO qna) {
		log.info("insertSel..................");
		mapper.insertSel(qna);
	}

	@Override
	public void insertSub(QnaVO qna) {
		log.info("insertSub..................");
		mapper.insertSub(qna);
	}

	@Override
	public QnaVO read(int q_num) {
		log.info("read..................");
		return mapper.read(q_num);
	}

	@Override
	public boolean delete(int q_num) {
		log.info("delete..................");
		return mapper.delete(q_num) == 1;
	}

	@Override
	public boolean deleteSub(QnaVO qna) {
		log.info("deleteSub..................");
		return mapper.deleteSub(qna) == 1;
	}

	@Override
	public boolean update(QnaVO qna) {
		log.info("update..................");
		return mapper.update(qna) == 1;
	}

	@Override
	public boolean updateSub(QnaVO qna) {
		log.info("updateSub..................");
		return mapper.updateSub(qna) == 1;
	}

	@Override
	public int getTotal(Criteria cri) {
		log.info("getTotal..................");
		return mapper.getTotalCount(cri);
	}

	@Override
	public int chkQnaSub(int q_num) {
		
		return mapper.chkQnaSub(q_num);
	}
}
