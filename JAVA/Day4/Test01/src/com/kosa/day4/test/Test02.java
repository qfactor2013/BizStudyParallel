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

		//Stream 은 1 바이트씩 Reader/Writer는 2바이트씩 작업한다.
		
		
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
		
		// 성능이 조금 더 좋음
		FileReader fr = new FileReader("a.txt");
		BufferedReader br =  new BufferedReader(fr);
		
		String s = br.readLine(); // 한 줄을 읽는다.
		System.out.print(s);
		
		
		PrintWriter pw = new PrintWriter(new FileWriter("c.txt"));
		pw.println(s);
		
		
		
		pw.close(); // 닫을때는 for문과 비슷하게 닫아준다.
		br.close();
		fr.close();
		
	}

}
