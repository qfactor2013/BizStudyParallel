package com.kosa.day3.polymorphism;
/**
 * 
 * @author Qfactor 2016-10-06
 * 			다형성에 대해 
 *			
 */
public class PolymorphismTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
			A a = new C(); // 된다. 하지만 C에 있는 걸 쓸 수는 없다.
			C c = new C(); // 된다. 하지만 C에 있는 걸 쓸 수는 없다.
			
//			((C)a).n3 // 하지만 만들기는 C로 만들었기 때문에 타입캐스팅을 하면 가능하다.
			
//			다형성을 쓰는 이유는 똑같은 기능을 하는 각각 다른 객체들을 한번 더 묶어서 중복을 없애기 위해 
			
//			C s = new A(); // 안 된다. 왜? A를 만들어놓고 C에 할당하려고 하기 때문(Scope OverFlow)
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