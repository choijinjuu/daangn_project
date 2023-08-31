package com.danngn.common;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class JDBCTemplate {

	public static Connection getConnection() {
		
		Properties prop = new Properties();
		
		//읽어들이고자하는 드라이버 파일의 물리적인 파일 경로 가져오기
		String filePath = JDBCTemplate.class.getResource("/sql/driver/driver.properties").getPath();
		
		Connection conn = null;
		
			try {
				// JDBC driver 연결
				prop.load(new FileInputStream(filePath));
				
				Class.forName(prop.getProperty("driver"));
				
				conn = DriverManager.getConnection(prop.getProperty("url"),
														prop.getProperty("username"),
														prop.getProperty("password"));
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}  catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}  catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			return conn;
	}
	
	//commit
	public static void commit(Connection conn) {
		
		try {
			if(conn!=null && !conn.isClosed()) {
				conn.commit();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//rollback
	public static void rollback(Connection conn) {
		
		try {
			if(conn!=null && !conn.isClosed()) {
				conn.rollback();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//반납
	public static void close(Connection conn) {
		
		try {
			if(conn!=null && !conn.isClosed()) {
				conn.isClosed();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void close(Statement stmt) {
		
		try {
			if(stmt!=null && !stmt.isClosed()) {
				stmt.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void close(ResultSet rset) {
		
		try {
			if(rset!=null && !rset.isClosed()) {
				rset.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
