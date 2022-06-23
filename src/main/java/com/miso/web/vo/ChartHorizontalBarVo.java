package com.miso.web.vo;

public class ChartHorizontalBarVo {
	
	private double xValue;
	private String yValue;
	
	public ChartHorizontalBarVo() {}

	public ChartHorizontalBarVo(double xValue, String yValue) {
		super();
		this.xValue = xValue;
		this.yValue = yValue;
	}

	public double getxValue() {
		return xValue;
	}

	public void setxValue(double xValue) {
		this.xValue = xValue;
	}

	public String getyValue() {
		return yValue;
	}

	public void setyValue(String yValue) {
		this.yValue = yValue;
	}
}
	