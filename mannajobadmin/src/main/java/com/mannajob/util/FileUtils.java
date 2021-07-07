package com.mannajob.util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mannajob.domain.EmplVO;

@Component("fileUtils")
public class FileUtils {
	private static final String filePath = "C:\\Users\\USER\\git\\mannajob\\mannajobadmin\\src\\main\\webapp\\resources\\certifi\\"; //서버 절대경로로 바꾸기
	
	public List<Map<String, Object>> parseInsertFileInfo(EmplVO empl, 
			MultipartHttpServletRequest mpRequest) throws Exception{
		
		Iterator<String> iterator = mpRequest.getFileNames();
		
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, Object> listMap = null;
		
		int e_num = empl.getE_num();
		
		File file = new File(filePath);
		if(file.exists() == false) {
			file.mkdirs();
		}
		
		int tmp_cnt = 0;
		while(iterator.hasNext()) {
			tmp_cnt++;
			multipartFile = mpRequest.getFile(iterator.next());
			if(multipartFile.isEmpty() == false) {
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = getRandomString() + originalFileExtension;
				file = new File(filePath + storedFileName);
				multipartFile.transferTo(file);
				listMap = new HashMap<String, Object>();
				listMap.put("E_NUM", e_num);
				if(tmp_cnt==1) {
				listMap.put("F_CATEGORY", 'I');
				}else {
				listMap.put("F_CATEGORY", 'C');
				}
				listMap.put("ORG_FILE_NAME", originalFileName);
				listMap.put("STORED_FILE_NAME", storedFileName);
				listMap.put("FILE_SIZE", multipartFile.getSize());
				list.add(listMap);
			}
		}
		return list;
	}
	
	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
}