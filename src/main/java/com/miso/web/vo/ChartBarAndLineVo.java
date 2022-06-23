package com.miso.web.vo;

import java.util.List;

public class ChartBarAndLineVo {
	
	private String xValue;
	private int yValueLeft;
	private int yValueRight;
	
	public ChartBarAndLineVo() {}

	public ChartBarAndLineVo(String xValue, int yValueLeft, int yValueRight) {
		super();
		this.xValue = xValue;
		this.yValueLeft = yValueLeft;
		this.yValueRight = yValueRight;
	}

	public String getxValue() {
		return xValue;
	}

	public void setxValue(String xValue) {
		this.xValue = xValue;
	}

	public int getyValueLeft() {
		return yValueLeft;
	}

	public void setyValueLeft(int yValueLeft) {
		this.yValueLeft = yValueLeft;
	}

	public int getyValueRight() {
		return yValueRight;
	}

	public void setyValueRight(int yValueRight) {
		this.yValueRight = yValueRight;
	}
}
	