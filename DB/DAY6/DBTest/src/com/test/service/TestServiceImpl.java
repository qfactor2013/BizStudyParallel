package com.test.service;

import java.util.List;

import com.test.dao.TestDAO;
import com.test.model.TestModel;

public class TestServiceImpl implements TestService {

	TestDAO dao = new TestDAO();
	
	@Override
	public List<TestModel> selectAll() {
		return dao.selectAll();
		// TODO Auto-generated method stub
	
	}

	@Override
	public TestModel selectOne(int id) {
		// TODO Auto-generated method stub
		return dao.selectOne(id);
	}

	@Override
	public int insert(TestModel model) {
		// TODO Auto-generated method stub
		int result = dao.insert(model);
		
		if(result == 1){
			System.out.println("성공적으로 입력되었다.");
		}else{
			System.out.println("입력 실패 롤백되었다.");
		}
		
		return result;
	}

	@Override
	public int updateTest(TestModel model) {
		// TODO Auto-generated method stub
		int result = dao.update(model);
		
		if(result == 1){
			System.out.println("성공적으로 입력되었다.");
			System.out.println(selectOne(model.getMno()));
		}else{
			System.out.println("입력 실패 롤백되었다.");
		}
		
		return result;
	}

	@Override
	public int deleteOne(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String spCall(int mno) {
		return dao.spCall(mno);
	}

}
