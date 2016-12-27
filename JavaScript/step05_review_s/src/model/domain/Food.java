package model.domain;

public class Food {

	private String cherries = "통증 완화 및 소염효과" +
			"	체리에 함유돼 있는 안토시아닌 성분은 아스피린보다 10배나 높은 소염효과가 있답니다" +
			"		소염진통제인 이부프로펜을 먹은 것처럼 통증이 줄어든다는 연구 결과도 있죠" +
			"		이부프로펜은 통증 유발물질을 만드는 효소를 억제해 통증을 줄이는 작용을 한죠"		;
	
	private String steak = "요리방법 고기를 상온에 1시간 이상 둔다.소금, 후추 간을 한다." +
			"오일을 뿌리고 팬을 최대한 뜨겁게 한다." +
			"버터를 넣고, 로즈마리를 넣는다.마늘의 색상이 변하고, 로즈마리 색상이 변하면 덜어 낸다." +
			"겉면이 타게 보일 정도로 양쪽을 2분 정도 구워 준다 (이건 두께에 따라 다르다)" +
			"팬에 두껑을 덮어 원하는 doneness 로 맞추어 준다.호일에 5분정도 레스팅을 한다."		;
	
	private String wine = "잘 익은 포도의 당분을 발효시켜 만든 알코올 음료로 어원은 라틴어 Vinum(비눔: 포도를 발효시킨 것)에서 왔으며," +
			" 영어로는 와인(Wine), 프랑스어로는 Vin(뱅), 이탈리아어로는 Vino(비노), 독일어로 Wein(바인)이라고 한다. " +
			"사과, 복숭아, 라즈베리 등 다른 과실을 발효하여 만든 와인은 앞에 그 과실의 이름이 붙는다. "		;

	public Food() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Food(String cherries, String steak, String wine) {
		super();
		this.cherries = cherries;
		this.steak = steak;
		this.wine = wine;
	}

	public String getCherries() {
		return cherries;
	}

	public void setCherries(String cherries) {
		this.cherries = cherries;
	}

	public String getSteak() {
		return steak;
	}

	public void setSteak(String steak) {
		this.steak = steak;
	}

	public String getWine() {
		return wine;
	}

	public void setWine(String wine) {
		this.wine = wine;
	}

}
