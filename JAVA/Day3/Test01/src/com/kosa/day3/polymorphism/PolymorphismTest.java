package com.kosa.day3.polymorphism;
/**
 * 
 * @author Qfactor 2016-10-06
 * 			�������� ���� 
 *			
 */
public class PolymorphismTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
			A a = new C(); // �ȴ�. ������ C�� �ִ� �� �� ���� ����.
			C c = new C(); // �ȴ�. ������ C�� �ִ� �� �� ���� ����.
			
//			((C)a).n3 // ������ ������ C�� ������� ������ Ÿ��ĳ������ �ϸ� �����ϴ�.
			
//			�������� ���� ������ �Ȱ��� ����� �ϴ� ���� �ٸ� ��ü���� �ѹ� �� ��� �ߺ��� ���ֱ� ���� 
			
//			C s = new A(); // �� �ȴ�. ��? A�� �������� C�� �Ҵ��Ϸ��� �ϱ� ����(Scope OverFlow)
	}

}

class A {
	int n1;
}

class B extends A {
	int n2;
}

class C extends B {
	int n3;
}