package com.samepage.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import util.DBUtil;

//DAO(Data Access Object)->business logic
public class EmpDAO {
	final String SELECT_ALL = "select * from employees";
	final String SELECT_BY_DEPT = SELECT_ALL + " where department_id = ?";
	final String SELECT_BY_SALARY = SELECT_ALL + " where salary between ? and ?";

	public List<EmpDTO> selectAll() {
		List<EmpDTO> emplist = new ArrayList<EmpDTO>();
		Connection conn = DBUtil.getConnect();
		Statement st = null;
		ResultSet rs = null;
		try {
			st = conn.createStatement();
			rs = st.executeQuery(SELECT_ALL);
			while (rs.next()) {
				makeEmp(rs, emplist);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, st, rs);
		}
		return emplist;
	}

	private void makeEmp(ResultSet rs, List<EmpDTO> emplist) throws SQLException {
		int employee_id = rs.getInt("employee_id");
		String first_name = rs.getString("first_name");
		String last_name = rs.getString("last_name");
		String email = rs.getString("email");
		Date hire_date = rs.getDate("hire_date");
		String job_id = rs.getString("job_id");
		int salary = rs.getInt("salary");
		int department_id = rs.getInt("department_id");
		EmpDTO emp = new EmpDTO(employee_id, first_name, last_name, email, hire_date, job_id, salary, department_id);
		emplist.add(emp);

	}

	public List<EmpDTO> selectByDept(int dept) {
		List<EmpDTO> emplist = new ArrayList<EmpDTO>();
		Connection conn = DBUtil.getConnect();
		PreparedStatement st = null;
		ResultSet rs = null;
		try {
			st = conn.prepareStatement(SELECT_BY_DEPT);
			st.setInt(1, dept);
			rs = st.executeQuery();
			while (rs.next()) {
				makeEmp(rs, emplist);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, st, rs);
		}
		return emplist;
	}

	public List<EmpDTO> selectBySalary(int losal, int hisal) {
		List<EmpDTO> emplist = new ArrayList<EmpDTO>();
		Connection conn = DBUtil.getConnect();
		PreparedStatement st = null;
		ResultSet rs = null;
		try {
			st = conn.prepareStatement(SELECT_BY_SALARY);
			st.setInt(1, losal);
			st.setInt(2, hisal);
			rs = st.executeQuery();
			while (rs.next()) {
				makeEmp(rs, emplist);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, st, rs);
		}
		return emplist;
	}

	public List<EmpDTO> selectByDeptJob(int dept2, String job) {
		// TODO Auto-generated method stub
		return null;
	}
}
