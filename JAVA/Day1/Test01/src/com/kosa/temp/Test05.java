package com.kosa.temp;

public class Test05 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		int[] score = {80,75,82,95,80,75,90};
		
		int total =0;
		double avg =0;
		int max = 0;
		int min = 100;
		int mid = 0;
		
		for(int i=0; i< score.length; i++)
		{
			total += score[i];
			
			if(max < score[i])
			{
				max = score[i];				
			}
			if(min > score[i])
			{
				min = score[i];
			}
			if(i+1==score.length)
			{
				avg = total / score.length;
			}
			
		}
		
		
		System.out.println("���� : " + total);
		System.out.println("��� : " + avg);
		System.out.println("�ִ밪 : " + max);
		System.out.println("�ּҰ� : " + min);
		
		int tick = 0;
		int temp = 100;
		int tempindex = 0;
		for(int i=0; i<score.length; i++)
		{
			tick = Math.abs((int)avg - score[i]);
			
			if(temp > tick)
			{
				temp = tick;
				tempindex = i;
			}
		}
		
		
		System.out.println("�߰��� : " + score[tempindex]);
		
	}

}
