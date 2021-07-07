package com.mannajob.domain;

import java.util.Date;

import lombok.Data;

@Data
public class FileVO {
	private int file_no;
	private int e_num;
	private String org_file_name;
	private String stored_file_name;
	private long file_size;
	private Date regdate;
	private String f_del;
	private String f_category;
}
