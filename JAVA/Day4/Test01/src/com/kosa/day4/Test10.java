package com.kosa.day4;

public class Test10 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String s1 = new String("java");
		String s2 = new String("java");
		String s3 = "java";   // new 를 안하고 이렇게 값을 바로 넣어주면 String Pool 이란 곳에 생성함
		String s4 = "java";   // 그래서 새로 만들어도 Pool에서 값을 찾기 때문에 같은 주소를 갖게 됨

		if(s1 == s2) // == 으로 하게 되면 주소값을 비교하기 때문에.... 다름이 나옴
		{
			System.out.println("같음");
		}
		else{
			System.out.println("다름");
		}
		
		if(s3 == s4) // 이건 주소값이 같다.
		{
			System.out.println("같음");
		}
		
		if(s1.equals(s2)) // .equals()로 하게 되면 값을 비교한다.
		{
			System.out.println("같음");
		}
		
		for (int i = 0; i < s1.length(); i++) {
			char c = s1.charAt(i); // 위치에 해당하는 값을 가져옴(j)
			System.out.println(i+" : " + c);
			
		}
		
		String s5 = "java program";
		
		System.out.println(s5.substring(3));  // index 3 부터 출력
		System.out.println(s5.substring(3,7)); // index 3 부터 7까지 출력
		
		String s6 = "    JAVA	";
		System.out.println(s6.length());
		System.out.println(s6.trim()); 		// 앞뒤 공백 제거(탭도 포함)하지만 실제도 저장되지 않으니까
		s6 = s6.trim();						// 이렇게 새로 저장해줘야됨
		System.out.println(s6.length());
		
		System.out.println(s5.toUpperCase()); // 대문자로 치환
		System.out.println(s6.toLowerCase()); // 소문자로 치환
		
		System.out.println(s5 = s5.replace("java", "python")); // 인자 1단어를 찾아 인자 2단어로 변경
		System.out.println(s5.indexOf("yth")); // 해당 단어가 시작하는 index를 찾는다.
		System.out.println(s5.lastIndexOf("pro")); // 해당단어가 있는 마지막 index를 찾는다.
		
		
		System.out.println(s5.replace("java", "php"));
	}

}
