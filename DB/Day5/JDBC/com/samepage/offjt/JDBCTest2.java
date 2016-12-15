package com.samepage.offjt;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCTest2 {

	public static void main(String[] args) 
			throws ClassNotFoundException, SQLException {
		//1.Driver load
		Class.forName("oracle.jdbc.OracleDriver");
		//2.Connection
		Connection conn = null;
		conn = DriverManager.getConnection(
				"jdbc:oracle:thin:@localhost:1521:xe",
				"hr", "hr");
        //3.SQL문을 전송...Statement
		String sql = 
			" select e.first_name, e.job_id, j.job_title,"+ 
			"            d.department_name "+
			" from employees e, jobs j,  DEPARTMENTS d"+  
			" where  e.department_id = d.department_id"+
			" and e.job_id = j.job_id ";
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(sql);
        //4.ResultSet결과를 처리한다. 
        while(rs.next()){
        	String a = rs.getString(1);
        	String b = rs.getString(2);
        	String c = rs.getString(3);
        	String d = rs.getString(4);
        	System.out.println(a+"\t"+b+"\t"+c+"\t"+d);
        }
	}

}
