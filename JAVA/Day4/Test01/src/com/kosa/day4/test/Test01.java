package com.kosa.day4.test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

public class Test01 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		User u1 = new User("�еѶ�", "�������Ͻ�ź");
		User u2 = new User("�����ӽ�", "����");
		User u3 = new User("��Ͻ�Ÿũ", "�̱�");
		User u4 = new User("����", "����");
		User u5 = new User("���ָ���", "��Ż����");

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
//		System.out.println(u.toString());  // ��͵� �Ǳ�� ��
		for (int i = 0; i < u.size(); i++) {
			System.out.println(u.get(i).toString());
		}
	}
	
	public static void userInfoArrayList(ArrayList<User> u) {
		// �̰� ������ �� �� ����.
		Iterator<User> iterator = u.iterator(); // �ݺ���
			while(iterator.hasNext()) // �ε����� ����Ŀ���� ���� ������ true
				System.out.println(iterator.next().toString()); // ���� Ŀ���� ���� �����´�(User)
}
	public static void userInfoMap(Map<String, Object> map) {
		// �ε����� ����Ŀ���� ���� ������ true
		for (Entry<String, Object> iterator : map.entrySet()) {
			System.out.println(iterator.toString()); // ���� Ŀ���� ���� �����´�(User)
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