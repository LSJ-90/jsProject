package com.miso.web.vo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;

public class MisoStudyUploadFileVo {
	
	private int uploadNo;
	private int boardNo;
	private String uploadName;
	@JsonFormat(pattern = "yyyy-MM-dd") private Date uploadDate;

	public MisoStudyUploadFileVo() {
		super();
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getUploadNo() {
		return uploadNo;
	}

	public void setUploadNo(int uploadNo) {
		this.uploadNo = uploadNo;
	}

	public String getUploadName() {
		return uploadName;
	}

	public void setUploadName(String uploadName) {
		this.uploadName = uploadName;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	@Override
	public String toString() {
		return "MisoStudyUploadFileVo [uploadNo=" + uploadNo + ", boardNo=" + boardNo + ", uploadName=" + uploadName
				+ ", uploadDate=" + uploadDate + "]";
	}
}