package com.samepage.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

import com.samepage.util.DBUtil;

//DAO(Data Access Object) - > business logic
public class EmpDAO {

	final String SELECT_ALL = "select * from employees";
	final String SELECT_BY_DEPT = SELECT_ALL+" where department_id = ?";
	final String SELECT_BY_SALARY = SELECT_ALL+" where salary between ? and ?";
	final String EMP_INSERT = "insert into employees(employee_id, first_name, last_name, "
			+ "email, hire_date, job_id, salary, department_id) values(?,?,?,?,?,?,?,?)";
	final String SELECT_BY_ID = SELECT_ALL + " where employee_id = ?";
	final String UPDATE_BY_ID = "update employees set first_name = ?, email = ?, salary = ?"
			+ ", employee_id = ? where employee_id = ?";
	Scanner sc = new Scanner(System.in);
	public List<EmpDTO> selectAll(){
		PreparedStatement pst = null;
		ResultSet rs = null;
		List<EmpDTO> list = new ArrayList<>();
		Connection conn = DBUtil.getInstance().getConn();
		try {
			pst = conn.prepareStatement(SELECT_ALL);
			rs = pst.executeQuery();
			while(rs.next()){
				makeEmp(rs, list);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(conn, pst, rs);
		}
		return list;
	}
	
	public Map<Integer, Integer> selectAll2(){
		PreparedStatement pst = null;
		ResultSet rs = null;
		Map<Integer, Integer> map = new HashMap<Integer, Integer>();
		Connection conn = DBUtil.getInstance().getConn();
		try {
			pst = conn.prepareStatement(SELECT_ALL);
			rs = pst.executeQuery();
			while(rs.next()){
				makeEmp(rs, map);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(conn, pst, rs);
		}
		return map;
	}
	
	public List<EmpDTO> selectByDept(int dept){
		PreparedStatement pst = null;
		ResultSet rs = null;
		List<EmpDTO> list = new ArrayList<>();
		Connection conn = DBUtil.getInstance().getConn();
		try {
			pst = conn.prepareStatement(SELECT_BY_DEPT);
			pst.setInt(1, dept);
			rs = pst.executeQuery();
			while(rs.next()){
				makeEmp(rs, list);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(conn, pst, rs);
		}
		return list;
	}
	public List<EmpDTO> selectBySalary(){
		PreparedStatement pst = null;
		ResultSet rs = null;
		List<EmpDTO> list = new ArrayList<>();
		Scanner sc = new Scanner(System.in);
		
		System.out.print("최소 급여 범위를 입력하세요~ : ");
		String min = sc.nextLine();
		System.out.print("최대 급여 범위를 입력하세요~ : ");
		String max = sc.nextLine();
		
		Connection conn = DBUtil.getInstance().getConn();
		try {
			pst = conn.prepareStatement(SELECT_BY_SALARY);
			pst.setInt(1, Integer.parseInt(min));
			pst.setInt(2, Integer.parseInt(max));
			rs = pst.executeQuery();
			while(rs.next()){
				makeEmp(rs, list);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(conn, pst, rs);
		}
		return list;
	}
	public List<EmpDTO> selectByMultiSelect(String deptid, String jobid){
		PreparedStatement pst = null;
		ResultSet rs = null;
		List<EmpDTO> list = new ArrayList<>();
		String sql = "";
		Connection conn = DBUtil.getInstance().getConn();
		
		try {
			pst = conn.prepareStatement(sql);
			if(deptid != null && !(deptid.trim().isEmpty())){
				sql += SELECT_ALL + " where " + "department_id = ?"; 
				pst.setInt(1, Integer.parseInt(deptid));
			}
			if(jobid != null && !(jobid.trim().isEmpty())){
				if(!sql.isEmpty()){
					sql += " and " + "job_id = ?";
					pst.setString(2, jobid);
				}
				else{
					sql += SELECT_ALL + " where " + "job_id = ?";
					pst.setString(1, jobid);
				}
			}
			
			pst.execute(sql);
			System.out.println(sql);
			
			rs = pst.executeQuery();
			
			while(rs.next()){
				makeEmp(rs, list);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(conn, pst, rs);
		}
		return list;
	}
	
	public void insert(EmpDTO empdto){
		int result = 0;
		Connection conn = DBUtil.getInstance().getConn();
		PreparedStatement pst = null;
		ResultSet			rs = null;
		try {
			pst = conn.prepareStatement(EMP_INSERT);
			System.out.println(EMP_INSERT);
			pst.setInt(1, empdto.getEmployee_id());
			pst.setString(2, empdto.getFirst_name());
			pst.setString(3, empdto.getLast_name());
			pst.setString(4, empdto.getEmail());
			pst.setDate(5, empdto.gethire_date());
			pst.setString(6, empdto.getJob_id());
			pst.setInt(7, empdto.getSalary());
			pst.setInt(8, empdto.getDepartment_id());
			result = pst.executeUpdate();
			
			if(result !=0)
				System.out.println("입력완료");
			else
				System.out.println("입력실패");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public int updateByID(int empid){
		EmpDTO dto = null;
		Connection conn = DBUtil.getInstance().getConn();
		PreparedStatement pst = null;
		ResultSet			rs = null;
		List<EmpDTO> list = new ArrayList<>();
		int result = 0;
		try {
			pst = conn.prepareStatement(SELECT_BY_ID);
			pst.setInt(1, empid);
			rs = pst.executeQuery();
			while(rs.next()){
				makeEmp(rs, list);
			}
			if(list.size()<0){
				System.out.println("존재하지 않습니다!!");
			} else{
				System.out.print("입력할 이름를 입력 >>>>>");
				String first_name = sc.nextLine();
				System.out.print("입력할 이메일을 입력 >>>>>");
				String email = sc.nextLine();
				System.out.print("입력할 연봉을 입력 >>>>>");
				String salary = sc.nextLine();
				
				pst = conn.prepareStatement(UPDATE_BY_ID);
				pst.setString(1, first_name);
				pst.setString(2, email);
				pst.setString(3, salary);
				pst.setInt(4, empid);
				pst.setInt(5, empid);
				
				result = pst.executeUpdate();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(conn, pst, rs);
		}
		return result;
	}
	
//	public static void main(String[] args){
//		EmpDAO dao = new EmpDAO();
////		System.out.println(dao.selectAll().toString());
//		
//		List<EmpDTO> list = dao.selectAll();
//		Map<Integer, Integer> map = dao.selectAll2();
//		for (EmpDTO empDTO : list) {
//			System.out.println(empDTO);
//	 	}
//		
//		
//		for (Entry<Integer, Integer> empDTO : map.entrySet()) {
//			System.out.println(empDTO);
//		}
//		
//		 	
//		
//		}
//	
	
	private void makeEmp(ResultSet rs, List<EmpDTO> list) throws SQLException{
		EmpDTO dto = new EmpDTO();
		dto.setEmployee_id(rs.getInt("employee_id"));
		dto.setFirst_name(rs.getString("first_name"));
		dto.setLast_name(rs.getString("last_name"));
		dto.setEmail(rs.getString("email"));
		dto.sethire_date(rs.getDate("hire_date"));
		dto.setJob_id(rs.getString("job_id"));
		dto.setSalary(rs.getInt("salary"));
		dto.setDepartment_id(rs.getInt("department_id"));
		//생성자도 있으니까 변수에 저장해서 생성자에 바로 넣어줘도 됨 
		list.add(dto);
	}
	
	private void makeEmp(ResultSet rs, Map<Integer, Integer> map) throws SQLException{
		EmpDTO dto = new EmpDTO();
		dto.setEmployee_id(rs.getInt("employee_id"));
		dto.setFirst_name(rs.getString("first_name"));
		dto.setLast_name(rs.getString("last_name"));
		dto.setEmail(rs.getString("email"));
		dto.sethire_date(rs.getDate("hire_date"));
		dto.setJob_id(rs.getString("job_id"));
		dto.setSalary(rs.getInt("salary"));
		dto.setDepartment_id(rs.getInt("department_id"));
		//생성자도 있으니까 변수에 저장해서 생성자에 바로 넣어줘도 됨 
		map.put(dto.getEmployee_id(), dto.getEmployee_id());
	}

}
