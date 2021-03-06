package com.wls.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.wls.entity.Recruit;
import com.wls.entity.User;
import com.wls.service.RecruitService;

/**
 * 
 * @author wang
 *
 */
@Controller
@RequestMapping("/recruit")
public class RecruitController {
	@Autowired
	private RecruitService recruitService;
	// 查询所有发布的招聘信息
	@RequestMapping("/getAllRecruit")
	@ResponseBody
	public Object getAllRecruit() {
		return recruitService.getAllRecruit();
	}
	// 按条件分页查询信息
	@RequestMapping("/getRecruitPager")
	@ResponseBody
	public Object getRecruitPager(Recruit recruit) {
		return recruitService.getRecruitPager(recruit);

	}
	// 发布招聘信息
	@RequestMapping("/addRecruit")
	@ResponseBody
	public Object addRecruit(HttpServletRequest request,Recruit recruit) {
		//		System.out.println("..........");
		//		System.out.println(recruit);
		int cid = (int) request.getSession().getAttribute("cid");

		System.out.println(cid);
		recruit.setCid(cid);
		recruit.setEmail((String)request.getSession().getAttribute("email"));
		recruitService.addRecruit(recruit);
		return recruitService.getRecruitPager(recruit);
	}
	//编辑招聘信息
	@RequestMapping("/editRecruit")
	@ResponseBody
	public Object editRecruit(HttpServletRequest request,Recruit recruit) {
//		System.out.println("============");
		System.out.println(recruit);
		int cid = (int) request.getSession().getAttribute("cid");
		recruit.setCid(cid);
		recruit.setEmail((String)request.getSession().getAttribute("email"));
		return recruitService.editRecruit(recruit);
	}
	//删除招聘信息
	@RequestMapping("/delRecruit")
	@ResponseBody
	public Object delRecruit(@RequestParam("rids[]") Integer[] rids) {
		return recruitService.delRecruit(rids);
	}

	// 根据ID获取招聘信息详情
	@RequestMapping("/showRecruitById")
	public ModelAndView showRecruitById(Integer rid) {
		ModelAndView mv = new ModelAndView("company/recruitInfo");
		// 请求转发，跳转到recruitInfo.jsp并传递查找到的信息
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("recruit", recruitService.showRecruitById(rid));
		// 跳转到 /recruit/recruitInfo.jsp页面
		System.out.println(rid);
		System.out.println("huoqu "+recruitService.showRecruitById(rid));
		mv.addObject("recruit", recruitService.showRecruitById(rid));
		return mv;
	}

}
