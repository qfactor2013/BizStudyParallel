package com.test.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import com.test.model.TestModel;
import com.test.util.DBUtil;


public class TestDAO {

	Connection conn = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
	int count = 0;
	
	private TestModel makeMember(ResultSet rs) throws SQLException{
		 int mno = rs.getInt(1); // rs���� ���� �� Į���̸� Ȥ�� select ���� ��� ����
		 String email = rs.getString(2);
		 String pwd = rs.getString(3);
		 String mname = rs.getString(4);
		 Date	cre_date1 = rs.getDate(5);
		 Date mod_date = rs.getDate(6);
		
		TestModel tm =  new TestModel(mno, email, pwd, mname, cre_date1, mod_date );
		return tm;
	}
	
	public List<TestModel> selectAll(){
		conn = DBUtil.getInstance().getConn();
		String sql = "select * from members";
		List<TestModel> list = new ArrayList<>();
		try {
//			pst = conn.prepareStatement(sql);
			pst = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE,
					ResultSet.CONCUR_UPDATABLE);
			rs 	= pst.executeQuery();
			rs.afterLast();
			/*while(rs.next()){
			list.add(makeMember(rs));
			}*/
			while(rs.previous()){ // �Ųٷ� ����.(Ŀ���� �������� �־)
				list.add(makeMember(rs));
			}
			
//			rs.absolute(5);                     // �� ������ �ʴ���.
//			rs.updateString(2, "�̸��ϼ���");
//			rs.updateString(3, "3333");
//			rs.updateRow();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(conn, pst, rs);
		}
		return list;
	}
	
	public TestModel selectOne(int mno){
		conn = DBUtil.getInstance().getConn();
		String sql = "select * from members where mno = ?";
		TestModel tm = null;
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, mno);
		/*	rs 	= pst.executeQuery();
			while(rs.next()){
				tm 	= makeMember(rs);	
			}*/
			
			if(pst.execute()){
				rs = pst.getResultSet();
				while(rs.next()){
					tm 	= makeMember(rs);
				}
			}else{
				//DML ����
				int result = pst.getUpdateCount(); // �۾��� ����� ����
				System.out.println("�۾� �Ǽ� : " + result);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("���� ã�� �� ����.");
			return null;
		}finally {
			DBUtil.close(conn, pst, rs);
		}
		return tm;
	}
	public int insert(TestModel tm){
		conn = DBUtil.getInstance().getConn();
		String sql = "insert into members(mno, email, pwd, mname, cre_date, mod_date)"
				+ " values(seq_mno.nextval,?,?,?,sysdate,sysdate)";
		int result = 0;
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, tm.getEmail());
			pst.setString(2, tm.getPwd());
			pst.setString(3, tm.getMname());
			result = pst.executeUpdate();
			
			if(result != 1){
				conn.rollback();
				return -999;
			}
			conn.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	public int update(TestModel tm){
		conn = DBUtil.getInstance().getConn();
		String sql = "update members set email = ?, pwd = ?, mname = ? where mno = ?";
		int result = 0;
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, tm.getEmail());
			pst.setString(2, tm.getPwd());
			pst.setString(3, tm.getMname());
			pst.setInt(4, tm.getMno());
			result = pst.executeUpdate();
			
			if(result != 1){
				conn.rollback();
				return -999;
			}
			conn.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	public String spCall(int mno) {
		conn = DBUtil.getInstance().getConn();
		String result = null;
		CallableStatement cst = null; // ���ν��� ȣ���� ���� ����Ѵ�.
		try {
			cst = conn.prepareCall("{call sp_member(?,?)}");
			cst.setInt(1, mno);
			cst.registerOutParameter(2, Types.VARCHAR);
			cst.executeQuery();
			result = cst.getString(2);
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("���� ã�� �� ����.");
			return null;
		}finally {
			DBUtil.close(conn, cst, rs);
		}
		return result;
	}
	
}
