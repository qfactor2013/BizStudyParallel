package com.samepage.offjt;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class EmpManage {

	//�������� ��� ��ȸ
	public void selectAll(){
		// 1. DB ����
		Connection conn = DBUtil.getInstance().getConn();
		Statement  st	= null;
		ResultSet	rs	= null;
		
		String sql = "select * from employees";
		
		try {
			// 2. sql ����
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			// 3. ��� ó��
			while(rs.next()){
				int id = rs.getInt("employee_id");
				String name = rs.getString("first_name");
				int salary = rs.getInt("salary");
				Date hire  = rs.getDate("hire_date");
				
//				System.out.println(id + "\t" + name + "\t" + salary + "\t" + hire);
				System.out.printf("%d %s %d %tF \n", id, name, salary, hire);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			// 4. �ڿ� �ݳ�
			DBUtil.close(conn, st, rs);
			System.out.println("====================== ��ȸ�Ϸ� =====================");
		}	
	}
	
	public void selectByDept(int deptid){

		// 1. DB ����
		Connection 		  conn	= DBUtil.getInstance().getConn();
		PreparedStatement  pst	= null;
		ResultSet			rs	= null;
		
		String sql = "select * from employees where department_id = ?";
		
		try {
			// 2. sql ����
			pst = conn.prepareStatement(sql);
			pst.setInt(1, deptid);
			rs = pst.executeQuery();
			// 3. ��� ó��
			while(rs.next()){
				int id = rs.getInt("employee_id");
				String name = rs.getString("first_name");
				int salary 	= rs.getInt("salary");
				Date hire  	= rs.getDate("hire_date");
				int dept	= rs.getInt("department_id");
//				System.out.println(id + "\t" + name + "\t" + salary + "\t" + hire);
				System.out.printf("%d %s %d %tF %d \n", id, name, salary, hire, dept);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			// 4. �ڿ� �ݳ�
			DBUtil.close(conn, pst, rs);
			System.out.println("====================== ��ȸ�Ϸ� =====================");
		}
	}
	
	public void selectByName(String name){


		// 1. DB ����
		Connection 		  conn	= DBUtil.getInstance().getConn();
		PreparedStatement  pst	= null;
		ResultSet			rs	= null;
		
		String sql = "select * from employees where first_name like initCap(?)";
		
		try {
			// 2. sql ����
			pst = conn.prepareStatement(sql);
			pst.setString(1, "%"+name+"%");
			rs = pst.executeQuery();
			// 3. ��� ó��
			while(rs.next()){
				int id = rs.getInt("employee_id");
				String first_name = rs.getString("first_name");
				int salary 	= rs.getInt("salary");
				Date hire  	= rs.getDate("hire_date");
				int dept	= rs.getInt("department_id");
//				System.out.println(id + "\t" + name + "\t" + salary + "\t" + hire);
				System.out.printf("%d %s %d %tF %d \n", id, first_name, salary, hire, dept);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			// 4. �ڿ� �ݳ�
			DBUtil.close(conn, pst, rs);
			System.out.println("====================== ��ȸ�Ϸ� =====================");
		}
	}
	
}
