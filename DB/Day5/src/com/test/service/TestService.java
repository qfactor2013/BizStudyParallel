package com.test.service;

import java.util.Map;

import com.test.model.TestModel;

public interface TestService {

	public Map<String, TestModel> selectAll();
	public Map<String, TestModel> selectOne(int id);
	public int insert(TestModel model);
	public int updateTest(TestModel model);
	public int deleteOne(int id);
	
}
