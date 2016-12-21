//url?
//http://ip:port/project��/�������ϸ�
/* ���� ����� �⺻ ����
 * 1. HelloServlet -> kosa �̸����� �����ؼ� ����
 * 2. http://ip:port/step01_basic/kosa
 * 3. ���� ����
 * 	4. ���� �ܼ�â Ȯ��
 * 5. ������ ���ΰ�ħ ������ �õ�(client �� �������ε��� ȿ���� test)
 * 		- ���� �ܼ�â Ȯ�� 
 * 	6. �������� ������ ��� ������ �ڵ�� ��ȯ
 * 		- �޼����� blue ������ ���
 * 		- ������ blue : html <font color �Ӽ�>
 */

package step01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet {
    public HelloServlet() {
    	System.out.println("������");
    }

    //client ��û�� �ڵ� ����
    /* ?
     * 1. �� �޼ҵ� ȣ�� ��ü?
     * 		- client�� url�� ��û �õ� -> tomcat(web container) �� ���� 
     * 		-> �ش� ��ü ���� Ȯ��
     * 		-> ��ü �� : ��ü ����, ��ü �� : �̹� �����ϴ� ��ü ����
     * 		-> doGet()�� web container�� ȣ��
     * 
     * 	2. �޼ҵ尡 ���� ȣ���̶� �ǹ� : �� �ΰ��� ��ü�� web container�� �����ؼ� 
     * 		�Ű������� �ݿ��ϸ鼭 ȣ��
     * 	
     * 		HttpServletRequest : �� ��ü�� �����Ǿ� �����ִ� client���� ��û ������ ������ ��ü
     * 		HttpServletResponse : "		 	"									"  ������ ���� ��ü
     * 
     * 3. web container�� ���� ��Ű�� ��ü
     * 		HelloServlet
     * 		HttpServletRequest
     * 		HttpServletResponse
     * 
     * 4. ȣ�� Ƚ���� ���� ��ü�� �ľ��� ����
     * 	- client�� 100�̰� ����
     * - client : HelloServlet ��ü�� : HttpServletRequest ��ü�� :  HttpServletResponse ��ü��
     * = 100  : 1 : 100 : 100
     * 
     */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//���� �ܼ�â�� ���
		System.out.println("doGet");
		
		//client�� �������� ���
		/* 1. �ѱ� ��� ������ ���ڵ� ����
		 * 2. �����͸� �������� ���(2byte ���) ��ü ����
		 * 3. ���� ��� */
		response.setContentType("text/html;charset=euc-kr");
		PrintWriter out = response.getWriter();
		out.println("<font color='blue'>�ȳ��ϼ���</font>");				
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
	}
}
