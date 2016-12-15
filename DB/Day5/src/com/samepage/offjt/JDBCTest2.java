package com.samepage.offjt;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class JDBCTest2 {

	public static void main(String[] args) {
//		Connection conn = null;
//		PreparedStatement pst = null;
//		Statement st = null;
//		ResultSet rs = null;
//		try {
//
//			 conn = DBUtil.getInstance().getConn();
//			
//			
//			String sql = "select e.first_name, d.department_name, j.job_title "+
//							"from EMPLOYEES e, JOBS j, DEPARTMENTS d "+
//							"where e.department_id = d.department_id "+
//							"and e.job_id like ? ";
//			
//			pst = conn.prepareStatement(sql);
//			
//			String q = new Scanner(System.in).nextLine();
//			pst.setString(1, q);
//			rs  = pst.executeQuery();
//			
//			
//			
//			
//			while(rs.next()){
//				
//				System.out.println(rs.getString(1)+"\t"+rs.getString(2)+"\t"+
//									rs.getString(3)+"\t");
//				
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}

		
		EmpManage em = new EmpManage();
		em.selectAll();
		
		em.selectByDept(110);
		
		em.selectByName("william");
		
	}

}
