package com.kosa.day4.test;

/**
 * @author Qfactor 2016-10-07
 * 			Exception ó��
 *
 */
public class Test03 {
						// throws�� ������ try/catch �ʿ䰡 ����. ȣ���� ������ �ٽ� ��������
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		/*
			try, catch, finally(������ �޾Ƽ� ����������)
			������ �� �� �ִ� ������ try�� ���μ�
			catch �� ������ ó���Ѵ��� �� �ϸ� finally�� �����Ѵ�.
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
			System.out.println("�ε����ʰ�");
			e.printStackTrace();
		}
		catch (NullPointerException e) {
			System.out.println("�γγ�");
			e.printStackTrace();
		}
		catch (Exception e) {

		}
		
/*		catch (Exception e) {
			// TODO Auto-generated catch block
			if ((e.toString()).toLowerCase().indexOf("index") > -1) { 
	// Method Chaining ��� Exception e�� �����޼����� �ҹ���ȭ ��Ű�� index��� �ܾ ã�Ҵٸ�
				System.out.println("�迭�ε��� �ʰ�");				
				e.printStackTrace();
			} else if ((e.toString()).toLowerCase().indexOf("null") > -1) {
	// Method Chaining ��� Exception e�� �����޼����� �ҹ���ȭ ��Ű�� null�̶�� �ܾ ã�Ҵٸ�
				System.out.println("���̴� ��");
				e.printStackTrace();
			}
		}*/
		finally {
			 System.out.println("���������� �� ��");
		}
	}

}
