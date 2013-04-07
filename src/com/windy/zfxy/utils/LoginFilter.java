package com.windy.zfxy.utils;
import java.io.*;

import javax.servlet.http.*;
import javax.servlet.*;

public class LoginFilter implements Filter{
/**
 * 登录验证过滤器
 */
	public void destroy() {
	}
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		//session属于http范畴，所以要将ServletRequest转换成httpServletRequest
		
		try {
			HttpServletRequest req = (HttpServletRequest)request;
			HttpSession session = req.getSession();
			if(session.getAttribute("username")!=null){
				chain.doFilter(request,response) ;
			}else{
				request.getRequestDispatcher("error.jsp").forward(request, response);
			}
		} catch (RuntimeException e) {
			e.printStackTrace();
		}
	}
	public void init(FilterConfig arg0) throws ServletException {
	}
	
}
