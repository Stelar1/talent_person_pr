package com.wls.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.wls.entity.UserInf;
import com.wls.service.UserInfService;

@Controller
@RequestMapping("/userinf")
public class UserInfController {
	@Resource
	UserInfService service;

	@RequestMapping("/update")
	public String update(HttpServletRequest request,String uname,String uphone,
			String usex,String uedu,String ujob,String province,String city,String county,
			String wprovince,String wcity,String wcounty,String ubirth,String imgsrc,ModelMap modelMap){
		
		System.out.println(imgsrc);
		String email = (String) request.getSession().getAttribute("email");
		if(email==null){
			return "redirect:/login.jsp";
		}
		UserInf userInf = new UserInf(email,wprovince+"-"+wcity+"-"+wcounty, ujob, uname, usex, 
				ubirth,province+"-"+city+"-"+county, uedu,imgsrc, uphone);
		//System.out.println(userInf);
		int f = 0;
		UserInf useri = service.selectById(email);
		if(useri==null||useri.getUname()==null){
			f = service.add(userInf);
		}
		else{
			f =service.updateInf(userInf);
		}
		if(f>0){
			//用户信息添加成功后，就将他的昵称添加到session里面
			request.getSession().setAttribute("name",uname);
			//添加成功
			return "redirect:../user/showUserInf.jsp";
		}else{
			return "redirect:../user/addUserinf.jsp";
		}

	}
	@ResponseBody
	@RequestMapping("/uploadimg")
	public String uploadImg(@RequestParam(value="img")MultipartFile file,HttpServletRequest request){
		
		String fileName = file.getOriginalFilename();
		if(file!=null && fileName!=null && !fileName.equals("")){
			HttpSession session = request.getSession();
			String name = (String) session.getAttribute("email");
			String path = session.getServletContext().getRealPath("");
			//得到运行的项目的根目录：F:\Tomcat\apache-tomcat-7.0.57\webapps\talent_person
			System.out.println("getContextPath：  "+path);
			//得到文件的名称
			System.out.println("file name : "+fileName);
			//创建文件夹和文件
			//以用户的邮箱作为用户的文件夹来存放文件，
			//同时用户的头像也以他的邮箱来命名
			File f = new File(path+"res\\"+name+"\\", name+fileName.substring(fileName.lastIndexOf(".")));
			//文件夹或文件不存在，创建它。
			if(!f.exists()){
				f.mkdirs();
			}
			//将上传的文件转存到新建的文件中。
			try {
				file.transferTo(f);
			} catch (IllegalStateException e) {
				e.printStackTrace();
				return "0";
			} catch (IOException e) {
				e.printStackTrace();
				return "0";
			}
			//返回头像在服务器中的位置，这样查询出来就可以使用
			return "res/"+name+"/"+name+fileName.substring(fileName.lastIndexOf("."));
		}else{
			return "0";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/getuersInf",produces="text/html;charset=UTF-8")
	public String getInf(HttpServletRequest request){
		System.out.println("获得用户的信息。。。");
		String email = (String) request.getSession().getAttribute("email");
		UserInf userInf = service.selectById(email);
		System.out.println(userInf);
		return JSON.toJSONString(userInf);
	}
	
//	通过email查新信息
	@ResponseBody
	@RequestMapping(value="/getuersInfByEmail",produces="text/html;charset=UTF-8")
	public String getInfByEmail(String email){
		System.out.println("获得用户的信息。。。");
		UserInf userInf = service.selectById(email);
		System.out.println(userInf);
		return JSON.toJSONString(userInf);
	}
	
	
	// 按条件分页查询信息
	@RequestMapping("/getUserInfPager")
	@ResponseBody
	public Object getUserInfPager(UserInf userinf) {
		return service.getUserInfPager(userinf);

	}
	//根据Email获取人才的详细信息
	@RequestMapping("/showUserinfo")
	public ModelAndView showUserinfo(String email){
		ModelAndView  mv = new ModelAndView("company/showUserinfo");
		Map<String,Object> data= new HashMap<String,Object>();
		data.put("userinf", service.showUserinfo(email));
		mv.addObject("userinf", service.showUserinfo(email));
		return mv;
	}
}
