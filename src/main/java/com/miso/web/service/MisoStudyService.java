package com.miso.web.service;

import java.util.List;

import org.apache.commons.codec.digest.DigestUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.miso.web.persistence.MisoStudyDao;
import com.miso.web.util.Criteria;
import com.miso.web.vo.MisoStudyBoardVo;
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
}
