package com.tar.web.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Map;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardVo implements Serializable {/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String seq;
	private String title;
	private String content;
	private String writer;
	private String contact;
	private Date regDate;
	private List<Map<String, Object>> fileList;
	private ReplyVo reply;
	
}
