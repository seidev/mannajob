package com.mannajob.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CommVO {
	private int cm_num;
	private int b_num;
	private String b_m_id;
	private Date cm_wdate;
	private Date cm_udate;
	private String cm_contents;
	private String cm_m_id;
	private String cm_del;
	private String cm_secret;
	
	private int cms_num;
	private String cms_wdate;
	private Date cms_udate;
	private String cms_contents;
	private String cms_m_id;
	private String cms_del;
}
