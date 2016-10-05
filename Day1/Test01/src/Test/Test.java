package Test;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
			int num = 16;
			System.out.println("+= " + (num+=4));
			System.out.println("-= " + (num-=4));
			System.out.println("*= " + (num*=4));
			System.out.println("/= " + (num/=4));
			System.out.println("%= " + (num%=4));
			
			
			System.out.println("후++ " + (num++));
			System.out.println("후-- " + (num--));
			System.out.println("선++ " + (++num));
			System.out.println("선-- " + (--num));
			
	}

}
