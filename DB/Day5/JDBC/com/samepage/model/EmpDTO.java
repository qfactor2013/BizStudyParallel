package com.samepage.model;

import java.sql.Date;

//DTO(Data Transfer Object)-����Ʋ
//VO(Value Object)-data����Ʋ, ����
//JavaBeans->default������,getter/setter
//POJO(Plain Old Java Object)
public class EmpDTO {
	// 1.�������=>
	// object����(non-static), class����(static):object��������
	int employee_id;
	String first_name;
	String last_name;
	String email;
	Date hire_date;
	String job_id;
	int salary;
	int department_id;

	// 2.�������Լ�--default������ ����,overloading����,�߰��ϸ� default��������.
	public EmpDTO() {

	}

	public EmpDTO(int employee_id, String first_name, String last_name, String email, Date hire_date, String job_id,
			int salary, int department_id) {
		super();
		this.employee_id = employee_id;
		this.first_name = first_name;
		this.last_name = last_name;
		this.email = email;
		this.hire_date = hire_date;
		this.job_id = job_id;
		this.salary = salary;
		this.department_id = department_id;
	}
	// 3.�Ϲ��Լ�---�ƹ��ų��߰�, setter/setter, toString() override
	
	public int getEmployee_id() {
		return employee_id;
	}

	public void setEmployee_id(int employee_id) {
		this.employee_id = employee_id;
	}

	public String getFirst_name() {
		return first_name;
	}

	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}

	public String getLast_name() {
		return last_name;
	}

	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getHire_date() {
		return hire_date;
	}

	public void setHire_date(Date hire_date) {
		this.hire_date = hire_date;
	}

	public String getJob_id() {
		return job_id;
	}

	public void setJob_id(String job_id) {
		this.job_id = job_id;
	}

	public int getSalary() {
		return salary;
	}

	public void setSalary(int salary) {
		this.salary = salary;
	}

	public int getDepartment_id() {
		return department_id;
	}

	public void setDepartment_id(int department_id) {
		this.department_id = department_id;
	}

    	
	
	
	@Override //�����Ϸ��� �ؼ��� �ϴ� �ּ� 
	public String toString() {
		return "�������� EmpDTO [employee_id=" + employee_id + ", first_name=" + first_name + ", last_name=" + last_name
				+ ", email=" + email + ", hire_date=" + hire_date + ", job_id=" + job_id + ", salary=" + salary
				+ ", department_id=" + department_id + "]";
	}




	// 4.innerClass
	class A{
		
	}
	// 5.static block
	static {
		System.out.println("class�� load�� ����");
	}

}





