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
		
		
		System.out.println("총합 : " + total);
		System.out.println("평균 : " + avg);
		System.out.println("최대값 : " + max);
		System.out.println("최소값 : " + min);
		
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
		
		
		System.out.println("중간값 : " + score[tempindex]);
		
	}

}
