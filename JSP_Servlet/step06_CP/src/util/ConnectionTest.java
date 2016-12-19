//jsp���� �� Ŭ������ ���ؼ� Ŀ�ؼ� ��û

package util;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ConnectionTest {

	//static{}���� �ʱ�ȭ, getConnection���� ���
	//����� ���� �ʼ�
	static DataSource ds;
	//server�� ���� �����κ��� Connection ��ü�� �����ϴ� DataSource ��ü ȹ��
	// tomcat JNDI configuration step 3
	static{
		try {
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/myoracle");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//�������� Connection ��ü�� ���� �� �������ִ� ��ü(DataSource)�κ��� Connection ��ü ����
	public static Connection getConnection(){
		
		Connection conn = null;
		try {
			conn = ds.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			return conn;			
		
	}
	
}
