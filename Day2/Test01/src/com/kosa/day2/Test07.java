package com.kosa.day2;

/**
 * @author Qfactor 2016-10-05 static�� ���
 */
public class Test07 {
	public static void main(String[] args) { // args arguments �� �ڹ����� ����ÿ� �� ����(String �迭)
		Calc c1 = new Calc();
		Calc c2 = new Calc();

		c1.total++;
		c2.total++;
		c1.grandTotal++;
		c2.grandTotal++;

		System.out.println(c1.total);
		System.out.println(c2.total);
		System.out.println(c1.grandTotal);
		System.out.println(c2.grandTotal);

		c1.test1();
		c2.test2();
		
		Calc.test1();
	}
}

class Calc {
	// int total;// c1.total 1 c2.total 1
	// int grandTotal;// c1.grandTotal 1 c2.grandTotal 1

	// ������ static�� �ְ� �Ǹ� �� ������ �����ϰ� �ȴ�.(������ ����)
	// ��? �̸� �޸𸮿� �ε�ǰ� �Ǿ� stack�� ��ü ���� ��
	// static���� ������ ���� ���� �� ����� �̸� ������ �� �κ��� ����Ŵ.(class ����)(�ݴ�� instance ����)
	// (code ����, �ּҰ��� ���� ������ �޸�)
	int total;// c1.total 1 c2.total 1
	static int grandTotal; // c1.grandTotal 2 c2.grandTotal 2

	public static void test1() {
		System.out.println("test1");
	}

	public void test2() {
		System.out.println("test2");
	}

}
