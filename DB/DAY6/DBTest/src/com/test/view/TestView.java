package com.test.view;

import java.util.List;
import com.test.model.TestModel;

public class TestView {

	public static void print(List<TestModel> list){
		System.out.println(">>========== 여러건 출력 ===========<<");
		
		for (TestModel testModel : list) {
			System.out.println(testModel);
		}
	}
	
	public static void print(TestModel tm){
		System.out.println(">>========== 한 건 출력 ===========<<");

			System.out.println(tm);
	}
	
}
