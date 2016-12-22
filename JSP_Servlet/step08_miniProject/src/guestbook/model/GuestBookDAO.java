package guestbook.model;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import util.DBUtil;

public class GuestBookDAO {

	
	// ������ �����Ͽ� DBUtil�� ���� ��
//	static DataSource DBUtil = null;
//	
//	static{		 
//		try {
//			Context initContext = new InitialContext();		
//			Context envContext			
//			= (Context)initContext.lookup("java:/comp/env");
//			
//			DBUtil = (DataSource)envContext.lookup("jdbc/myoracle");
//		} catch (NamingException e) {			
//			e.printStackTrace();
//		}	
//	}
		
	
	// �Խù� ���
	/*
	 * end user�� insert �õ�
	 * �߻� ������ ����� ��
	 * 1. ���� insert
	 * 2. ����(WAS) ���� �߻� ������ ����
	 * 3. DB ���� ����
	 * 4. ������ ID �ߺ� : ���� �߻�
	 */
	public static boolean writeContent(GuestBookBean vo) throws SQLException{
		Connection con = null;	
		PreparedStatement pstmt = null;
		boolean result = false;
		
		// ������ �Ⱦ��ٸ� �׳� �ϵ��ڵ��Ѵ�.
//		String sql = "INSERT INTO gbook VALUES(seq_gbook.nextval,?,?,?,?,?,sysdate,0)";
		
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("INSERT INTO gbook VALUES(seq_gbook.nextval,?,?,?,?,?,sysdate,0)");

	        pstmt.setString(1,vo.getTitle());
	        pstmt.setString(2,vo.getAuthor());
	        pstmt.setString(3, vo.getEmail());
	        pstmt.setString(4, vo.getContent());
	        pstmt.setString(5, vo.getPassword());
			int count = pstmt.executeUpdate();			
			if(count != 0){
				result = true;
			}
			
		} 
		// catch�� ó���ϱ� ���� ������ �ٸ����� ó���Ѵ�.
//		catch (SQLException e) {
//			e.printStackTrace();
//		}
		finally{
			DBUtil.close(pstmt, con);
		}
		return result;		
	}
	
	// �Խù� ��ȸ - boolean flag �� = read�� ��� true, update�� ���  false
	public static GuestBookBean getContent(int  num, boolean flag) throws SQLException{		
		Connection con = null;	
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		GuestBookBean vo  = null;
		String sql1="UPDATE gbook set readnum=readnum+1 WHERE num=?";	
		
		String sql2="SELECT title,author,email,content,password, to_char(writeday,'yyyy/mm/dd hh24:mi:ss'), readnum from gbook WHERE num=?";

		try {
			con = DBUtil.getConnection();
			if(flag){
				pstmt = con.prepareStatement(sql1);
				pstmt.setInt(1, num);
				int count = pstmt.executeUpdate();
				if(count == 0){
					return vo;
				}
			}
			pstmt = con.prepareStatement(sql2);
			pstmt.setInt(1, num);	
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				vo = 	new GuestBookBean(num,rset.getString(1),
						rset.getString(2),rset.getString(3),rset.getString(4).replaceAll("</n>","<br>"),
						rset.getString(5),rset.getString(6),rset.getInt(7));
			}

			
		} 
		// catch�� ó���ϱ� ���� ������ �ٸ����� ó���Ѵ�.
//		catch (SQLException e) {
//			e.printStackTrace();
//		}
		finally{
			DBUtil.close(pstmt, con);
		}
		return vo;
	}
	
	//�Խù� ����
	public  static boolean deleteContent(int num, String password) throws SQLException{
		Connection con = null;	
		PreparedStatement pstmt = null;
		boolean result = false;
		
		String sql="DELETE FROM gbook WHERE num=? and password=?";
		
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement(sql);

	        pstmt.setInt(1,num);
	        pstmt.setString(2,password);

			int count = pstmt.executeUpdate();
			
			if(count != 0){
				result = true;
			}
			
		} 		
		// catch�� ó���ϱ� ���� ������ �ٸ����� ó���Ѵ�.
//		catch (SQLException e) {
//		e.printStackTrace();
//	}
		finally{
			DBUtil.close(pstmt, con);
		}
		return result;
	}
	
	// �Խù� ����
	public  static boolean updateContent(GuestBookBean vo) throws SQLException{
		Connection con = null;	
		PreparedStatement pstmt = null;
		boolean result = false;
				
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("UPDATE gbook set title=?,author=?,email=?,content=? WHERE num=? AND password=?");

			pstmt.setString(1,vo.getTitle());
		    pstmt.setString(2,vo.getAuthor());
		    pstmt.setString(3, vo.getEmail());
		    pstmt.setString(4, vo.getContent());
		    pstmt.setInt(5, vo.getNum());
		    pstmt.setString(6, vo.getPassword());

			int count = pstmt.executeUpdate();
			
			if(count != 0){
				result = true;
			}
			
		} 
		// catch�� ó���ϱ� ���� ������ �ٸ����� ó���Ѵ�.
//		catch (SQLException e) {
//			e.printStackTrace();
//		}
		finally{
			DBUtil.close(pstmt, con);
		}
		return result;
		
	}
	
	// ��� �Խù� ��ȸ
	public  static ArrayList<GuestBookBean> getAllContents() throws SQLException{
		Connection con = null;	
		PreparedStatement pstmt = null;
		ResultSet rset = null;
//		GuestBookBean[] list  = null; //���� �迭�� �� �ʿ䰡 �����Ƿ�
		ArrayList<GuestBookBean> alist = null;
		
		String sql="SELECT num,title,author,email,content,password," +
				"to_char(writeday,'yyyy/mm/dd hh24:mi:ss')," +
				"readnum from gbook order by num desc";	
		
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement(sql);
			rset = pstmt.executeQuery();
			alist = new ArrayList<>();
			
			while(rset.next()){
			
				alist.add(new GuestBookBean(rset.getInt(1),rset.getString(2),
						rset.getString(3),rset.getString(4),rset.getString(5)
		 				,rset.getString(6),rset.getString(7),rset.getInt(8)));
			}
//			list = new GuestBookBean[alist.size()];
//			alist.toArray(list); // ���� �迭�� �� �ʿ䰡 �����Ƿ�
			
		} 
		// catch�� ó���ϱ� ���� ������ �ٸ����� ó���Ѵ�.
//		catch (SQLException e) {
//			e.printStackTrace();
//		}
		finally{
			DBUtil.close(rset, pstmt, con);
		}
		return alist;
	}
	
//  DBUtil.close �޼ҵ�鵵 DBUtil�� ���� ��
//	public  static void DBUtil.close(Statement stmt, Connection con){
//		try{
//			if(stmt != null){
//				stmt.DBUtil.close();
//				stmt = null;
//			}
//			if(con != null){
//				con.DBUtil.close();
//				con = null;
//			}
//		}catch(SQLException e){
//			e.printStackTrace();
//		}
//	}
//	public  static void DBUtil.close(ResultSet rset, Statement stmt, Connection con){
//		try{
//			if(rset != null){
//				rset.DBUtil.close();			
//			}
//			if(stmt != null){
//				stmt.DBUtil.close();				
//			}
//			if(con != null){
//				con.DBUtil.close();				
//			}
//		}catch(SQLException e){
//			e.printStackTrace();
//		}
//	}
}
