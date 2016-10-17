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
	final String SELECT_BY_ID = SELECT_ALL 
			+ " where employee_id = ?";
		
	final String SELECT_BY_SALARY = SELECT_ALL + " where salary between ? and ?";
    final String EMP_INSERT = 
    		  "insert into employees(employee_id,"
    		+ "first_name, last_name, email, hire_date,"
    		+ "job_id, salary, department_id) "
    		+ " values(?,?,?,?,?,?,?,?)";
   final String EMP_UPDATE = 
		     " update employees "
		   + " set first_name=?, email=?, salary=? "
		   + " where employee_id = ?";
   final String EMP_DELETE = 
		     " delete from employees "
		   + " where employee_id = ?";
   
	public List<EmpDTO> selectAll() {
		List<EmpDTO> emplist = new ArrayList<EmpDTO>();
		Connection conn = DBUtil.getConnect();
		Statement st = null;
		ResultSet rs = null;
		try {
			st = conn.createStatement();
			rs = st.executeQuery(SELECT_ALL + " order by 1");
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

	public List<EmpDTO> selectByDeptJob(
			int dept2, String job) {
		String dept_where="";
		String job_where="";
		String op = " where "; 
        if(dept2!=0){
        	dept_where = op + " department_id=" + dept2;
        	op = " and ";
        }
        if(!job.equals("all")){
        	job_where = op + " job_id = '" + job + "'";
        }
	    String sql = SELECT_ALL + dept_where + job_where;		
	    List<EmpDTO> emplist = new ArrayList<EmpDTO>();
		Connection conn = DBUtil.getConnect();
		PreparedStatement st = null;
		ResultSet rs = null;
		try {
			st = conn.prepareStatement(sql);			
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

	public int empInsert(EmpDTO empDTO) {
		int result=0;
		Connection conn = DBUtil.getConnect();
		PreparedStatement ps = null;
		
		try {
			ps = conn.prepareStatement(EMP_INSERT);
			ps.setInt(1, empDTO.getEmployee_id());
			ps.setString(2, empDTO.getFirst_name());
			ps.setString(3, empDTO.getLast_name());
			ps.setString(4, empDTO.getEmail());
			ps.setDate(5, empDTO.getHire_date());
			ps.setString(6, empDTO.getJob_id());
			ps.setInt(7, empDTO.getSalary());
			ps.setInt(8, empDTO.getDepartment_id());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}

	public EmpDTO selectById(int empid) {
		List<EmpDTO> emplist = new ArrayList<EmpDTO>();
		Connection conn = DBUtil.getConnect();
		PreparedStatement st = null;
		ResultSet rs = null;
		try {
			st = conn.prepareStatement(SELECT_BY_ID);
			st.setInt(1, empid);
			rs = st.executeQuery();
			while (rs.next()) {
				makeEmp(rs, emplist);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, st, rs);
		}
		return  emplist.size()>0?emplist.get(0):null;
	}

	public int empUpdate(EmpDTO empDTO) {
		int result=0;
		Connection conn = DBUtil.getConnect();
		PreparedStatement ps = null;		
		try {
			ps = conn.prepareStatement(EMP_UPDATE);			
			ps.setString(1, empDTO.getFirst_name());
			ps.setString(2, empDTO.getEmail());
			ps.setInt(3, empDTO.getSalary());
			ps.setInt(4, empDTO.getEmployee_id());			
			result = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}

	public int empDelete(int id) {
		int result=0;
		Connection conn = DBUtil.getConnect();
		PreparedStatement ps = null;		
		try {
			ps = conn.prepareStatement(EMP_DELETE);			
			ps.setInt(1, id);			
			result = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
}





