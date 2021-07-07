package com.mannajob.domain;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeVO {
	private int n_num;
	private String n_subject;
	private String ad_id;
	private String n_contents;
	private int n_cnt;
	private Date n_wdate;
	private Date n_udate;
	private String n_del;
}
