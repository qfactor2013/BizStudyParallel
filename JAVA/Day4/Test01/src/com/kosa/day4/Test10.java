package com.kosa.day4;

public class Test10 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String s1 = new String("java");
		String s2 = new String("java");
		String s3 = "java";   // new �� ���ϰ� �̷��� ���� �ٷ� �־��ָ� String Pool �̶� ���� ������
		String s4 = "java";   // �׷��� ���� ���� Pool���� ���� ã�� ������ ���� �ּҸ� ���� ��

		if(s1 == s2) // == ���� �ϰ� �Ǹ� �ּҰ��� ���ϱ� ������.... �ٸ��� ����
		{
			System.out.println("����");
		}
		else{
			System.out.println("�ٸ�");
		}
		
		if(s3 == s4) // �̰� �ּҰ��� ����.
		{
			System.out.println("����");
		}
		
		if(s1.equals(s2)) // .equals()�� �ϰ� �Ǹ� ���� ���Ѵ�.
		{
			System.out.println("����");
		}
		
		for (int i = 0; i < s1.length(); i++) {
			char c = s1.charAt(i); // ��ġ�� �ش��ϴ� ���� ������(j)
			System.out.println(i+" : " + c);
			
		}
		
		String s5 = "java program";
		
		System.out.println(s5.substring(3));  // index 3 ���� ���
		System.out.println(s5.substring(3,7)); // index 3 ���� 7���� ���
		
		String s6 = "    JAVA	";
		System.out.println(s6.length());
		System.out.println(s6.trim()); 		// �յ� ���� ����(�ǵ� ����)������ ������ ������� �����ϱ�
		s6 = s6.trim();						// �̷��� ���� ��������ߵ�
		System.out.println(s6.length());
		
		System.out.println(s5.toUpperCase()); // �빮�ڷ� ġȯ
		System.out.println(s6.toLowerCase()); // �ҹ��ڷ� ġȯ
		
		System.out.println(s5 = s5.replace("java", "python")); // ���� 1�ܾ ã�� ���� 2�ܾ�� ����
		System.out.println(s5.indexOf("yth")); // �ش� �ܾ �����ϴ� index�� ã�´�.
		System.out.println(s5.lastIndexOf("pro")); // �ش�ܾ �ִ� ������ index�� ã�´�.
		
		
		System.out.println(s5.replace("java", "php"));
	}

}
