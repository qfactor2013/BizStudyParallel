package com.samepage.model;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

// DTO(Data Transfer Object) 데이터 전송 틀
// VO(Value Object) - data저장틀, 가방
// 자바 빈즈 -> defailt 생성자가 getter setter   4개다 같은 말
// POJO(Plain Old Java Object)
public class EmpDTO {
//	
//	1.멤버변수 - object변수(non-static), class 변수(static) : 공유변수

	
	int employee_id;
	String first_name;
	String last_name;
	String email;
	Date hire_date;
	String job_id;
	int salary;
	int department_id;
	
	


public EmpDTO() {
	}

//	2. 생성자--default 생성자가 이미 제공되어있음, overloading 지원, 추가하면 default 지워짐
	public EmpDTO(int employee_id, String first_name, String last_name, String email, Date hire_date, String job_id,
			int salary, int department_id) {
		this.employee_id = employee_id;
		this.first_name = first_name;
		this.last_name = last_name;
		this.email = email;
		this.hire_date = hire_date;
		this.job_id = job_id;
		this.salary = salary;
		this.department_id = department_id;
	}

	public EmpDTO(String employee_id, String first_name, String last_name, String email, 
			String hire_date, String job_id, String salary, String department_id) throws ParseException {
		this.employee_id = Integer.parseInt(employee_id);
		this.first_name = first_name;
		this.last_name = last_name;
		this.email = email;
		this.hire_date = new Date(new SimpleDateFormat("yyyymmdd").parse(hire_date).getTime());
		this.job_id = job_id;
		this.salary = Integer.parseInt(salary);
		this.department_id = Integer.parseInt(department_id);
	}

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

	public Date gethire_date() {
		return hire_date;
	}

	public void sethire_date(Date hire_date) {
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
//	3 일반함수
	
	@Override //컴파일러가 해석을 하는 주석
	public String toString() {
		return "EmpDTO [employee_id=" + employee_id + ", first_name=" + first_name + ", last_name=" + last_name
				+ ", email=" + email + ", hire_date=" + hire_date + ", job_id=" + job_id + ", salary=" + salary
				+ ", department_id=" + department_id + "]";
	}
	
	
//	4 이너클래스, 스태틱 블록
	class A{
		
	}
	static{
		System.out.println("DTO Initialize complete");
	}
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	