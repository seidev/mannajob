package com.mannajob.domain;

import lombok.Data;

@Data
public class PageDTO {
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	private int total;
	private Criteria cri;
	private CriteriaProfile scri;
	
	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		this.endPage = (int)(Math.ceil(cri.getPageNum() / 10.0)) * 10;
		this.startPage = this.endPage - 9;
		int realEnd = (int)(Math.ceil((total * 1.0) / cri.getAmount()));
		if (realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
	public PageDTO(CriteriaProfile scri, int total) {
		this.scri = scri;
		this.total = total;
		this.endPage = (int)(Math.ceil(scri.getPageNumP() / 10.0)) * 10;
		this.startPage = this.endPage - 9;
		int realEnd = (int)(Math.ceil((total * 1.0) / scri.getAmountP()));
		if (realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
}
