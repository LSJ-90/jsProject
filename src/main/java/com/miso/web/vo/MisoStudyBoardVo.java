package com.miso.web.vo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;

public class MisoStudyBoardVo {
	
	private int boardNo;
	private int commentNo;
	private int writerNo;
	private String writerId;
	private String writerName;
	private String title;
	private String content;
	private int viewCount;
	private String isDeleted;
	@JsonFormat(pattern = "yyyy-MM-dd") private Date createdDate;
	@JsonFormat(pattern = "yyyy-MM-dd") private Date updatedDate;
	private int uploadCnt;
	
	private List<MultipartFile> uploadName;
	
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
	
	public String getIsDeleted() {
		return isDeleted;
	}

	public void setIsDeleted(String isDeleted) {
		this.isDeleted = isDeleted;
	}

	public List<MultipartFile> getUploadName() {
		return uploadName;
	}

	public void setUploadName(List<MultipartFile> uploadName) {
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
	
	public int getUploadCnt() {
		return uploadCnt;
	}

	public void setUploadCnt(int uploadCnt) {
		this.uploadCnt = uploadCnt;
	}
	
	public String getWriterId() {
		return writerId;
	}

	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}

	@Override
	public String toString() {
		return "MisoStudyBoardVo [boardNo=" + boardNo + ", commentNo=" + commentNo + ", writerNo=" + writerNo
				+ ", writerId=" + writerId + ", writerName=" + writerName + ", title=" + title + ", content=" + content
				+ ", viewCount=" + viewCount + ", isDeleted=" + isDeleted + ", createdDate=" + createdDate
				+ ", updatedDate=" + updatedDate + ", uploadCnt=" + uploadCnt + ", uploadName=" + uploadName + "]";
	}

}