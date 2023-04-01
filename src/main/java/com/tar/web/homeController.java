package com.tar.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class homeController {

	@GetMapping("/")
	public String goHome() {

		return "forward:/index.jsp";
	}

}
