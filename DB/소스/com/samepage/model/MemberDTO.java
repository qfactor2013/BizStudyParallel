package com.samepage.model;

import java.sql.Date;

//Data����Ʋ
//DTO(Data Transfer Object)
public class MemberDTO {
  //1.�����������...���������� ���� private���� ����
	private int mno  ;
	private String email ;
	private String pwd ;
	private String mname ;
	private Date  cre_date ;
	private Date mod_date ;
    //2.default������ �ݵ�� ����--JavaBeans���,Mybatis, Spring
	public MemberDTO(){
		
	}
	
	//�������߰�--�ʼ��ƴ�..
	public MemberDTO(int mno, String email, String pwd, String mname) {
		super();
		this.mno = mno;
		this.email = email;
		this.pwd = pwd;
		this.mname = mname;
	}
	
	public MemberDTO(int mno, String email, String pwd, String mname, Date cre_date, Date mod_date) {
		super();
		this.mno = mno;
		this.email = email;
		this.pwd = pwd;
		this.mname = mname;
		this.cre_date = cre_date;
		this.mod_date = mod_date;
	}
	
	

	//3.Getter/Setter--�ܺ� ��Ű������ �����ϱ� ���� public�Լ�
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
		builder.append("MemberDTO [mno=").append(mno).append(", email=").append(email).append(", pwd=").append(pwd)
				.append(", mname=").append(mname).append(", cre_date=").append(cre_date).append(", mod_date=")
				.append(mod_date).append("]");
		return builder.toString();
	}

	 

	
	
	
  
  
}
