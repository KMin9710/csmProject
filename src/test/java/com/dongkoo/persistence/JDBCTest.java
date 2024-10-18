package com.dongkoo.persistence;

import static org.junit.Assert.fail;

import java.sql.DriverManager;
import java.sql.Connection;

import org.junit.Test;

public class JDBCTest {
	
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testConnection() {
		try(Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE",
														 "system",
														 "1234")) {
			System.out.println(con);
		} catch (Exception e) {
			fail(e.getMessage());
		}
		
	}
	
}
