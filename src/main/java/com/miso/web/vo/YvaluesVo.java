package com.miso.web.vo;

public class YvaluesVo {
	
	private String seriesName;
	private int[] seriesValues;	
	
	public YvaluesVo() {}

	public YvaluesVo(String seriesName, int[] seriesValues) {
		super();
		this.seriesName = seriesName;
		this.seriesValues = seriesValues;
	}

	public String getSeriesName() {
		return seriesName;
	}

	public void setSeriesName(String seriesName) {
		this.seriesName = seriesName;
	}

	public int[] getSeriesValues() {
		return seriesValues;
	}

	public void setSeriesValues(int[] seriesValues) {
		this.seriesValues = seriesValues;
	}
}