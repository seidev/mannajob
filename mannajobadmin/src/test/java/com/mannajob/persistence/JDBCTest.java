package com.mannajob.persistence;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class JDBCTest {
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch(Exception e) {
			System.out.println(e.toString());
		}
	}
	
	@Test
	public void testConnection() {
		try(Connection conn = 
				DriverManager.getConnection(
						"jdbc:oracle:thin:@175.205.193.91:13579:orcl",
						"mannajob",
						"ateam")) {
			log.info(conn);
		} catch(Exception e) {
			System.out.println(e.toString());
		}
	}
}
