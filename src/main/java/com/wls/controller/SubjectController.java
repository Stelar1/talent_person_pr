package com.wls.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.wls.entity.Subject;
import com.wls.service.SubjectService;

/**
 * @author wang
 * 
 * 
 */

@Controller
@RequestMapping("/subject")
public class SubjectController {
	@Autowired
	private SubjectService subjectService;
	
	// 查询所有试题信息
		@RequestMapping("/getAllSubject")
		@ResponseBody
		public Object getAllSubject() {
			return subjectService.getAllSubject();
		}
		
		// 按条件分页查询信息
		@RequestMapping("/getSubjectPager")
		@ResponseBody
		public Object getSubjectPager(Subject subject) {
			return subjectService.getSubjectPager(subject);

		}
		
		// 发布试题信息
		@RequestMapping("/addSubject")
		@ResponseBody
		public Object addSubject(HttpServletRequest request,Subject subject) {
			
			subjectService.addSubject(subject);
			return subjectService.getSubjectPager(subject);
		}
		//编辑试题信息
		@RequestMapping("/editSubject")
		@ResponseBody
		public Object editSubject(HttpServletRequest request,Subject subject) {

			return subjectService.editSubject(subject);
		}
		//删除试题信息
		@RequestMapping("/delSubject")
		@ResponseBody
		public Object delSubject(@RequestParam("subjectIDs[]") Integer[] subjectIDs) {
			return subjectService.delSubject(subjectIDs);
		}

		// 根据ID试题信息详情
		@RequestMapping("/showSubjectById")
		public ModelAndView showSubjectById(Integer subjectID) {
			ModelAndView mv = new ModelAndView("admin/subjectInfo");
			// 请求转发，跳转到recruitInfo.jsp并传递查找到的信息
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("subject", subjectService.showSubjectById(subjectID));
			// 跳转到 /recruit/recruitInfo.jsp页面
			System.out.println(subjectID);
			System.out.println("huoqu "+subjectService.showSubjectById(subjectID));
			mv.addObject("subject", subjectService.showSubjectById(subjectID));
			return mv;
		}
		@RequestMapping("/getRandomSubject")
		@ResponseBody
		public Object getRandomSubject(HttpServletRequest request){
			List<Subject> subjects = subjectService.randomFindSubject(20);//随机选择20道题目
			request.setAttribute("subjects", subjects);
			return subjects;
			
		}
		
	
	
	
}
