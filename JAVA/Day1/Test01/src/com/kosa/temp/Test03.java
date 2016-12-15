package com.kosa.temp;

public class Test03 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

			int num1 = 52;
			int num2 = 24;
			if( num1 > num2 )
			{
				System.out.println("num1 값이 더 큽니다.");
				System.out.println("num1 = " + num1 );
			}
			
			System.out.println("Done.");
		
			
			int score = 90;
			
			if(score >= 90)
			{
				System.out.println("A");
			}
			else if(score >= 80)
			{
				System.out.println("B");
			}
			else if(score >= 70)
			{
				System.out.println("C");
			}
			else if(score >= 60)
			{
				System.out.println("D");
			}
			else if(score < 60)
			{
				System.out.println("F");
			}
			
			char grade = 'E';
//			if(grade == 'A')
//				System.out.println("90점 이상입니다.");
//			else if(grade == 'B')
//				System.out.println("80점 이상입니다.");
//			else if(grade == 'C')
//				System.out.println("70점 이상입니다.");
//			else if(grade == 'D')
//				System.out.println("60점 이상입니다.");
//			else
//				System.out.println("60점 미만입니다.");
			
//			crtl + alt + 방향키 : 복사
//			alt + 방향키 : 이동
//			crtl + D : 한줄 삭제
//			crtl + / : 한줄 주석 처리
//			crtl + shift + / : 범위 주석 처리
//			crtl + shift + \ : 범위 주석 해제			
			
			switch(grade)
			{
				case 'A' : 
					System.out.println("90점 이상입니다.");
					break;
				case 'B' :
					System.out.println("80점 이상입니다.");
					break;
				case 'C' :
					System.out.println("70점 이상입니다.");
					break;
				case 'D' :
					System.out.println("60점 이상입니다.");
					break;
				default :
					System.out.println("60점 미만입니다.");
					break;
			}
			
			
			// 반복문
			int i = 0;
			int num = 1;
			
			while (i<5)
			{
				num += 1;
				i++;
			}
			
			do
			{
				num+= 1;
				i++;
			}while(i<5);
			
//			for(int i=0; i<5; i++)
//			{
//				num += 1;
//			}
//			
			
			
			
	}

}
