package com.tar.web.board.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.tar.web.board.service.SettingService;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@Slf4j
@RequestMapping("/setting")
public class SettingController {

	@Autowired
	SettingService service;

	@GetMapping(value = "phSet")
	public String phSetting(Map<String, Object> param, Model model) {
		model.addAllAttributes(param);
		return "setting/phSet";
	}

	@GetMapping(value = "getPh")
	public ResponseEntity<?> getPh(Map<String, Object> param) throws Exception{
		
		return ResponseEntity.ok(service.getPh(param));
	}

	@RequestMapping(value = "adminLogin", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminLogin(@RequestParam Map<String, Object> param, Model model, RedirectAttributes redirectAttr){
		log.debug("onReady adminLogin");
		log.debug("param = {}", param);

		Map<String, Object> checkResult = service.pwdChecker(param);

		if((boolean) checkResult.get("result")){
			List<Map<String, Object>> phInfo = service.getPhInfo();
			log.debug("phInfo : {}", phInfo);
			model.addAttribute("phInfo", phInfo);
			return "setting/phSetting";
		} else {
			redirectAttr.addFlashAttribute("msg", checkResult.get("msg"));
			return "redirect:/setting/phSet";
		}
	}

	@GetMapping(value = "accessCnt")
	public String accessCnt(Model model){
		int dailyCnt = service.getAccessCnt();
		model.addAttribute("accessCnt", dailyCnt);
		return "setting/accessCnt";
	}

	@GetMapping(value = "accessCheck")
	public ResponseEntity<?> accessCheck(@RequestParam Map<String, Object> param, HttpServletRequest request){
		String ip = request.getHeader("X-FORWARDED-FOR");

		//proxy 환경일 경우
		if (ip == null || ip.length() == 0) {
			ip = request.getHeader("Proxy-Client-IP");
		}

		//웹로직 서버일 경우
		if (ip == null || ip.length() == 0) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}

		if (ip == null || ip.length() == 0) {
			ip = request.getRemoteAddr() ;
		}
		log.debug("ip addr = {}", ip);
		service.userChecker(ip);
		log.debug("go home");
		return ResponseEntity.ok(true);
	}

	@PostMapping(value = "updatePh")
	public ResponseEntity<?> updatePh(@RequestBody Map<String, Object> param){
		log.debug("param = {}", param);
		return ResponseEntity.ok(service.updatePh(param));
	}

	@GetMapping(value = "setAdmin")
	public String setAdmin(Map<String, Object> param, Model model) {
		model.addAllAttributes(param);
		return "setting/setAdmin";
	}

	@PostMapping(value = "setAdminSession")
	public ResponseEntity<?> setAdmin(@RequestBody Map<String, Object> param, HttpServletRequest hsr){

		HttpSession session = hsr.getSession();
		log.debug("session = {}", session.getAttribute("auth"));

		if(service.setAdmin(param)){
			session.setAttribute("auth", "admin");
			return ResponseEntity.ok(true);
		} else {
			return ResponseEntity.ok(false);
		}


	}

	@GetMapping(value = "chkAuth")
	public ResponseEntity<?> chkAuth(@RequestParam Map<String, Object> param, HttpServletRequest hsr){

		HttpSession session = hsr.getSession();
		log.debug("session = {}", session.getAttribute("auth"));

		if(session.getAttribute("auth") != null && session.getAttribute("auth").equals("admin")){
			return ResponseEntity.ok(true);
		}

		return ResponseEntity.ok(false);
	}


}
