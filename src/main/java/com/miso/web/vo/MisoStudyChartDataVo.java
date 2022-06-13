package com.miso.web.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class MisoStudyChartDataVo {
	
	private int cnt;
	@JsonFormat(pattern = "yyyy-MM-dd") private Date createdDate;
	
	public MisoStudyChartDataVo() {
		super();
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	@Override
	public String toString() {
		return "MisoStudyChartDataVo [cnt=" + cnt + ", createdDate=" + createdDate + "]";
	}
}