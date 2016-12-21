package step01.cookie;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

	
public class Cookie2Use extends HttpServlet {
	//login.html -> Cookie1Save -> Cookie2Use�� �̵�
	/* client pc�� ���� Cookie ���� ȹ��
	 * key=value������ ����� ��Ű ������ �����͸� key(id/pw)�� �̿��ؼ� ��ȯ
	 * ���̻� client�� ��Ű���� ���� 
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//�� ���ӵ� ����Ʈ(������)���� ���õ� 
		//��Ű ������ ��ü�� client �ý������� ���� ȹ��
		Cookie[] all = request.getCookies();
		String key = null;
		for(int i=0; i < all.length; i++){
			key = all[i].getName();  //��Ű ������ ������ key �̸��� ��ȯ�ϴ� �޼ҵ� 
			if( key.equals("id")){
				System.out.println("�����ڴ� client id : " + key);//id Ȯ�� 
				System.out.println("�����ڴ� client id�� ���ε� value : " + all[i].getValue());//id�� ���ε� ��(client�� �Է��� ������)
				//all[i].setValue("");
			}
		}
		
		//?3�ܰ� : client pc �� id�� �ش� �ϴ� ��Ű �� ����
		/* API���� ��Ű ���� ���� �޼ҵ� ����
		 * - client  �ý��ۿ� ����(addCookie()) ȣ���� �ʼ� */
		Cookie delete = new Cookie("id", null);
		response.addCookie(delete);
	}
}





