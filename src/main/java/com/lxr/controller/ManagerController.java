package com.lxr.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.lxr.model.Manager;
import com.lxr.service.ManagerService;

@Controller
@SessionAttributes({"manager","managername"})
public class ManagerController {

	@Autowired
	private ManagerService managerService;

	@RequestMapping("/loginManager")
	public String loginManager(Manager record,ModelMap map) {
		Manager manager = managerService.login(record);
		System.out.println(record);
		System.out.println(manager);
		if (manager != null) {
			map.addAttribute("managername",record.getManagername());
			map.addAttribute("manager",manager);
			return "redirect:/test";
		} else {
			return "loginError";
		}
	}
	@RequestMapping("/login")
	public String login(){
		return "login";
	}
}
