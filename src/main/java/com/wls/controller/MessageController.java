package com.wls.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.wls.entity.Message;
import com.wls.entity.Recruit;
import com.wls.service.MessageService;
import com.wls.service.RecruitService;

@Controller
@RequestMapping("/message")
public class MessageController {
	
	@Resource
	MessageService messageService;
	@Resource
	RecruitService recruitService;
	
	@RequestMapping(value = "/userRecruitInf",produces="text/html;charset=UTF-8")
	@ResponseBody
	public String getUserRecruitInf(HttpServletRequest request){
		String email = (String) request.getSession().getAttribute("email");
		
		if(email!=null){
			Map<String, Message> msgMap = new HashMap<String, Message>();
			Map<String, Recruit> recruitMap = new HashMap<String, Recruit>();
			List<Message> msgs= messageService.fromMeMsg(email);
			int len = msgs.size();
			for(int i = 0;i<len;i++){
				msgMap.put("data"+i,msgs.get(i));
				recruitMap.put("data"+i,recruitService.showRecruitById(msgs.get(i).getM_obid()));
			}
			Object[] jsonData = new Object[2];
			jsonData[0]=msgMap;
			jsonData[1]=recruitMap;
			return JSON.toJSONString(jsonData);
		}else{
			return "no";
		}
	}
}
