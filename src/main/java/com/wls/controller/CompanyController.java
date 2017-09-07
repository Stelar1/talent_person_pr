package com.wls.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.wls.entity.Company;
import com.wls.entity.Message;
import com.wls.entity.Resume;
import com.wls.service.CompanyService;
import com.wls.service.MessageService;
import com.wls.service.ResumeService;

/**
 * 
 * @author wang
 *
 */
@Controller
@RequestMapping("/company")
public class CompanyController {
	@Resource
	CompanyService companyService;
	@Resource
	MessageService messageService;
	@RequestMapping("/add")
	public String update(HttpServletRequest request,String c_name,
			String c_type,String province,String city, String c_level,
			String c_imag,String c_desc,ModelMap modelMap){
		String email = (String)request.getSession().getAttribute("email");
		System.out.println(email);
		if(email == null){
			return "redirect:/login.jsp";
		}
		Company company = new Company(email, c_name,province+"-"+city, c_type, c_level, c_desc);
		int c = 0;
		Company comp = companyService.selectById(email);
		if(comp == null ){
			c = companyService.addCompany(company);
		}else{
			c= companyService.updateCompany(company);
		}
		company = companyService.selectById(email);
		System.out.println(company.getC_id());
		request.getSession().setAttribute("cid",company.getC_id());
		if(c > 0){
			//添加或修改成功
			return "company/showCompany";
		}else
		{
			return "company/addcom";
		}
	} 
	@ResponseBody
	@RequestMapping(value="/showCompany",produces="text/html;charset=UTF-8")
	public String getCompany(HttpServletRequest request){
		String email = (String)request.getSession().getAttribute("email");
		Company company = companyService.selectById(email);
		return JSON.toJSONString(company);
	}
	@RequestMapping("/loginout")
	public String loginOut(HttpServletRequest request){
		request.getSession().removeAttribute("email");
		request.getSession().removeAttribute("cid");
		return "redirect:/login.jsp";
	}
	@RequestMapping("/lookUserResume")
	public String lookuserResume(HttpServletRequest request,String email){
		System.out.println(email);
		String cemail = (String) request.getSession().getAttribute("email");
		Message message = new Message();
		message.setM_fromEm(email);
		message.setM_toEm(cemail);
		message.setM_status(1);
		int f = messageService.updateMsg(message);
		System.out.println(f+"条消息被更改！");
		System.out.println("cemail="+cemail);
		request.setAttribute("useremail",email);
		return "company/lookResume";
	}
}
