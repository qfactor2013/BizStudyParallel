package com.test.service;

import java.util.List;

import com.test.model.TestModel;

public interface TestService {

	public List<TestModel> selectAll();
	public TestModel selectOne(int id);
	public int insert(TestModel model);
	public int updateTest(TestModel model);
	public int deleteOne(int id);
	public String spCall(int mno);
}



