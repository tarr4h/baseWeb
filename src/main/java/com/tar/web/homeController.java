package com.tar.web;

import com.tar.web.board.service.SettingService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.Date;

@Controller
@Slf4j
public class homeController {

	@Autowired
	SettingService settingService;

	@GetMapping("/")
	public String goHome() {
		return "forward:/index.jsp";
	}

}
