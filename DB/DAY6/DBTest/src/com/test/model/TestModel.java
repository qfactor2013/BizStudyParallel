package com.test.model;

import java.sql.Date;


//data 전송틀
//DTO(data Transfer Object)
public class TestModel {
// 멤버변수 선언
	private int 	mno;
	private String	 email;
	private String	 pwd;
	private String	 mname;
	private Date	cre_date;
	private	Date	mod_date;
	
	public TestModel() {
	}

	public TestModel(String email, String pwd, String mname) {
		this.email = email;
		this.pwd = pwd;
		this.mname = mname;
	}

	
	public TestModel(int mno, String email, String pwd, String mname, Date cre_date, Date mod_date) {
		this.mno = mno;
		this.email = email;
		this.pwd = pwd;
		this.mname = mname;
		this.cre_date = cre_date;
		this.mod_date = mod_date;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public Date getCre_date() {
		return cre_date;
	}

	public void setCre_date(Date cre_date) {
		this.cre_date = cre_date;
	}

	public Date getMod_date() {
		return mod_date;
	}

	public void setMod_date(Date mod_date) {
		this.mod_date = mod_date;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("TestModel [mno=").append(mno).append(", email=").append(email).append(", pwd=").append(pwd)
				.append(", mname=").append(mname).append(", cre_date=").append(cre_date).append(", mod_date=")
				.append(mod_date).append("]");
		return builder.toString();
	}

//	@Override
//	public String toString() {
//		// 메소드체이닝
//		StringBuilder builder = new StringBuilder();
//		builder.append("TestModel [mno=").append(mno).append(", email=").append(email).append(", cre_date=")
//				.append(cre_date).append(", mod_date=").append(mod_date).append("]");
//		return builder.toString();
//	}

	
	
}
