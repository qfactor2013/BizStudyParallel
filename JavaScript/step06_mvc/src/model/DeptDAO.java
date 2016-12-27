package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import util.DBUtil;

public class DeptDAO {
	public static ArrayList<Integer> getDeptnos() throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Integer> data = null;
		
		try{
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement("select deptno from dept");
			rs = pstmt.executeQuery();
			
			data = new ArrayList<>();
			while(rs.next()){
				data.add(rs.getInt(1));
			}
		}finally {
			DBUtil.close(conn, pstmt, rs);
		}
		return data;
	}
	
	public static ArrayList<Dept> getDept() throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Dept> data = null;
		
		try{
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement("select * from dept");
			rs = pstmt.executeQuery();
			
			data = new ArrayList<>();
			while(rs.next()){
				data.add(new Dept(rs.getInt(1), rs.getString(2), rs.getString(3)));
			}
		}finally {
			DBUtil.close(conn, pstmt, rs);
		}
		return data;
	}
	
	public static JSONArray getDeptJSON() throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		JSONArray  jsonArray = new JSONArray();
		JSONObject jsonChild = new JSONObject();
		
		try{
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement("select * from dept");
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				jsonChild.put("deptno", rs.getInt(1));
				jsonChild.put("dname",	rs.getString(2));
				jsonChild.put("loc", rs.getString(3));
				jsonArray.add(jsonChild);
			}
			
			
		}finally {
			DBUtil.close(conn, pstmt, rs);
		}
		return jsonArray;
	}
}
