package com.wls.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.wls.entity.Company;
import com.wls.entity.Safe;
import com.wls.entity.User;
import com.wls.entity.UserInf;
import com.wls.service.CompanyService;
import com.wls.service.UserInfService;
import com.wls.service.UserService;
import com.wls.utils.MailMsg;

/**
 * 用户控制器
 * @author long
 *
 */
@Controller
@RequestMapping("/user")
public class UserController {
	@Resource
	private UserService service;

	@Resource
	private UserInfService infService;

	@Resource
	private CompanyService companyService;

	@RequestMapping("/adduser")
	public String addUser(HttpServletRequest request,String email,String password,int access,String code){
		String c = (String) request.getSession(false).getAttribute("code");
		System.out.println(email+" "+password+" "+access+" "+code+" "+c);
		if(c==null||code==null||!code.equals(c)){
			request.setAttribute("info","验证码错误！");
			return "redirect:/regist.jsp";
		}else {
			int f = service.addUser(new User(email, password,Integer.valueOf(access)));
			if(f>0){
				return "redirect:/login.jsp";
			}else {
				request.setAttribute("info","注册失败！");
				return "redirect:/regist.jsp";
			}
		}
	}
	@RequestMapping("/suremail")
	@ResponseBody
	public String sureEmail(HttpServletRequest request,String email){
		long num = (long) (Math.random()*1000000);
		HttpSession session = request.getSession();
		session.setAttribute("code",num+"");
		try {
			MailMsg.sendMail(email,"注册验证码","<h2>您的验证码是：<h2><br/>"+num);
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return "ok";
	}
	@RequestMapping("/getcode")
	@ResponseBody
	public String sureEmail(HttpServletRequest request){
		String code = null;
		HttpSession session = request.getSession(false);
		code = (String) session.getAttribute("code");
		System.out.println(code);
		if(session==null||code==null){
			return "error";
		}else {
			return code;
		}
	}
	@RequestMapping("/checkmail")
	@ResponseBody
	public String checkEmail(String email){
		//		System.out.println("checkEmail--->"+email);
		User u = service.selectByEmail(email);
		if(u!=null){
			return "no";
		}else{
			return "ok";
		}
	}
	/***
	 * 登录
	 * @param request
	 * @param email
	 * @param password
	 * @return
	 */
	@RequestMapping("/login")
	public String dologin(HttpServletRequest request,String email,String password){
		System.out.println(email+":"+password);
		if(email==null||password==null){
			request.setAttribute("info","邮箱或者密码不能为空！");
			return "redirect:/login.jsp";
		}else{
			User user = service.selectByEmail(email);
			if(password.equals(user.getPassword())){
				HttpSession session = request.getSession();
				session.setAttribute("email",email);
				//普通用户
				if(user.getAccess()==2){
					System.out.println(user);
					UserInf inf = infService.selectById(email);
					//没有用户信息，跳转到添加用户信息的界面
					if(inf==null){
						session.setAttribute("inf","noinf");
						return "user/addUserinf";
					}else{
						session.setAttribute("name",inf.getUname());
						return "redirect:/index.jsp";
					}
				}else if(user.getAccess()==1){//企业
					Company company = companyService.selectById(email);
					//没有企业信息，跳转到添加企业信息的界面
					if(company==null||company.getC_name()==null){
						session.setAttribute("cid","no");
					}else{
						session.setAttribute("cid",company.getC_id());
					}
					return "company/main";
				}
			}
			//密码错误
			request.setAttribute("info","邮箱或者密码不正确！");
			return "redirect:/login.jsp";
		}
	}
	/**
	 * 密保方法
	 */
	//查询用户的密保
	@ResponseBody
	@RequestMapping(value="/getUserSafe",produces="text/html;charset=UTF-8")
	public String getSafe(HttpServletRequest request){
		String email = (String) request.getSession().getAttribute("email");
		String safe = service.selectSafe(email);
		if(safe==null){
			return "no";
		}else{
			//取出密保问题发送到前端
			List<Safe> fs = JSONArray.parseArray(safe,Safe.class);
			Map<String, String> safeq = new HashMap<String, String>();
			for(int i = 0;i<3;i++){
				safeq.put("q"+i,fs.get(i).getQuestion());
			}
			return JSON.toJSONString(safeq);
		}
	}
	//设置用户的密保
	@ResponseBody
	@RequestMapping(value="/setUserSafe",produces="text/html;charset=UTF-8",method=RequestMethod.POST)
	public String setSafe(HttpServletRequest request,String json){
		String email = (String) request.getSession().getAttribute("email");
		int f = service.updateSafe(new User(email, json));
		if(f>0){
			return "ok";
		}else{
			return "false";
		}
	}
	//验证输入的密保是否正确
	@ResponseBody
	@RequestMapping(value="/checkQs",produces="text/html;charset=UTF-8",method=RequestMethod.POST)
	public String checkQs(HttpServletRequest request,String qs,String as){
		String email = (String) request.getSession().getAttribute("email");
		String safe = service.selectSafe(email);
		//System.out.println(qs);
		//System.out.println(as);
		List<Safe> fs = JSONArray.parseArray(safe,Safe.class);
		List<String> aList = JSONArray.parseArray(as, String.class);
		List<String> qList = JSONArray.parseArray(qs, String.class);
		if(aList.size()!=3||qList.size()!=3){
			try {
				throw new Exception("参数的长度不匹配");
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "error";
		}
		Safe temp = null;
		int f = 0;
		for(int i=0;i<3;i++){
			temp = fs.get(i);
			for(int j=0;j<3;j++){
				if(temp.getQuestion().equals(qList.get(j))){
					if(temp.getAnswer().equals(aList.get(j))){
						f++;
						break;
					}
				}
			}
		}
		if(f==3){
			return "ok";
		}else{
			return "no";
		}
	}
	//	修改密码
	@ResponseBody
	@RequestMapping(value="/updatepwd",produces="text/html;charset=UTF-8")
	public String updatepwd(HttpServletRequest request,String pwd1,String pwd2){
		String email = (String) request.getSession().getAttribute("email");
		if(email==null){
			return "登录状态错误！";
		}else{
			User user = service.selectByEmail(email);
			if(user.getPassword().equals(pwd1)){
				int f  = service.updatePwd(new User(email, pwd2,0));
				if(f>0){
					return "ok";
				}else{
					return "修改失败！";
				}
			}else{
				return "原密码错误！";
			}
		}
	}

//	退出登录
	@RequestMapping("/loginout")
	public String loginout(HttpServletRequest request){
		request.getSession().removeAttribute("email");
		request.getSession().removeAttribute("name");
		return "redirect:/login.jsp";
	}


	//	用户分页
	@RequestMapping("/getUserPager")
	@ResponseBody
	public Object getUserPager(User user) {
		return service.getUserPager(user);

	}

	// 删除用户

	@RequestMapping("/delUser")
	@ResponseBody
	public Object delUser(@RequestParam("emails[]") String[] emails) {
		return service.delUser(emails);
	}
	
//	找回密码
	@RequestMapping(value="/findpassword",produces="text/html;charset=UTF-8")
	@ResponseBody
	public String findpassword(HttpServletRequest request,String email){
		User user = service.selectByEmail(email);
		System.out.println(email);
		if(user==null){
			return "该账号还没有注册！";
		}else{
			long num = (long) (Math.random()*1000000);
			HttpSession session = request.getSession();
			session.setAttribute("findcode",num+"");
			try {
				MailMsg.sendMail(email,"找回密码","<h2>您的验证码是：<h2><br/>"+num);
			} catch (Exception e) {
				e.printStackTrace();
				return "获取验证码失败！";
			}
			return "ok";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/resetPassword",produces="text/html;charset=UTF-8")
	public String resetPwd(HttpServletRequest request,String code,String email,String pwd){
		String rcode = (String) request.getSession().getAttribute("findcode");
		if(rcode!=null&&rcode.equals(code)){
			int f = service.updatePwd(new User(email, pwd,0));
			if(f>0){
				return "ok";
			}else{
				return "找回密码失败！";
			}
		}else{
			return "验证码错误！";
		}
		
	}

	
	
	
}
