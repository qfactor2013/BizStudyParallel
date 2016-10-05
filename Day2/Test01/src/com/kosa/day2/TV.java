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
			System.out.println("TV를 켰습니다.");
			power = true;
		}
		else
			System.out.println("이미 켜져있습니다.");
	}
	
	public void turnOffTV()
	{
		if(power != false){
			System.out.println("TV를 껐습니다.");
			power = false;
		}
		else
			System.out.println("이미 꺼져있습니다.");
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
		System.out.println(this.channel + "로 채널변경하였습니다");
		}
		else
			System.out.println("TV가 꺼져있어 채널변경 불가");
	}

	@Override
	public String toString() {
		return "TV [brand=" + brand + ", inch=" + inch + ", 전원=" + (power?"켜짐":"꺼짐") + ", 채널=" + channel + "]";
	}
	
}
