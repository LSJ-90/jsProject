package com.miso.web.vo;

import java.util.List;

public class ChartLineMultipleVo {
	
	private String[] xValues;
	private List<YvaluesVo> yValues;	
	
	public ChartLineMultipleVo() {}

	public ChartLineMultipleVo(String[] xValues, List<YvaluesVo> yValues) {
		super();
		this.xValues = xValues;
		this.yValues = yValues;
	}

	public String[] getxValues() {
		return xValues;
	}

	public void setxValues(String[] xValues) {
		this.xValues = xValues;
	}

	public List<YvaluesVo> getyValues() {
		return yValues;
	}

	public void setyValues(List<YvaluesVo> yValues) {
		this.yValues = yValues;
	}
}