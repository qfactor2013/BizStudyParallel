//jsp���� �� Ŭ������ ���ؼ� Connection ��û

package util;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ConnectionTest {
	
	//static{}���� �ʱ�ȭ, getConnection���� ���
	//����� ���� �ʼ� 
	static DataSource ds;
	
	//server�� ���� ������ ���� Connection ��ü�� �����ϴ� DataSource ��ü ȹ�� 
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
	
	
	//�������� Connection ��ü�� ���� �� �������ִ� ��ü(DataSource)�� ���� Connection ȹ�� �� ��ȯ
	public static Connection getConnection(){
		Connection con = null;//����
		try {
			con = ds.getConnection();//�ʱ�ȭ
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;//��ȯ
	}
}



