package com.tar.web.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.http.ResponseEntity;

@Mapper
public interface SettingDao {

	List<Map<String, Object>> getPh(Map<String, Object> param);

    Map<String, Object> pwdChecker(Map<String, Object> param);

    List<Map<String, Object>> getPhInfo();

    int updatePh(Map<String, Object> param);

    int chkAdmin(Map<String, Object> param);

    int selectTodayAccess(String ip);

    int insertAccessIp(String ip);

    int updateAccessIp(String ip);

    int getAccessCnt();
}
