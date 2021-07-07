package com.mannajob.domain;

import lombok.Data;

@Data
public class CriteriaProfile {
	private int pageNumP;
	private int amountP;
	
	public CriteriaProfile() {
		this(1,10);
	}
	public CriteriaProfile(int pageNumP, int amountP) {
		this.pageNumP = pageNumP;
		this.amountP = amountP;
	}
}
