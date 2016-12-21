package util;

//단순 정보 제공 클래스 
//요청 - client가 브라우저
//브라우저 요청 처리 하는 jsp : infoView.jsp
public class Info {
	public int sum(){
		return 10*10;
	}
	
	public int sum(int v){
		return v*10;
	}
}
