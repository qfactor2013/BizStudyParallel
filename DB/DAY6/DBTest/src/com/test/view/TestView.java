package com.test.view;

import java.util.List;
import com.test.model.TestModel;

public class TestView {

	public static void print(List<TestModel> list){
		System.out.println(">>========== ������ ��� ===========<<");
		
		for (TestModel testModel : list) {
			System.out.println(testModel);
		}
	}
	
	public static void print(TestModel tm){
		System.out.println(">>========== �� �� ��� ===========<<");

			System.out.println(tm);
	}
	
}
