package com.mannajob.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	private int rn;
	private String m_id;
	private String m_api;
	private String m_passwd;
	private String m_name;
	private String m_phone;
	private String m_email;
	private Date m_cdate;
	private Date m_stop;
    private String m_del;
    
    private EmplVO emplVO;
    private int e_num;
    private ReviewVO reviewVO;
}
