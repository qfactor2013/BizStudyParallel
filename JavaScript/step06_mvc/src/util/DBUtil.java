package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBUtil {

	//static{}에서 초기화, getConnection에서 사용
		//멤버로 선언 필수
		static DataSource ds;
		//server의 설정 정보로부터 Connection 객체를 관리하는 DataSource 객체 획득
		// tomcat JNDI configuration step 3
		static{
			try {
				Context initContext = new InitialContext();
				Context envContext  = (Context)initContext.lookup("java:/comp/env");
				ds = (DataSource)envContext.lookup("jdbc/orcl");
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		//서버에서 Connection 객체를 관리 및 제공해주는 객체(DataSource)로부터 Connection 객체 선언
		public static Connection getConnection(){
			
			Connection conn = null;
			try {
				conn = ds.getConnection();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				return conn;			
			
		}

	
	public static void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
