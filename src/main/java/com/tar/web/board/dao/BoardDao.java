package com.tar.web.board.dao;

import java.util.List;
import java.util.Map;

import com.tar.web.vo.ReplyVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.tar.web.vo.BoardVo;

@Mapper
public interface BoardDao {
	
	int regBoard(BoardVo board);

	List<BoardVo> getBoard(Map<String, Object> param, RowBounds rowBounds);
	BoardVo getBoard(Map<String, Object> param);

	Object getTotalBoardCount(Map<String, Object> param);


	int updateBoard(BoardVo board);

    int saveFile(List<Map<String, Object>> fileList);

	List<Map<String, Object>> getFileList(String seq);

	Map<String, Object> getFile(Map<String, Object> param);

	int deleteFile(Map<String, Object> param);

	List<BoardVo> searchBoard(Map<String, Object> param);

    int insertReply(Map<String, Object> param);

	ReplyVo getReply(String seq);
}
