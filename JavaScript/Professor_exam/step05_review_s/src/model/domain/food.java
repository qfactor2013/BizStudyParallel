package model.domain;

public class food {

	private String cherries = "���� ��ȭ �� �ҿ�ȿ��" +
			"	ü���� ������ �ִ� ����þƴ� ������ �ƽ��Ǹ����� 10�質 ���� �ҿ�ȿ���� �ִ�ϴ�" +
			"		�ҿ��������� �̺��������� ���� ��ó�� ������ �پ��ٴ� ���� ����� ����" +
			"		�̺��������� ���� ���߹����� ����� ȿ�Ҹ� ������ ������ ���̴� �ۿ��� ����"		;
	
	private String steak = "�丮��� ��⸦ ��¿� 1�ð� �̻� �д�.�ұ�, ���� ���� �Ѵ�." +
			"������ �Ѹ��� ���� �ִ��� �̰߰� �Ѵ�." +
			"���͸� �ְ�, ������� �ִ´�.������ ������ ���ϰ�, ����� ������ ���ϸ� ���� ����." +
			"�Ѹ��� Ÿ�� ���� ������ ������ 2�� ���� ���� �ش� (�̰� �β��� ���� �ٸ���)" +
			"�ҿ� �β��� ���� ���ϴ� doneness �� ���߾� �ش�.ȣ�Ͽ� 5������ �������� �Ѵ�."		;
	
	private String wine = "�� ���� ������ ����� ��ȿ���� ���� ���ڿ� ����� ����� ��ƾ�� Vinum(��: ������ ��ȿ��Ų ��)���� ������," +
			" ����δ� ����(Wine), ��������δ� Vin(��), ��Ż���ƾ�δ� Vino(���), ���Ͼ�� Wein(����)�̶�� �Ѵ�. " +
			"���, ������, ����� �� �ٸ� ������ ��ȿ�Ͽ� ���� ������ �տ� �� ������ �̸��� �ٴ´�. "		;

	public food() {
		super();
		// TODO Auto-generated constructor stub
	}

	public food(String cherries, String steak, String wine) {
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
