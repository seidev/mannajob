package com.mannajob.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MatchVO {
	private int mat_num;
	private int b_num;
	private String m_id;
	private String mat_hour;
	private String mat_stdate;
	private Date mat_wdate;
	private Date mat_okdate;
	private String mat_state;
	private int countM;
}
