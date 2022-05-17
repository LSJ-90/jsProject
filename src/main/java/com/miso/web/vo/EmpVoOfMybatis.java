package com.miso.web.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class EmpVoOfMybatis {
	
	private int empNo;
	private String name;
	private String job;
	private int mgrNo;
	@JsonFormat(pattern = "yyyy-MM-dd") private Date hireDate;
	private long salary;
	private long commission;
	private int deptNo;
	
	public EmpVoOfMybatis() {
		super();
	}
	
	public int getEmpNo() {
		return empNo;
	}
	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public int getMgrNo() {
		return mgrNo;
	}
	public void setMgrNo(int mgrNo) {
		this.mgrNo = mgrNo;
	}
	public Date getHireDate() {
		return hireDate;
	}
	public void setHireDate(Date hireDate) {
		this.hireDate = hireDate;
	}
	public long getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	public long getCommission() {
		return commission;
	}
	public void setCommission(long commission) {
		this.commission = commission;
	}
	public int getDeptNo() {
		return deptNo;
	}
	public void setDeptNo(int deptNo) {
		this.deptNo = deptNo;
	}

	@Override
	public String toString() {
		return "EmpVoOfMybatis [empNo=" + empNo + ", name=" + name + ", job=" + job + ", mgrNo=" + mgrNo + ", hireDate="
				+ hireDate + ", salary=" + salary + ", commission=" + commission + ", deptNo=" + deptNo + "]";
	}
	
	
}
