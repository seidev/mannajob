package com.mannajob.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BMatchCommVO {
	private int cm_num;
	private int b_num;
	private Date cm_wdate;
	private String m_id;
	private char cm_del;
	private char cm_secret;
	private int cms_num;
	private Date cms_wdate;
	private char cms_del;
	private String b_m_id; // 작성자 아이디
}
