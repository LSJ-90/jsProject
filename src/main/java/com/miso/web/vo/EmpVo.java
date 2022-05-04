package com.miso.web.vo;

import java.util.Date;

public class EmpVo {
	
	private int empId;
	private String name;
	private String email;
	private String phone;
	private Date hireDate;
	private int magId;
	private String jobTitle;
	
	public EmpVo() {}
	
	public EmpVo(String name) {
		super();
		this.name = name;
		
	}

	public int getEmpId() {
		return empId;
	}
	public void setEmpId(int empId) {
		this.empId = empId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Date getHireDate() {
		return hireDate;
	}
	public void setHireDate(Date hireDate) {
		this.hireDate = hireDate;
	}
	public int getMagId() {
		return magId;
	}
	public void setMagId(int magId) {
		this.magId = magId;
	}
	public String getJobTitle() {
		return jobTitle;
	}
	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}

	@Override
	public String toString() {
		return "EmpVo [empId=" + empId + ", name=" + name + ", email=" + email + ", phone=" + phone + ", hireDate="
				+ hireDate + ", magId=" + magId + ", jobTitle=" + jobTitle + "]";
	}
}
