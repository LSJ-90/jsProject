package com.miso.web.vo;

public class ChartScatterMultifleVo {
	
	private double xValue;
	private double yValue;
	private String seriesName;
	
	public ChartScatterMultifleVo() {}

	public ChartScatterMultifleVo(double xValue, double yValue, String seriesName) {
		super();
		this.xValue = xValue;
		this.yValue = yValue;
		this.seriesName = seriesName;
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

	public String getseriesName() {
		return seriesName;
	}

	public void setseriesName(String seriesName) {
		this.seriesName = seriesName;
	}
}
	