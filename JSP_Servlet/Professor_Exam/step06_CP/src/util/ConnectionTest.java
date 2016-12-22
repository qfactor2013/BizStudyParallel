//jsp에서 이 클래스를 통해서 Connection 요청

package util;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ConnectionTest {
	
	//static{}에서 초기화, getConnection에서 사용
	//멤버로 선언 필수 
	static DataSource ds;
	
	//server의 설정 정보로 부터 Connection 객체를 관리하는 DataSource 객체 획득 
	static{
		try {
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/myoracle");
			Connection conn = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	//서버에서 Connection 객체를 관리 및 제공해주는 객체(DataSource)로 부터 Connection 획득 및 반환
	public static Connection getConnection(){
		Connection con = null;//선언
		try {
			con = ds.getConnection();//초기화
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;//반환
	}
}



