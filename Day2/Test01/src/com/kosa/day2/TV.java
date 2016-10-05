/**
 * 
 */
package com.kosa.day2;

/**
 * @author qfactor 2016.10.05
 *
 */
public class TV {
	
	String	brand;
	int		inch;
	boolean	power = false;
	int		channel;

	public TV(String brand, int inch) {
		super();
		this.brand = brand;
		this.inch = inch;
		channel = 1;
	}
	
	public TV(String brand, int inch, boolean power, int channel) {
		super();
		this.brand = brand;
		this.inch = inch;
		this.power = power;
		this.channel = channel;
	}

	public void turnOnTV()
	{
		if(power != true){
			System.out.println("TV�� �׽��ϴ�.");
			power = true;
		}
		else
			System.out.println("�̹� �����ֽ��ϴ�.");
	}
	
	public void turnOffTV()
	{
		if(power != false){
			System.out.println("TV�� �����ϴ�.");
			power = false;
		}
		else
			System.out.println("�̹� �����ֽ��ϴ�.");
	}

	public String getBrand() {
		return brand;
	}
	
	public int getInch() {
		return inch;
	}

	public int getChannel() {
		return channel;
	}

	public void setChannel(int channel) {
		if(power){
		this.channel = channel;
		System.out.println(this.channel + "�� ä�κ����Ͽ����ϴ�");
		}
		else
			System.out.println("TV�� �����־� ä�κ��� �Ұ�");
	}

	@Override
	public String toString() {
		return "TV [brand=" + brand + ", inch=" + inch + ", ����=" + (power?"����":"����") + ", ä��=" + channel + "]";
	}
	
}
