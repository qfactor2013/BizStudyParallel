/**
 * 
 */
package com.kosa.day2;

/**
 * @author Qfactor 2016-10-05
 * 			���������� Ȯ���ϴ� �׽�Ʈ ����
 *
 */
public class DateTest {
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
			Date d 	= new Date();
//			d.year 	= 2016;
//			d.month = 10;
//			d.day 	= 31;
			
			d.setYear(2016);
			d.setMonth(10);  // �� ���͸޼ҵ� �ȿ��� ��ȿ�� ���� ������ © �� �־��!
			d.setDay(31);
			
			d.print();
	}

}
