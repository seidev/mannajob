package com.mannajob.domain;

import java.util.Date;

import lombok.Data;

@Data
public class QnaVO {
	private int q_num;
	private String q_category;
	private String m_id;
	private String q_contents;
	private Date q_wdate;
	private Date q_udate;
	private String q_del;
	private String q_subject;
	private int reply_chk;
	private int qs_num;
	private String ad_id;
	private String qs_contents;
	private Date qs_wdate;
	private Date qs_udate;
	private String qs_del;
	
}
