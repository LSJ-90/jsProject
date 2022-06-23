package com.miso.web.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.codec.digest.DigestUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.miso.web.persistence.MisoStudyDao;
import com.miso.web.util.Criteria;
import com.miso.web.vo.ChartBarAndLineVo;
import com.miso.web.vo.MisoStudyBoardVo;
import com.miso.web.vo.MisoStudyChartDataVo;
import com.miso.web.vo.MisoStudyUploadFileVo;
import com.miso.web.vo.MisoStudyUserVo;

@Service
public class MisoStudyService {
	
	private static final Logger logger = LoggerFactory.getLogger(MisoStudyService.class);
	
	@Autowired
	private MisoStudyDao misoStudyDao;
	
	
	// UserAuth Service
	public void signUp(MisoStudyUserVo newUser) {
		String authPwd = DigestUtils.sha512Hex(newUser.getPwd());
		newUser.setPwd(authPwd);
		misoStudyDao.signUp(newUser);
	}

	public MisoStudyUserVo signIn(String id) {
		return misoStudyDao.selectUserInfoById(id);
	}
	
	public int checkId(String id) {
		return misoStudyDao.countUserInfoById(id);
	}

	public int checkEmail(String email) {
		return misoStudyDao.countUserInfoByEmail(email);
	}
	
	public MisoStudyUserVo selectUserInfoByEmail(String email) {
		return misoStudyDao.selectUserInfoByEmail(email);
	}
	
	public void updateUserInfo(MisoStudyUserVo savedUserInfo) {
		misoStudyDao.updateUserInfo(savedUserInfo);
	}
	
	public String getTempPassword(){
		char[] charSet = new char[] {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 
									 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 
									 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 
									 'U', 'V', 'W', 'X', 'Y', 'Z'};
        String tempPwd = "";

        int index = 0;
        for (int i = 0; i < 10; i++) {
        	index = (int) (charSet.length * Math.random());
        	tempPwd += charSet[index];
        }
        return tempPwd;
    }
	
	// Board Service
	public List<MisoStudyBoardVo> selectAllBoards() {
		return misoStudyDao.selectAllBoards();
	}
	
	public MisoStudyBoardVo selectBoardByBoardNo(int boardNo) {
		return misoStudyDao.selectBoardByBoardNo(boardNo);
	}

	public List<MisoStudyBoardVo> selectCommentsByBoardNo(int boardNo) {
		return misoStudyDao.selectCommentsByBoardNo(boardNo);
	}

	public void insertBoard(MisoStudyBoardVo newBoard) {
		misoStudyDao.insertBoard(newBoard);
	}

	public void updateBoardByBoardNo(MisoStudyBoardVo newBoard) {
		misoStudyDao.updateBoardByBoardNo(newBoard);
	}

	public int selectBoardsTotalRowsCnt() {
		return misoStudyDao.selectBoardsTotalRowsCnt();
	}

	public List<MisoStudyBoardVo> selectSearchBoards(Criteria criteria) {
		return misoStudyDao.selectSearchBoards(criteria);
	}

	public void updateViewCntByBoardNo(MisoStudyBoardVo board) {
		misoStudyDao.updateViewCntByBoardNo(board);
	}

	public void deleteBoardByBoardNo(MisoStudyBoardVo board) {
		misoStudyDao.deleteBoardByBoardNo(board);
	}

	public List<MisoStudyChartDataVo> selectChartsDataByDay() {
		return misoStudyDao.selectChartsDataByDay();
	}
	
	public List<MisoStudyChartDataVo> selectChartsDataByMonth() {
		return misoStudyDao.selectChartsDataByMonth();
	}

	public void insertFile(MisoStudyUploadFileVo uploadFileInfo) {
		misoStudyDao.insertFile(uploadFileInfo);
	}

	public List<MisoStudyUploadFileVo> selectFileByBoardNo(int boardNo) {
		return misoStudyDao.selectFileByBoardNo(boardNo);
	}

	public String selectUploadFileByUploadNo(int uploadNo) {
		return misoStudyDao.selectUploadFileByUploadNo(uploadNo);
	}

	public int countUploadFileByBoardNo(int boardNo) {
		return misoStudyDao.countUploadFileByBoardNo(boardNo);
	}

	public void deleteUploadFileByUploadNo(int uploadNo) {
		 misoStudyDao.deleteUploadFileByUploadNo(uploadNo);
	}
}
