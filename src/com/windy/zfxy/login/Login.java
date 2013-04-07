package com.windy.zfxy.login; 
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.windy.zfxy.user.proxy.UserManageProxy;
import com.windy.zfxy.user.proxy.UserManageService;


public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}
	/**
	 * ��֤�û���¼
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			try {
				String name = request.getParameter("username");
				String pass = request.getParameter("password");
				UserManageService udao = UserManageProxy.getInstance() ;
				String password = udao.getPassword(name);
				if(pass.equals(password)){
					request.getSession().setAttribute("username",name);
					//request.getRequestDispatcher("page/manage/frame/manage.html").forward(request,response) ;
					response.sendRedirect("page/manage/frame/manage.html") ;
				}else{
					request.setAttribute("errorMsg","请先登陆") ;
//					response.sendRedirect("/page/rror.jsp") ;
					request.getRequestDispatcher("page/error.jsp").forward(request,response) ;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
	}

}
