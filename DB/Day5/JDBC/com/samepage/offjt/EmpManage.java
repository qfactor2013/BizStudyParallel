package com.samepage.offjt;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import util.DBUtil;

public class EmpManage {

	// 직원정보 모두조회
	public void selectAll() {
		// 1.DB연결
		// 2.SQL문실행
		// 3.결과를 처리
		// 4.자원반납
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

	// 특정부서의 직원정보 조회
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

	// 이름이 특정문자로 시작하는 직원정보 조회
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
