package com.mannajob.domain;

import java.util.Date;

import lombok.Data;
@Data
public class BMatchReviewVO {
	private int b_num;
	private String b_category;
	private String m_id;
	private String b_corp;
	private String b_task;
	private int b_price;
	private String b_location;
	private String b_stdate;
	private String b_endate;
	private String b_period;
	private String b_del;
	private String b_state;
	private String b_subject;
	private Date b_wdate;
	private String b_contents;
	private int r_num;
	private int mat_num;
	private String r_good;
	private String r_contents;
	private Date r_wdate;
	private String r_del;
	private String r_w_m_id;
	private String r_mat_m_id;
	private String mat_state;
}
