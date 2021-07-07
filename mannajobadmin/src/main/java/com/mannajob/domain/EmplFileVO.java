package com.mannajob.domain;

import java.util.Date;

import lombok.Data;

@Data
public class EmplFileVO {
	private int e_num;
	private String m_id;
	private String e_corp;
	private String e_dept;
	private String e_rank;
	private String e_task;
	private String e_career;
	private String e_intro;
	private String e_ok;
	private Date e_applydate;
	private Date e_okdate;
	private String e_del;	
	private String stored_file_name;
	private String f_category;
}
