package com.kosa.day4;

import java.awt.List;
import java.util.ArrayList;

public class Test12 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
			String 	s1	= 	new String("java");
			Integer	n	=	new Integer(53);
			Car		c	=	new Car();
			
			Object[] arr = new Object[3]; // Object�� ��� Ŭ������ ��Ӵ��̱� ������ �������� ����
			
			arr[0]	=	s1;
			arr[1]	=	n;
			arr[2]	=	c;
			
			String s2 	=	"java";    // �� �ְ� �; �迭�� ������ ���� �Ǿ��־ �ȵ�
										// �׷��� ����Ʈ�� ���� ����.
			
			ArrayList<Object> al = new ArrayList<>(3); // �̸� �ʱ����� �ټ��� ���ټ��� ����
//<���׸�> : �Ķ���� Ÿ���� �������ִ� ���ε� ���������൵ ������ ���ǥ�ð� ��(������ duplicated)
			al.add(s1);
			al.add(s2);
			al.add(n);
			al.add(c);
			
			for (int i = 0; i < al.size(); i++) {
				System.out.println(al.get(i).toString());
			}
			
			
			for (Object a : al) {   // foreach ������ �ش� ��ü�ȿ� �� ��� ���� �ݺ���
				if(a instanceof String)
				System.out.println(((String)a).toString());
				else if(a instanceof Integer)
				System.out.println(((Integer)a).toString());
				else if(a instanceof Car)
				System.out.println(((Car)a).toString());
			}
			
				
			
			ArrayList<String> 	al2 = new ArrayList<>();
			al2.add("����");
			al2.add("����");
			al2.add("������");
			al2.add(2,"Ű��");  // set�� ����.
			al2.set(0,"������"); // add�� ����.
			al2.remove(1);
			al2.remove("Ű��");
			
			int num = al2.size();
			
			for (int i = 0; i < num; i++) {
				System.out.println(al2.toString());
				
			}
			
			
			
	}

}
