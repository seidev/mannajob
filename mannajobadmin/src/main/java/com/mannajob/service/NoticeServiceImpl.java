package com.mannajob.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mannajob.domain.Criteria;
import com.mannajob.domain.NoticeVO;
import com.mannajob.mapper.NoticeMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class NoticeServiceImpl implements NoticeService {
	@Setter(onMethod_ = @Autowired)
	private NoticeMapper mapper;
	
	@Override
	public List<NoticeVO> getList() {
		log.info("getList..................");
		return mapper.getList();
	}

	@Override
	public List<NoticeVO> getList(Criteria cri) {
		log.info("getList..................");
		return mapper.getListWithPaging(cri); 
	}

	@Override
	public void insert(NoticeVO notice) {
		mapper.insert(notice);

	}
	
	@Override
	public void insertSel(NoticeVO notice) {
		mapper.insertSel(notice);

	}

	@Override
	public NoticeVO read(int n_num) {
		log.info("read..................");
		return mapper.read(n_num);
	}

	@Override
	public boolean readUpCount(int n_num) {
		log.info("readUpCount..................");
		return mapper.readUpCount(n_num) == 1;
	}

	@Override
	public boolean delete(int n_num) {
		log.info("delete..................");
		return mapper.delete(n_num) == 1;
	}

	@Override
	public boolean update(NoticeVO notice) {
		log.info("update..................");
		return mapper.update(notice) == 1;
	}

	@Override
	public int getTotal(Criteria cri) {
		log.info("getTotal..................");
		return mapper.getTotalCount(cri);
	}
}
