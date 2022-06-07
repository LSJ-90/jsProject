package com.miso.web.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class MisoStudyBoardVo {
	
	private int boardNo;
	private int writerNo;
	private int commentNo;
	private String writerName;
	private String title;
	private String content;
	private int viewCount;
	private String isDeleted;
	private int uploadNo;
	private String uploadName;
	@JsonFormat(pattern = "yyyy-MM-dd") private Date createdDate;
	@JsonFormat(pattern = "yyyy-MM-dd") private Date updatedDate;
	
	public MisoStudyBoardVo() {
		super();
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getWriterNo() {
		return writerNo;
	}

	public void setWriterNo(int writerNo) {
		this.writerNo = writerNo;
	}
	
	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public String getWriterName() {
		return writerName;
	}

	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public int getUploadNo() {
		return uploadNo;
	}
	
	public String getIsDeleted() {
		return isDeleted;
	}

	public void setIsDeleted(String isDeleted) {
		this.isDeleted = isDeleted;
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

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Date getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}

	@Override
	public String toString() {
		return "MisoStudyBoardVo [boardNo=" + boardNo + ", writerNo=" + writerNo + ", commentNo=" + commentNo
				+ ", writerName=" + writerName + ", title=" + title + ", content=" + content + ", viewCount="
				+ viewCount + ", isDeleted=" + isDeleted + ", uploadNo=" + uploadNo + ", uploadName=" + uploadName
				+ ", createdDate=" + createdDate + ", updatedDate=" + updatedDate + "]";
	}
}