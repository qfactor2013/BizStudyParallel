package com.samepage.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import util.DBUtil;

//Business Logic구현 
//DAO(Data Access Object)
public class MemberDAO {
    final String SELECT_ALL = "select mno,email,"
    		+ "pwd,mname, "
    		+ "cre_date, mod_date from members";
    final String SELECT_BYMNO= SELECT_ALL + " where mno=?";
    final String INSERT_MEMBER="insert into members"
    		   + " values(seq_mno.nextval,?,?,?,sysdate,null)";
    final String UPDATE_MEMBER ="update members "
    		+ "set email=?,pwd=?,mname=?,"
    		+ "mod_date=sysdate where mno=?";
    final String DELETE_MEMBER="delete from members "
    		+ "where mno=?";
    
    Connection conn = null;
    PreparedStatement st=null;
    ResultSet rs = null;
    int count=0;
    private MemberDTO makeMember(ResultSet rs) 
    		                		throws SQLException{
    	//지역변수(Local)--함수내의 변수 
    	int mno = rs.getInt(1) ; //rs에서 읽을때 칼럼이름 
    	String email = rs.getString(2);//혹은 select순서 모두가능 
    	String pwd = rs.getString(3);
    	String mname = rs.getString(4);
    	Date  cre_date = rs.getDate(5);
    	Date mod_date = rs.getDate(6); 
    	MemberDTO member = new MemberDTO(mno, email, pwd, mname, cre_date, mod_date);
    	return member;
    }
	public List<MemberDTO> selectAll(){
		List<MemberDTO> mlist = new ArrayList<>();
		conn = DBUtil.getConnect();
		 
		try {
			st = conn.prepareStatement(SELECT_ALL, 
					ResultSet.TYPE_SCROLL_SENSITIVE,
					ResultSet.CONCUR_UPDATABLE);
			rs = st.executeQuery();
			rs.afterLast(); //마지막번째로 이동 
			while(rs.previous()){
				MemberDTO mem = makeMember(rs);
				mlist.add(mem);
			}
			boolean b = rs.absolute(1);
			System.out.println(b);
			rs.updateString(2, "12345이메일수정");
			rs.updateString(3, "667788");
			rs.updateRow();
			
			/*rs.deleteRow();
			rs.updateRow();*/
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, st, rs);
			
		}
		return mlist;
	}
	
	public MemberDTO selectByMno(int mno){
		MemberDTO mem=null;
		conn = DBUtil.getConnect();
		try {
			st = conn.prepareStatement(SELECT_BYMNO);
			st.setInt(1, mno);
			/*rs = st.executeQuery();
			if(rs.next()) 
				 mem = makeMember(rs);*/
			if(st.execute()){ //select수행한거임
			   rs = st.getResultSet();
			   if(rs.next()) 
					 mem = makeMember(rs);
			}else{
				//DML수행한거임 
				int result = st.getUpdateCount();
				System.out.println("영향받은건수:" + result);
			}
			 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, st, rs);
		}
		return mem;
	}
	public int insetMember(MemberDTO member){
		conn = DBUtil.getConnect();
		
		try {
			conn.setAutoCommit(false);
			st = conn.prepareStatement(INSERT_MEMBER);
		    st.setString(1, member.getEmail());
		    st.setString(2, member.getPwd());
		    st.setString(3, member.getMname());
		    count = st.executeUpdate();	//insert~	    
		   //count = st.executeUpdate(); //insert~
		    conn.commit();
		} catch (SQLException e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, st, rs);
		}
		return count;
	}
	public int updateMember(MemberDTO member){
		conn = DBUtil.getConnect();
		try {
			st = conn.prepareStatement(UPDATE_MEMBER);
		    st.setString(1, member.getEmail());
		    st.setString(2, member.getPwd());
		    st.setString(3, member.getMname());
		    st.setInt(4, member.getMno());
		    count = st.executeUpdate();		    
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, st, rs);
		}
		return count;
	}
	public int deleteMember(int mno){
		conn = DBUtil.getConnect();
		try {
			st = conn.prepareStatement(DELETE_MEMBER);
		    st.setInt(1, mno);
		    count = st.executeUpdate();		    
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, st, rs);
		}
		return count;
	}
	
	public String spCall(int mno){
		String mname=""; 
		conn = DBUtil.getConnect();
		CallableStatement cst = null;
		try {
			cst = conn.prepareCall("{call sp_member(?,?)}"); 
			cst.setInt(1, mno);
			cst.registerOutParameter(2, Types.VARCHAR);
			cst.executeQuery();
			mname = cst.getString(2);	 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, cst, null);
		}
		return mname;
	}
	
}






