package guestbook.model;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.DBUtil;

public class GuestBookDAO {
	
	// �Խù� ���
	//end user�� insert�õ�
	/*�߻� ������ ����� ��
	 * 1. ���� insert
	 * 2. ����(WAS) ���� �߻��� ������ ����
	 * 3. DB ���� ���� "	
	 * 4. ������ ID �ߺ� : ���� �߻� */
	public static boolean writeContent(GuestBookBean vo) throws SQLException{
		Connection con = null;	
		PreparedStatement pstmt = null;
		boolean result = false;
		
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
		}finally{
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
				vo = new GuestBookBean(num,rset.getString(1),
						rset.getString(2),rset.getString(3),rset.getString(4).replaceAll("</n>","<br>"),
						rset.getString(5),rset.getString(6),rset.getInt(7));
			}
		}finally{
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
		}finally{
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
		}finally{
			DBUtil.close(pstmt, con);
		}
		return result;
	}
	
	// ��� �Խù� ��ȸ
	public  static ArrayList<GuestBookBean> getAllContents() throws SQLException{
		Connection con = null;	
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<GuestBookBean> alist = null;
		String sql="SELECT num,title,author,email,content,password," +
				"to_char(writeday,'yyyy/mm/dd hh24:mi:ss')," +
				"readnum from gbook order by num desc";	
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement(sql);
			rset = pstmt.executeQuery();
			alist = new ArrayList<GuestBookBean>();
			while(rset.next()){
				alist.add(new GuestBookBean(rset.getInt(1),rset.getString(2),
						rset.getString(3),rset.getString(4),rset.getString(5)
		 				,rset.getString(6),rset.getString(7),rset.getInt(8)));
			}
		}finally{
			DBUtil.close(rset, pstmt, con);
		}
		return alist;
	}
}
