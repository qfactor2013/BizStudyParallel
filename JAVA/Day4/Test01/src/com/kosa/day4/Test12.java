package com.kosa.day4;

import java.awt.List;
import java.util.ArrayList;

public class Test12 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
			String 	s1	= 	new String("java");
			Integer	n	=	new Integer(53);
			Car		c	=	new Car();
			
			Object[] arr = new Object[3]; // Object는 모든 클래스의 어머니이기 때문에 다형성이 성립
			
			arr[0]	=	s1;
			arr[1]	=	n;
			arr[2]	=	c;
			
			String s2 	=	"java";    // 더 넣고 싶어도 배열은 공간이 한정 되어있어서 안됨
										// 그래서 리스트나 맵을 쓴다.
			
			ArrayList<Object> al = new ArrayList<>(3); // 미리 초기사이즈를 줄수도 안줄수도 있음
//<제네릭> : 파라미터 타입을 지정해주는 곳인데 지정안해줘도 되지만 경고표시가 남(구버전 duplicated)
			al.add(s1);
			al.add(s2);
			al.add(n);
			al.add(c);
			
			for (int i = 0; i < al.size(); i++) {
				System.out.println(al.get(i).toString());
			}
			
			
			for (Object a : al) {   // foreach 구문은 해당 객체안에 든 모든 것을 반복함
				if(a instanceof String)
				System.out.println(((String)a).toString());
				else if(a instanceof Integer)
				System.out.println(((Integer)a).toString());
				else if(a instanceof Car)
				System.out.println(((Car)a).toString());
			}
			
				
			
			ArrayList<String> 	al2 = new ArrayList<>();
			al2.add("포도");
			al2.add("딸기");
			al2.add("복숭아");
			al2.add(2,"키위");  // set과 같다.
			al2.set(0,"오렌지"); // add와 같다.
			al2.remove(1);
			al2.remove("키위");
			
			int num = al2.size();
			
			for (int i = 0; i < num; i++) {
				System.out.println(al2.toString());
				
			}
			
			
			
	}

}
