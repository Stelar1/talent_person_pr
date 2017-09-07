package com.wls.controller;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.wls.entity.ComResume;
import com.wls.entity.Message;
import com.wls.entity.Recruit;
import com.wls.entity.Resume;
import com.wls.entity.UserInf;
import com.wls.service.ComResumeService;
import com.wls.service.CompanyService;
import com.wls.service.MessageService;
import com.wls.service.RecruitService;
import com.wls.service.ResumeService;
import com.wls.service.UserInfService;
import com.wls.utils.ResultHelper;

@Controller
@RequestMapping("/selectcruit")
public class SelectCruitController {
	@Resource
	RecruitService recruitService;
	@Resource
	UserInfService ueInfService;
	@Resource
	ResumeService resumeService;
	@Resource
	ComResumeService comResumeService;
	@Resource
	MessageService messageService;
	@Resource
	CompanyService companyService;
	
//	得到招聘信息，分页
	@ResponseBody
	@RequestMapping(value="/getrecruit",produces="text/html;charset=UTF-8")
	public String getRecuit(String job,int type,String exper,String place,String edu,int pagenum){
		Recruit recruit = new Recruit(pagenum, exper, edu, job, type, place);
		ResultHelper ob =  recruitService.userSelect(recruit);
		//List<Recruit> recruits = (List<Recruit>) ob.getRows();
		//System.out.println(recruits);
		//System.out.println(ob);
		return JSON.toJSONString(ob);
	}
//	中间过渡，当从index页面跳到搜索界面时，需要经过此方法传递参数
	@RequestMapping("/select")
	public String select(HttpServletRequest request,String job,int type,String exper,String place,String edu,ModelMap map){
		String option = null;
		String ctype = null;
		if(job!=null){
			ctype="job";
			option = job;
		}else if(type!=4){
			ctype="type";
			option = type+"";
		}else if(exper!=null){
			ctype="exper";
			option = exper;
		}else if(place!=null){
			ctype="place";
			option = place;
		}else if(edu!=null){
			ctype="edu";
			option=edu;
		}else{
			ctype="null";
		}
		System.out.println(ctype+":"+option);
		request.setAttribute("ctype", ctype);
		request.setAttribute("condition",option);
		map.put("ctype",ctype);
		map.put("condition",option);
		
		return "searchRecruit";
	}
//	查看招聘信息详细信息
	@RequestMapping("/recruitdetail")
	public String selectRecruit(HttpServletRequest request,Integer rid,ModelMap map){
		Recruit recruit = recruitService.showRecruitById(rid);
		map.put("re", recruit);
		return "recruitdetail";
	}
//	投送简历
	@RequestMapping(value="/recruit",produces="text/html;charset=UTF-8")
	@ResponseBody
	public String recruit(HttpServletRequest request,int cid,int rid,String cemail){
		String email = (String) request.getSession().getAttribute("email");
		if(email==null){
			return "nologin";
		}else{
			int f = 0;
			Resume resume = resumeService.findResume(email);
			UserInf inf = ueInfService.selectById(email);
			f = comResumeService.addComResume(new ComResume(email,
					resume.getUr_id(), inf.getUname(),new Date().getTime(),cid, cemail, rid));
			//同时将消息写入到message表
			messageService.addMessage(new Message(email, cemail, rid,null,new Date().getTime(), 0,null));
			if(f>0){
				return "ok";
			}else{
				return "no";
			}
		}
	}
//	查看公司信息
	@RequestMapping("/companyinf")
	public String companyDetai(String email,ModelMap map){
		map.put("com",companyService.selectById(email));
		return "companyinf";
	}
	
	// 按条件分页查询信息
		@RequestMapping("/getComResumePager")
		@ResponseBody
		public Object getComResumePager(ComResume comresume) {
			return comResumeService.getComResumePager(comresume);

		}
		//删除简历
		@RequestMapping("/delComResume")
		@ResponseBody
		public Object delComResume(@RequestParam("cr_ids[]")Integer[] cr_ids){
			return comResumeService.delComResume(cr_ids);
		}
	
	
	
}
