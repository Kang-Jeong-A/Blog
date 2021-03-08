package com.company.sqlTest;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class MysqlDBConnectionTest {
	private static final String Driver="com.mysql.jdbc.Driver";
	private static final String url="jdbc:mysql://localhost:3306/project?serverTimezone=UTC";
	private static final String username="root";
	private static final String password="1226";
 
	@Test
	public void testConnection() throws Exception{
		Class.forName(Driver);          //class를 찾는다
		try {
			Connection con=DriverManager.getConnection(url, username, password);
		}catch(Exception e){
			e.printStackTrace();
		}

	}
}
