package com.kosa.temp;

public class Test03 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

			int num1 = 52;
			int num2 = 24;
			if( num1 > num2 )
			{
				System.out.println("num1 ���� �� Ů�ϴ�.");
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
//				System.out.println("90�� �̻��Դϴ�.");
//			else if(grade == 'B')
//				System.out.println("80�� �̻��Դϴ�.");
//			else if(grade == 'C')
//				System.out.println("70�� �̻��Դϴ�.");
//			else if(grade == 'D')
//				System.out.println("60�� �̻��Դϴ�.");
//			else
//				System.out.println("60�� �̸��Դϴ�.");
			
//			crtl + alt + ����Ű : ����
//			alt + ����Ű : �̵�
//			crtl + D : ���� ����
//			crtl + / : ���� �ּ� ó��
//			crtl + shift + / : ���� �ּ� ó��
//			crtl + shift + \ : ���� �ּ� ����			
			
			switch(grade)
			{
				case 'A' : 
					System.out.println("90�� �̻��Դϴ�.");
					break;
				case 'B' :
					System.out.println("80�� �̻��Դϴ�.");
					break;
				case 'C' :
					System.out.println("70�� �̻��Դϴ�.");
					break;
				case 'D' :
					System.out.println("60�� �̻��Դϴ�.");
					break;
				default :
					System.out.println("60�� �̸��Դϴ�.");
					break;
			}
			
			
			// �ݺ���
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
