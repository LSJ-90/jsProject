package com.miso.web.vo;

public class YvalueVo {
	
	private String seriesName;
	private int[] seriesValues;
	
	public YvalueVo() {}

	public YvalueVo(String seriesName, int[] seriesValues) {
		super();
		this.seriesName = seriesName;
		this.seriesValues = seriesValues;
	}

	public String getseriesName() {
		return seriesName;
	}

	public void setseriesName(String seriesName) {
		this.seriesName = seriesName;
	}

	public int[] getseriesValues() {
		return seriesValues;
	}

	public void setseriesValues(int[] seriesValues) {
		this.seriesValues = seriesValues;
	}
}
	