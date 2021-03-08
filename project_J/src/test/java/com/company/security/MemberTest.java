package com.company.security;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml","file:src/main/webapp/WEB-INF/spring/security-context.xml"})
public class MemberTest {
	@Autowired
	private PasswordEncoder pwencoder;
	
	@Autowired
	private DataSource ds;
	
	@Test
	public void testInsertMember() {
		String sql="insert into member(account, name, email, password) values(?,?,?,?)";
		
		Connection c=null;
		PreparedStatement pstmt=null;
		
		try {
			c=ds.getConnection();
			pstmt=c.prepareStatement(sql);
			
			pstmt.setString(1, "test3");
			pstmt.setString(2, "test3");
			pstmt.setString(3, "test@test.com");
			pstmt.setString(4, pwencoder.encode("@sssswwwwqqqqaa"));
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			
		}
	}
}
