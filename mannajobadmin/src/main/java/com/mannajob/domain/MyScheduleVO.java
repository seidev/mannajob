package com.mannajob.domain;

import lombok.Data;

@Data
public class MyScheduleVO {
	private String b_num;
	private String b_category;
	private String w_m_id;
	private String mat_num;
//	만나는 사람 아이디
	private String m_id;
	private String mat_hour;
	private String mat_stdate;
	private String mat_state;
	private String mat_okdate;
}
