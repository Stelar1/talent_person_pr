package com.wls.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.wls.entity.TestEntity;

@Controller
@RequestMapping("/test")
public class TestController {
	
	@RequestMapping("/field")
	public String getdate(String name,int id){
		System.out.println(id+":"+name);
		return "redirect:/login.jsp";
	}
	@RequestMapping("/clss")
	public ModelAndView testen(TestEntity testEntity,String age){
		System.out.println("进来了！");
		System.out.println(age);
		System.out.println(testEntity);
		return new ModelAndView("user/addUserinf");
	}
}
