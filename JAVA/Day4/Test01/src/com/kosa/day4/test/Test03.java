package com.kosa.day4.test;

/**
 * @author Qfactor 2016-10-07
 * 			Exception 처리
 *
 */
public class Test03 {
						// throws를 넣으면 try/catch 필요가 없다. 호출한 쪽으로 다시 던져버림
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		/*
			try, catch, finally(던지고 받아서 마지막으로)
			에러가 날 수 있는 부위를 try로 감싸서
			catch 로 던져서 처리한다음 다 하면 finally를 실행한다.
		*/
		try {
			int[] a = new int[3];
			 a[3] = 123; // ArrayIndexOutOfBoundsException
			System.out.println("1");
			System.out.println("2");
			System.out.println("3");
			System.out.println("4");

			String s = null;
			s.length();

		} 
		catch (ArrayIndexOutOfBoundsException e){
			System.out.println("인덱스초과");
			e.printStackTrace();
		}
		catch (NullPointerException e) {
			System.out.println("널널널");
			e.printStackTrace();
		}
		catch (Exception e) {

		}
		
/*		catch (Exception e) {
			// TODO Auto-generated catch block
			if ((e.toString()).toLowerCase().indexOf("index") > -1) { 
	// Method Chaining 기법 Exception e의 에러메세지를 소문자화 시키고 index라는 단어를 찾았다면
				System.out.println("배열인덱스 초과");				
				e.printStackTrace();
			} else if ((e.toString()).toLowerCase().indexOf("null") > -1) {
	// Method Chaining 기법 Exception e의 에러메세지를 소문자화 시키고 null이라는 단어를 찾았다면
				System.out.println("널이다 널");
				e.printStackTrace();
			}
		}*/
		finally {
			 System.out.println("마지막으로 할 말");
		}
	}

}
