package com.proline.login.controller;

import java.util.HashMap;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/login")
public class LoginController {
	
	@GetMapping("")
	public HashMap<String, Object> login() {
		HashMap<String, Object> rtnMap = new HashMap<String, Object>();
		System.out.println("TEST HERE");
		rtnMap.put("test", true);
		return rtnMap;
	}
}
