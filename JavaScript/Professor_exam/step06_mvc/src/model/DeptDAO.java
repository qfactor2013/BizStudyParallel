package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.domain.Dept;
import util.DBUtil;

public class DeptDAO {
	//부서 번호 
	public static ArrayList<Integer> getDeptnos() throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Integer> data = null;
		try{
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("select deptno from dept");
			rset = pstmt.executeQuery();
			
			data = new ArrayList<Integer>();
			while(rset.next()){
				data.add(rset.getInt(1));
			}
		}finally{
			DBUtil.close(con, pstmt, rset);
		}
		return data;
	}
	
	
	//부서명
	public static ArrayList<String> getDnames() throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<String> data = null;
		try{
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("select dname from dept");
			rset = pstmt.executeQuery();
			
			data = new ArrayList<String>();
			while(rset.next()){
				data.add(rset.getString(1));
			}
		}finally{
			DBUtil.close(con, pstmt, rset);
		}
		return data;
	}
	
	//모든 부서 정보 반환
	//JSON 형태로 응답(서버관점 : 순수 문자열)/ deptView.jsp에서 json형태의 문자열 -> json 객체로 변환 -> key 로 value 활용
	//json lib 필수로 활용 
	public static ArrayList<Dept> getDept() throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Dept> data = null;
		try{
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("select * from dept");
			rset = pstmt.executeQuery();
			
			data = new ArrayList<Dept>();
			while(rset.next()){
				data.add(new Dept(rset.getInt(1), rset.getString(2), rset.getString(3)));
			}
		}finally{
			DBUtil.close(con, pstmt, rset);
		}
		return data;
	}
}



