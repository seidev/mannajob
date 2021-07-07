package com.mannajob.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ComplVO {
	private int c_num;
	private String m_id;
	private String c_category;
	private String c_why;
	private int board_num;
	private String c_state;
	private Date c_wdate;
}
