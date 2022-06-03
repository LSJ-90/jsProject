package com.miso.web.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class MisoStudyUserVo {
	
	private int userNo;
	private String id;
	private String pwd;
	private String name;
	private String email;
	@JsonFormat(pattern = "yyyy-MM-dd") private Date createdDate;
	private String isWithdrawal;
	@JsonFormat(pattern = "yyyy-MM-dd") private Date withdrawDate;
	
	public MisoStudyUserVo() {
		super();
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
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

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public String getIsWithdrawal() {
		return isWithdrawal;
	}

	public void setIsWithdrawal(String isWithdrawal) {
		this.isWithdrawal = isWithdrawal;
	}

	public Date getWithdrawDate() {
		return withdrawDate;
	}

	public void setWithdrawDate(Date withdrawDate) {
		this.withdrawDate = withdrawDate;
	}

	@Override
	public String toString() {
		return "MisoStudyUserVo [userNo=" + userNo + ", id=" + id + ", pwd=" + pwd + ", name=" + name + ", email="
				+ email + ", createdDate=" + createdDate + ", isWithdrawal=" + isWithdrawal + ", withdrawDate="
				+ withdrawDate + "]";
	}
}
