package com.tar.web.board.service;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.tar.web.vo.ReplyVo;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.tar.web.board.dao.BoardDao;
import com.tar.web.vo.BoardVo;

@Service
@Slf4j
public class BoardService {

	@Autowired
	private BoardDao dao;
	
	public int regBoard(BoardVo board) {
		return dao.regBoard(board);
	}

	public Object getBoard(Map<String, Object> param) {
		log.debug("getBoard param = {}", param);
		int page = Integer.valueOf(String.valueOf(param.get("page")));
		int limit = 5;
		
		int offset = (page - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return dao.getBoard(param, rowBounds);
	}

	public Object getTotalBoardCount(Map<String, Object> param) {
		return dao.getTotalBoardCount(param);
	}

	public BoardVo getRegistered(Map<String, Object> param) {
		BoardVo board = dao.getBoard(param);
		List<Map<String, Object>> fileList = dao.getFileList(board.getSeq());
		board.setFileList(fileList);
		ReplyVo reply = dao.getReply(board.getSeq());
		board.setReply(reply);

		return board;
	}

    public Object validateNumber(Map<String, Object> param) {
		BoardVo board = dao.getBoard(param);
		if(board.getContact().equals(param.get("phNum"))){
			return true;
		} else {
			return false;
		}
    }

	public int updateBoard(BoardVo board) {
		return dao.updateBoard(board);
	}

	public int saveFile(List<Map<String, Object>> fileList) {
		return dao.saveFile(fileList);
	}

	public Object deleteFile(Map<String, Object> param) {
		return dao.deleteFile(param);
	}

	public Map<String, Object> getFile(Map<String, Object> param) {
		return dao.getFile(param);
	}

	public List<Map<String, Object>> getFileList(String seq) {
		return dao.getFileList(seq);
	}

	public List<BoardVo> searchBoard(Map<String, Object> param) {
		return dao.searchBoard(param);
	}

    public Object insertReply(Map<String, Object> param) {
		return dao.insertReply(param);
    }
}
