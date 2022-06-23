package com.miso.web.vo;

public class ChartScatterSingleVo {
	
	private double xValue;
	private double yValue;
	
	public ChartScatterSingleVo() {}

	public ChartScatterSingleVo(double xValue, double yValue) {
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

	public double getyValue() {
		return yValue;
	}

	public void setyValue(double yValue) {
		this.yValue = yValue;
	}

	@Override
	public String toString() {
		return "ChartScatterSingleVo [xValue=" + xValue + ", yValue=" + yValue + "]";
	}
}
	