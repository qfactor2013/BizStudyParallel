package com.samepage.offjt;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCTest {

	public static void main(String[] args) {
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		 
			//1.jdbc driver load
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("driver load����");
			//2.Connection
			String url = "jdbc:oracle:thin:@192.168.1.18:1521:xe";			
			conn = DriverManager.getConnection(url,
					"hr", "hr");
			System.out.println("DB���Ἲ��");
			//3.Statment����- SQL���������
			String sql="select * from employees";
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			//4.ResultSet - ����޾Ƽ� ó��
			while(rs.next()){
				int empid = rs.getInt(1);
				String name = rs.getString("first_name");
				int sal = rs.getInt("salary");
				System.out.printf("%3d %-10s %10d\n",
						            empid,name,sal);
				
			}
			//5.�ڿ��ݳ�
		
		} catch (ClassNotFoundException e) {
			System.out.println("driver����..load����");
			 
		} catch (SQLException e) {
			System.out.println("DB������� �Ǵ� SQL�� ����");
			e.printStackTrace();
		} finally{
			try {
				if(rs!=null) rs.close();
				if(st!=null) st.close();
				if(conn!=null) conn.close();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
			
			
			
			
			
			
		
		
		 
		
		
	}
}
