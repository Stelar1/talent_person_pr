package com.wls.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wls.entity.Admin;
import com.wls.service.AdminService;
import com.wls.service.UserService;

/**
 * 
 * @author wang
 *管理员控制器
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Resource
	private AdminService service;
	
	@RequestMapping("/getAdminPager")
	@ResponseBody
	public Object getAdminPager(Admin admin) {
		return service.getAdminPager(admin);

	}

	// 删除用户
	@RequestMapping("/delAdmin")
	@ResponseBody
	public Object delAdmin(@RequestParam("a_ids[]") String[] a_ids){
		for (String string : a_ids) {
			System.out.println(string);
		}
		return service.delAdmin(a_ids);
	}
	@RequestMapping("/login")
	public String login(HttpServletRequest request,String name,String password){
		Admin admin =service.selectById(name);
		if(admin.getA_password().equals(password)){
			request.getSession().setAttribute("adminid",name);
			request.getSession().setAttribute("adminname",admin.getA_name());
			return "redirect:/admin/main.jsp";
		}else{
			return "redirect:/adminlogin.jsp";
		}
	}
	
//	退出登录
	@RequestMapping("/loginout")
	public String loginout(HttpServletRequest request){
		request.getSession().removeAttribute("adminid");
		request.getSession().removeAttribute("adminname");
		return "redirect:/adminlogin.jsp";
	}

}
