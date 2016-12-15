package com.test.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBUtil {

	private static DBUtil instance = null;
	Connection conn = null;
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "hr";
	String password = "hr";
	String ojdbc = "oracle.jdbc.driver.OracleDriver";
	private DBUtil() {
		try {
			Class.forName(ojdbc);
			conn = DriverManager.getConnection(url, user, password);
			conn.setAutoCommit(false);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static DBUtil getInstance(){
		if(instance == null){
			instance = new DBUtil();
		}
		return instance;
	}
	
	public static void close(Connection conn, PreparedStatement pst, ResultSet rs){
		try {
			if(rs!=null)
			rs.close();
			else if(pst!=null)
			pst.close();
			else if(conn!=null)
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void close(Connection conn, Statement st, ResultSet rs){
		try {
			if(rs!=null)
			rs.close();
			else if(st!=null)
			st.close();
			else if(conn!=null)
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public Connection getConn(){
		return conn;
	}
	
}
