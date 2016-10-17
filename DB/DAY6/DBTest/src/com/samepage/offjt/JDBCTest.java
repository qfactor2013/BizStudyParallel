package com.samepage.offjt;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCTest {

	public static void main(String[] args) {
		Connection conn			 = null;
		Statement st 		 	 = null;
		PreparedStatement pst 	 = null;
		ResultSet rs   			 = null;
//			1.jdbc driver load
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("driver load complete");
//			2. Connection
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "hr");
			if(!conn.isClosed())
			{
				System.out.println("conn이 연결됨 " + conn.toString());
			}
//			3. Statement 생성 - SQL문 실행통로
			String sql = "select * from employees";
					st = conn.createStatement();
					rs = st.executeQuery(sql);
					
//			4. ResultSet - 결과받아서 처리
			while(rs.next()){
				int empid = rs.getInt(1);
				String name = rs.getString("first_name");
				int sal = rs.getInt("salary");
				System.out.printf("%3d %-20s %10d\n", empid, name, sal);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
//			5. 자원반납
			try {
				if(rs!=null)
				rs.close();
				else if(pst!=null)
				pst.close();
				else if(st!=null)
				st.close();
				else if(conn!=null)
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
	}

}
