package com.miso.web.vo;

public class ChartLineMultifleVo {
	
	private String[] xValues;
	private YvalueVo yValue;
	
	public ChartLineMultifleVo() {}
	
	public ChartLineMultifleVo(String[] xValues, YvalueVo yValue) {
		super();
		this.xValues = xValues;
		this.yValue = yValue;
	}

	public String[] getxValues() {
		return xValues;
	}

	public void setxValues(String[] xValues) {
		this.xValues = xValues;
	}

	public YvalueVo getyValue() {
		return yValue;
	}

	public void setyValue(YvalueVo yValue) {
		this.yValue = yValue;
	}
}