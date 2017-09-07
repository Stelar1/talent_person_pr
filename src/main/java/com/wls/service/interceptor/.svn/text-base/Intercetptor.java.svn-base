package com.wls.service.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class Intercetptor extends HandlerInterceptorAdapter{
	@Override  
	public boolean preHandle(HttpServletRequest request,  
			HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession(false);
		
		String requestUri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String url = requestUri.substring(contextPath.length());  
		System.out.println(requestUri);
		System.out.println(contextPath);
		System.out.println(url);
		if(session==null||session.getAttribute("email")==null){
			request.getRequestDispatcher("/login.jsp").forward(request, response);
			return false;
		}else {
			return true;
		}
		  
		/*
		String requestUri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String url = requestUri.substring(contextPath.length());         
		if ("/userController/login".equals(url)) {                  
			return true;
		}else {               
			String username =  (String)request.getSession().getAttribute("user"); 
			if(username == null){
				request.getRequestDispatcher("/page/index.jsp").forward(request, response);
				return false;
			}else
				return true;   
		}*/

	}        
	/**
	 * 在业务处理器处理请求执行完成后,生成视图之前执行的动作   
	 * 可在modelAndView中加入数据，比如当前时间
	 */
	@Override  
	public void postHandle(HttpServletRequest request,  
			HttpServletResponse response, Object handler,  
			ModelAndView modelAndView) throws Exception {   
		
	}        
	/** 
	 * 在DispatcherServlet完全处理完请求后被调用,可用于清理资源等    
	 * 当有拦截器抛出异常时,会从当前拦截器往回执行所有的拦截器的afterCompletion() 
	 */  
	@Override  
	public void afterCompletion(HttpServletRequest request,  
			HttpServletResponse response, Object handler, Exception ex)  
					throws Exception {  
	}  
}
