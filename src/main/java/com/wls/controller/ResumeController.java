package com.wls.controller;

import java.io.File;
import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.wls.entity.Resume;
import com.wls.service.ResumeService;

@Controller
@RequestMapping("/resume")
public class ResumeController {
	@Resource
	ResumeService resumeService;

	@ResponseBody
	@RequestMapping(value="/upload",produces="text/html;charset=UTF-8")
	public String writeResume(HttpServletRequest request,String json){
		if(json==null){
			return "error";
		}
		String email = (String) request.getSession().getAttribute("email");
		String jsonInDB = resumeService.findJsonResume(email);
		int f = 0;
		if(jsonInDB==null){
			f = resumeService.addResume(new Resume(email, json));
		}else{
			f = resumeService.updateResume(new Resume(email, json));
		}
		if(f>0){
			return "ok";
		}else{
			return "error";
		}
	}
	
	@ResponseBody
	@RequestMapping("/uploadfile")
	public String uploadFile(@RequestParam(value="file")MultipartFile file,HttpServletRequest request){
		System.out.println("文件上传");
		String fileName = file.getOriginalFilename();
		if(file!=null&&fileName!=null&&!fileName.equals("")){
			HttpSession session = request.getSession();
			String name = (String) session.getAttribute("email");
			String path = session.getServletContext().getRealPath("");
			//得到运行的项目的根目录
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
				return "error";
			} catch (IOException e) {
				e.printStackTrace();
				return "error";
			}
			//返回头像在服务器中的位置，这样查询出来就可以使用
			System.out.println(path+"res\\"+name+"\\"+name+fileName.substring(fileName.lastIndexOf(".")));
			return path+"res\\"+name+"\\"+name+fileName.substring(fileName.lastIndexOf("."));
		}else{
			return "error";
		}
	}
//	查看简历
	@ResponseBody
	@RequestMapping(value="/getresume",produces="text/html;charset=UTF-8")
	public String getResume(HttpServletRequest request){
		String email = (String) request.getSession().getAttribute("email");
		if(email!=null){
		    return resumeService.findJsonResume(email);
		}else{
			return "error";
		}
	}
//	通过email查询简历
	@ResponseBody
	@RequestMapping(value="/getresumeByEmail",produces="text/html;charset=UTF-8")
	public String getResumeByemail(String email){
		return resumeService.findJsonResume(email);
	}
	
	
}
