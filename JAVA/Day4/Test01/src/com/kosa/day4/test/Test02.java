package com.kosa.day4.test;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

public class Test02 {

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub

		//Stream �� 1 ����Ʈ�� Reader/Writer�� 2����Ʈ�� �۾��Ѵ�.
		
		
		FileInputStream fi = new FileInputStream("a.txt");
		FileOutputStream fo = new FileOutputStream("b.txt");
		
		int a;
		
		while((a=fi.read()) != -1)
		{
			System.out.println((char)a);
			fo.write(a);
		}
		
		fo.flush();
		fi.close();
		fo.close();
		
//		int b = System.in.read();
//		System.out.println("OK" + (char) b);
//		
		
		// ������ ���� �� ����
		FileReader fr = new FileReader("a.txt");
		BufferedReader br =  new BufferedReader(fr);
		
		String s = br.readLine(); // �� ���� �д´�.
		System.out.print(s);
		
		
		PrintWriter pw = new PrintWriter(new FileWriter("c.txt"));
		pw.println(s);
		
		
		
		pw.close(); // �������� for���� ����ϰ� �ݾ��ش�.
		br.close();
		fr.close();
		
	}

}
