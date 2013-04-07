package com.windy.zfxy.user.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.windy.zfxy.user.domain.UserInfo;
import com.windy.zfxy.user.proxy.UserManageProxy;
import com.windy.zfxy.user.proxy.UserManageService;
import com.windy.zfxy.utils.PageBean;
import com.windy.zfxy.utils.ServiceException;


/**
 *用户管理Servlet  
 */
public class UserInfoManage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public UserInfoManage() {
		super();
	}
	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); 
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// 获取请求
			String service = request.getParameter("service");
			int pageNow = 1 ;
			int pageSize = 3 ;
			// 用户列表请求
			if(service == null || service.equals("") || service.equals("display")){
				String type = request.getParameter("type") ;
				UserManageService ums = UserManageProxy.getInstance() ;
				PageBean<UserInfo> result = null ;
				if(request.getParameter("pageSize")!=null&&request.getParameter("pageSize").equals("")==false){
					pageSize=Integer.parseInt(request.getParameter("pageSize")) ;
					
				}
				if(request.getParameter("pageNow")!=null&&request.getParameter("pageNow").equals("")==false){
					pageNow=Integer.parseInt(request.getParameter("pageNow")) ;
				}
				
					String path = getRedPath(request) ;
					result = ums.listByType(pageSize,pageNow,type) ;
					request.setAttribute("result", result) ;
					request.getRequestDispatcher(path).forward(request, response);
			}
			//查询列表
			else if(service.equals("find")){
				String name = request.getParameter("keyword") ;
				if(request.getParameter("pageSize")!=null&&request.getParameter("pageSize").equals("")==false){
					pageSize=Integer.parseInt(request.getParameter("pageSize")) ;
				}
				if(request.getParameter("pageNow")!=null&&request.getParameter("pageNow").equals("")==false){
					pageNow=Integer.parseInt(request.getParameter("pageNow")) ;
				}
				UserManageService ums = UserManageProxy.getInstance() ;
				PageBean<UserInfo> result = null ;
				result = ums.findByName(pageSize, pageNow, name) ;
				request.setAttribute("result", result) ;
				request.setAttribute("keyword",name) ;
				request.getRequestDispatcher("page/manage/user/result.jsp").forward(request, response); 
			}
			
			// 追加用户请求
			else if(service.equals("add")){
				String cate = request.getParameter("category") ;
				UserInfo user = new UserInfo() ;
				setUserInfo(request,user) ;
				UserManageService ums = UserManageProxy.getInstance() ;
				ums.addUser(user) ;
				RequestDispatcher rd = request.getRequestDispatcher("usm.do?service=display&type="+cate) ;
				rd.forward(request, response); 
			}
			// 删除用户请求
			else if(service.equals("delete")){
				String type = request.getParameter("type") ;
				UserManageService ums = UserManageProxy.getInstance() ;
				ums.deleteUsers(request.getParameterValues("ids")) ;
				RequestDispatcher rd = request.getRequestDispatcher("/usm.do?service=display&type="+type+"&pageNow="+ request.getParameter("pageNow")) ;
				rd.forward(request, response); 
			}
			// 修改用户请求
			else if(service.equals("modify")){
				UserManageService ums = UserManageProxy.getInstance() ;
				UserInfo user = new UserInfo() ;
				setUserInfo(request, user) ;
				ums.modifyUser(user) ;
				request.setAttribute("message","修改成功");
				RequestDispatcher rd = request.getRequestDispatcher("page/success.jsp") ;
				rd.forward(request, response); 
			}
			else if(service.equals("display1")){
				String path = "" ;
				String id = request.getParameter("id") ;
				UserManageService ums = UserManageProxy.getInstance() ;
				UserInfo user = ums.findUserById(id) ;
				request.setAttribute("userinfo", user) ;
				if(user.getCategory().equals("student")){
					path = "page/manage/user/modifyUser.jsp" ;
				}else {
					path = "page/manage/user/teacher/updateteacher.jsp" ;
				}
				RequestDispatcher rd = request.getRequestDispatcher(path) ;
				rd.forward(request, response) ;
			}
			else{
				request.setAttribute("errorMsg", "无效请求");
				RequestDispatcher rd = request.getRequestDispatcher("/error.jsp");
				rd.forward(request, response);
			}
		} catch (ServiceException e) {
			request.setAttribute("errorMsg", e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher("/error.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			request.setAttribute("errorMsg", "无效的请求，请刷新页面重试  " + e.getStackTrace());
			RequestDispatcher rd = request.getRequestDispatcher("/error.jsp");
			rd.forward(request, response);
		}
	}
	
	/**
	 * 把请求中的信息设置到User对象
	 * @param request
	 * @param user
	 */
	private void setUserInfo(HttpServletRequest request, UserInfo user) throws ServiceException {
		try {
			user.setName(request.getParameter("name")) ;
			user.setCategory(request.getParameter("category")) ;
			if(request.getParameter("id")!=null&&request.getParameter("id").equals("")==false)
				user.setId(Integer.parseInt(request.getParameter("id"))) ;
			if(request.getParameter("password")!=null&&request.getParameter("password").equals("")==false)
				user.setPassword(request.getParameter("password")) ;
			else
				user.setPassword("") ;
			if(request.getParameter("sex")!=null&&request.getParameter("sex").equals("")==false)
				user.setSex(request.getParameter("sex")) ;
			else
				user.setSex("") ;
			if(request.getParameter("position")!=null&&request.getParameter("position").equals("")==false)
				user.setPosition(request.getParameter("position")) ;
			else 
				user.setPosition("") ;
			if(request.getParameter("detail")!=null&&request.getParameter("detail").equals("")==false)
				user.setDetail(request.getParameter("detail")) ;
			else
				user.setDetail("暂无简介") ;
			if(request.getParameter("email")!=null&&request.getParameter("email").equals("")==false)
				user.setEmail(request.getParameter("email")) ;
			else 
				user.setEmail("") ;
			if(request.getParameter("tel")!=null&&request.getParameter("tel").equals("")==false)
				user.setTel(request.getParameter("tel")) ;
			else 
				user.setTel("") ;
			if(request.getParameter("head")!=null&&request.getParameter("head").equals("")==false)
				if(getFilePath(request.getParameter("head")).trim().equals("")==false){
					user.setHead(getFilePath(request.getParameter("head"))) ;
				}
			else 
				user.setHead("") ;
				
		} catch (RuntimeException e) {
			throw new ServiceException("录入内容格式不合法，请重新输入！", e);
		}
	}
	/**
	 * 
	 * @param content
	 * @return String 
	 */
	private String getFilePath(String content) {
		String temp = "";
		int l = 0;
		int start = 0;
		int last = 0;
		while (start != -1) {
			start = content.indexOf("<img", l);
			if (start != -1) {
				int b = content.indexOf("src", start);
				last = content.indexOf(">", start);
					temp = content.substring(b+5, last-3) ; 
				break ;
			}
		}
		return temp;
	}
	/**
	 * 
	 * @param request
	 * @return 跳转路径
	 */
	private String getRedPath(HttpServletRequest request){
		String path = "" ;
		try {
			if(request.getParameter("type")!=null&&request.getParameter("type").equals("")==false){
				if(request.getParameter("type").equals("student")){
					path="page/manage/user/userList.jsp" ;
				}
				else if(request.getParameter("type").equals("teacher")){
					path = "page/manage/user/teacher/showTeacher.jsp?category=teacher" ;
				}
				else if(request.getParameter("type").equals("leader")){
					path = "/page/manage/user/teacher/showTeacher.jsp?category=leader" ;
				}
				else if(request.getParameter("type").equals("friend")){
					path = "/page/manage/user/teacher/showTeacher.jsp?category=friend" ;
				}
				
			}
		//	request.getParameter("type") ; //显示那种类型
			//request.getParameter("pageNow") ;
			//request.getParameter("page") ;
		} catch (RuntimeException e) {
			throw new ServiceException("无效的Url，请重新输入！", e);
		}
		return path ;
	}
}