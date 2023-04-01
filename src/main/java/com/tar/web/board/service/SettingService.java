package com.tar.web.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.tar.web.board.dao.SettingDao;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class SettingService {

	@Autowired
	SettingDao dao;

	public Object getPh(Map<String, Object> param) {
		return dao.getPh(param);
	}

    public Map<String, Object> pwdChecker(Map<String, Object> param) {
		Map<String, Object> returnVal = new HashMap<>();

		Map<String, Object> selectMap = dao.pwdChecker(param);
		if(selectMap != null){
			returnVal.put("result", true);
		} else {
			returnVal.put("result", false);
			returnVal.put("msg", "잘못된 비밀번호 입니다.");
		}

		return returnVal;
    }

	public List<Map<String, Object>> getPhInfo() {
		return dao.getPhInfo();
	}

	public Object updatePh(Map<String, Object> param) {
		List<Map<String, Object>> list = (List<Map<String, Object>>) param.get("list");

		int result = 0;
		for(Map<String, Object> map : list){
			result += dao.updatePh(map);
		}

		return result;
	}

    public boolean setAdmin(Map<String, Object> param) {
		return dao.chkAdmin(param) > 0 ? true : false;
    }
}
