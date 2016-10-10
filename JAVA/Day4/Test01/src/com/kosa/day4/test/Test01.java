package com.kosa.day4.test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

public class Test01 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		User u1 = new User("압둘라", "아프가니스탄");
		User u2 = new User("엠마왓슨", "영국");
		User u3 = new User("토니스타크", "미국");
		User u4 = new User("괴링", "독일");
		User u5 = new User("무솔리니", "이탈리아");

		ArrayList<User> alu = new ArrayList<>();

		alu.add(u1);
		alu.add(u2);
		alu.add(u3);
		alu.add(u4);
		alu.add(u5);

		userInfo(alu);
		
		Map<String, Object> map	=	new HashMap<>();
		map.put(u1.name, u1.nation);
		map.put(u2.name, u2.nation);
		map.put(u3.name, u3.nation);
		map.put(u4.name, u4.nation);
		map.put(u5.name, u5.nation);
		
		userInfoMap(map);
	}

	public static void userInfo(ArrayList<User> u) {
//		System.out.println(u.toString());  // 요것도 되기는 됨
		for (int i = 0; i < u.size(); i++) {
			System.out.println(u.get(i).toString());
		}
	}
	
	public static void userInfoArrayList(ArrayList<User> u) {
		// 이게 성능이 좀 더 좋다.
		Iterator<User> iterator = u.iterator(); // 반복자
			while(iterator.hasNext()) // 인덱스의 다음커서에 값이 있으면 true
				System.out.println(iterator.next().toString()); // 다음 커서의 값을 가져온다(User)
}
	public static void userInfoMap(Map<String, Object> map) {
		// 인덱스의 다음커서에 값이 있으면 true
		for (Entry<String, Object> iterator : map.entrySet()) {
			System.out.println(iterator.toString()); // 다음 커서의 값을 가져온다(User)
		}	
	}
	
}
class User {
	String name;
	String nation;

	@Override
	public String toString() {
		return "User [name=" + name + ", nation=" + nation + "]";
	}

	public User(String name, String nation) {
		this.name = name;
		this.nation = nation;
	}

	public User() {
	}

	}