package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.domain.Dept;
import util.DBUtil;

public class DeptDAO {
	//�μ� ��ȣ 
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
	
	
	//�μ���
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
	
	//��� �μ� ���� ��ȯ
	//JSON ���·� ����(�������� : ���� ���ڿ�)/ deptView.jsp���� json������ ���ڿ� -> json ��ü�� ��ȯ -> key �� value Ȱ��
	//json lib �ʼ��� Ȱ�� 
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



