package com.samepage.offjt;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import util.DBUtil;

public class EmpManage {

	// �������� �����ȸ
	public void selectAll() {
		// 1.DB����
		// 2.SQL������
		// 3.����� ó��
		// 4.�ڿ��ݳ�
		Connection conn = DBUtil.getConnect();
		Statement st = null;
		ResultSet rs = null;
		String sql = "select * from employees";

		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				int id = rs.getInt("employee_id");
				String name = rs.getString("first_name");
				int sal = rs.getInt("salary");
				Date hire = rs.getDate("hire_date");
				System.out.printf("%d %s %d %tF\n", id, name, sal, hire);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, st, rs);
		}
	}

	// Ư���μ��� �������� ��ȸ
	public void selectByDept(int deptid) {
		Connection conn = DBUtil.getConnect();
		PreparedStatement st = null;
		ResultSet rs = null;
		String sql = "select * from employees " 
		+ " where department_id=?"  ;

		try {
			st = conn.prepareStatement(sql);
			st.setInt(1, deptid);
			rs = st.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("employee_id");
				String name = rs.getString("first_name");
				int sal = rs.getInt("salary");
				Date hire = rs.getDate("hire_date");
				int dept = rs.getInt("department_id");
				System.out.printf("%d %s %d %tF %d\n", id, name, sal, hire, dept);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, st, rs);
		}

	}

	// �̸��� Ư�����ڷ� �����ϴ� �������� ��ȸ
	public void selectByName(String startWord) {
		Connection conn = DBUtil.getConnect();
		PreparedStatement st = null;
		ResultSet rs = null;
		String sql = "select * from employees " 
		        + " where first_name like ? ";

		try {
	        st = conn.prepareStatement(sql);
	        st.setString(1, startWord+"%");
	        rs = st.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("employee_id");
				String name = rs.getString("first_name");
				int sal = rs.getInt("salary");
				Date hire = rs.getDate("hire_date");
				int dept = rs.getInt("department_id");
				System.out.printf("%d %s %d %tF %d\n", id, name, sal, hire, dept);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, st, rs);
		}

	}
}
