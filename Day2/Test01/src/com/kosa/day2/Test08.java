package com.kosa.day2;
/**
 * 
 * @author Qfactor 2016-10-05 args 보기 내장클래스 static 메소드 보기
 *
 */
public class Test08 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		 for (int i = 0; i < args.length; i++) { 
////		 run configuration 에서
////		 arguments를 주면 그 값을 출력
//		 System.out.println(args[i]);
//		 }

		int score = Integer.parseInt(args[0]); // Integer.parseInt는 String을 int
												// 형으로 바꿔준다.
		String s = String.valueOf(score); // 반대도 있다.

	}

}
