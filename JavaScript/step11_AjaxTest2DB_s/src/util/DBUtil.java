package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBUtil {
	private static DataSource ds;
	static{
		InitialContext ctx = null;
		try {
			ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracleDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	public static Connection getConnection() throws SQLException{
		return ds.getConnection();
	}
	public static void close(Connection conn, PreparedStatement pstmt, ResultSet rset){
		if(rset!=null){
			try{
				rset.close();
			}catch(SQLException e){}
		}
		if(pstmt!=null){
			try{
				pstmt.close();
			}catch(SQLException e){}
		}
		if(conn!=null){
			try{
				conn.close();
			}catch(SQLException e){}
		}
	}
	public static void close(Connection conn, PreparedStatement pstmt){
		
		if(pstmt!=null){
			try{
				pstmt.close();
			}catch(SQLException e){}
		}
		if(conn!=null){
			try{
				conn.close();
			}catch(SQLException e){}
		}
	}
}
