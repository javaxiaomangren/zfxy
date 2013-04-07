package com.windy.zfxy.edu.control;

import java.io.IOException;
import java.io.Serializable;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.windy.zfxy.edu.domain.EduInfo;
import com.windy.zfxy.edu.proxy.EduInfoProxy;
import com.windy.zfxy.edu.proxy.IEduInfoService;
import com.windy.zfxy.utils.PageBean;
import com.windy.zfxy.utils.ServiceException;

public class EduManage extends HttpServlet implements Serializable {
	
	private static final long serialVersionUID = 1L;
	public EduManage(){
		super() ;
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
		this.doPost(request, response) ;
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
			String service = request.getParameter("service");			//获取请求
			IEduInfoService eduProxy = EduInfoProxy.getInstance() ;		//取得对象
			PageBean<EduInfo> result = null ;							//定义结果集
			EduInfo oneEdu = null ;										//定义一个新闻信息
			int pageNow = 1 ;											//定义当前页	
			int pageSize = 15 ;											//定义每页显示信息数量
			if(request.getParameter("pageSize")!=null&&request.getParameter("pageSize").equals("")==false){
				pageSize=Integer.parseInt(request.getParameter("pageSize")) ;
			}
			if(request.getParameter("pageNow")!=null&&request.getParameter("pageNow").equals("")==false){
				pageNow=Integer.parseInt(request.getParameter("pageNow")) ;
			}
			/* 
			 * 列表请求
			 */
			if(service == null || service.equals("") || service.equals("display")){
				String type = request.getParameter("type") ;
				result = eduProxy.getInfoByType(pageSize, pageNow, type) ;
				request.setAttribute("result", result) ;
				request.setAttribute("type", type) ;
				if(type.equals("bksfile")||type.equals("yjsfile")||type.equals("jsfile")){
					request.getRequestDispatcher("page/manage/upload/fileList.jsp?category="+type).forward(request, response) ;
				}else{
					request.getRequestDispatcher("page/manage/eduinfo/showInfo.jsp").forward(request, response) ;
				}
			}
			/*
			 * 追加
			 */ 
			else if(service.equals("add")){
				oneEdu = new EduInfo() ;
				setEduInfo(request, oneEdu) ;
				eduProxy.doAdd(oneEdu) ;
				request.setAttribute("message","录入成功");
				request.setAttribute("type",oneEdu.getCategory()); 
				request.getRequestDispatcher("page/success.jsp").forward(request, response) ;
			}
			/* 
			 * 删除
			 */
			else if(service.equals("delete")){
				if(request.getParameterValues("ids")!=null&&request.getParameterValues("ids").length!=0){
					String[] ids = request.getParameterValues("ids") ; 
					eduProxy.doDelete(ids) ;
					request.setAttribute("message","删除成功"); 
					request.getRequestDispatcher("page/success.jsp").forward(request, response) ;
				}
			}
			/*
			 * 修改
			 */ 
			else if(service.equals("modify")){
				oneEdu = new EduInfo() ;
				setEduInfo(request, oneEdu) ;
				eduProxy.doUpdate(oneEdu) ;
				request.setAttribute("message","修改成功"); 
				request.setAttribute("type",oneEdu.getCategory()); 
				request.getRequestDispatcher("page/success.jsp").forward(request, response) ;
			}
			/*
			 * 上传文件
			 */
			else if(service.equals("upload")){
				oneEdu = new EduInfo() ;
				oneEdu.setTitle(request.getParameter("title")) ;
				oneEdu.setCategory(request.getParameter("category")) ;
				if(request.getParameter("author")!=null&&request.getParameter("author").equals("")==false)
					oneEdu.setAuther(request.getParameter("author")) ;
				else
					oneEdu.setAuther("匿名") ;
				oneEdu.setContent(getFileUrl(request.getParameter("fileUrl"))); 
				oneEdu.setAudited("audited") ;
				eduProxy.doAdd(oneEdu) ;
				request.setAttribute("message","上传成功");
				request.getRequestDispatcher("page/success.jsp").forward(request, response) ;
			}
			/*
			 * 查询
			 */
			else if(service.equals("find")){
				if(request.getParameter("id")!=null&&request.getParameter("id").trim().equals("")==false){
					String id = request.getParameter("id") ;
					oneEdu = eduProxy.getInfoById(id) ;
					request.setAttribute("result", oneEdu) ;
					request.getRequestDispatcher("page/manage/eduinfo/updateInfo.jsp").forward(request, response) ;
				}
				//按名称查询
//				else if(request.getParameter("name")!=null&&request.getParameter("name").trim().equals("")==false){
//					String name = request.getParameter("name") ;
//					result = eduProxy.getInfoByName(pageSize, pageNow, name) ;
//					request.setAttribute("result", result) ;
//					path = getRedPath(request);
//					request.getRequestDispatcher(path).forward(request, response) ;
//				}
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
	 * 	封装客户端请求
	 * @param request
	 * @param edu
	 * @throws ServiceException
	 */
	private void setEduInfo(HttpServletRequest request, EduInfo edu) throws ServiceException {
		try {
			/*
			 * 新闻标题，必填内容
			 */
			if(request.getParameter("title")!=null&&request.getParameter("title").equals("")==false)
				edu.setTitle(request.getParameter("title")) ;
			else 
				edu.setTitle("") ;
			/*
			 * 新闻分类，必填内容
			 */
			if(request.getParameter("category")!=null&&request.getParameter("category").equals("")==false)
				edu.setCategory(request.getParameter("category")) ;
			else 
				edu.setCategory("") ;
			/*
			 * 新闻id,主要用于修改信息，和查询
			 */
			if(request.getParameter("id")!=null&&request.getParameter("id").equals("")==false)
				edu.setId(Integer.parseInt(request.getParameter("id"))) ;
			/*
			 * 新闻作者
			 */
			if(request.getParameter("author")!=null&&request.getParameter("author").equals("")==false)
				edu.setAuther(request.getParameter("author")) ;
			else
				edu.setAuther("匿名") ;
			/*
			 * 新闻来源
			 */
			if(request.getParameter("resource")!=null&&request.getParameter("resource").equals("")==false)
				edu.setNewsResource(request.getParameter("resource")) ;
			else 
				edu.setNewsResource("") ;
			/*
			 * 新闻是否通过审核
			 */
			if(request.getParameter("audited")!=null&&request.getParameter("audited").equals("")==false)
				edu.setAudited(request.getParameter("audited")) ;
			else
				edu.setAudited("是") ;
			/*
			 * 新闻内容，同时设置图片路径
			 */
			if(request.getParameter("content")!=null&&request.getParameter("content").equals("")==false){
				edu.setContent(request.getParameter("content")) ;
				if(getFilePath(request.getParameter("content")).trim().equals("")==false)
					edu.setPhotoPath(getFilePath(request.getParameter("content"))) ;
				else
					edu.setPhotoPath("") ;
			}else{ 
				edu.setContent("") ;
			}
			/*
			 * 是否是图片新闻
			 */
			if(request.getParameter("isphoto")!=null&&request.getParameter("isphoto").equals("")==false)
				edu.setIsPhoto(request.getParameter("isphoto")) ;
			else
				edu.setIsPhoto("否") ;
		} catch (RuntimeException e) {
			throw new ServiceException("录入内容格式不合法，请重新输入！", e);
		}
	}
	/**
	 * 读取图片路径，用于上传图片
	 * @param content
	 * @return 图片路径
	 */
	private String getFilePath(String content) {
		String temp = "";
		int l = 0;
		int start = 0;
		int last = 0;
		while (start != -1) {
			start = content.indexOf("<img", l);
			if (start != -1) {
				int b = content.indexOf("userfiles", start);
				last = content.indexOf(">", start);
					temp = content.substring(b, last-3) ; 
				break ;
			}
		}
		return temp;
	}
	/**
	 * 读取文件路径，用于上传文件
	 * @param content
	 * @return
	 */
	private String getFileUrl(String content) {
		String temp = "";
		int l = 0;
		int start = 0;
		int last = 0;
		while (start != -1) {
			start = content.indexOf("<a", l);
			if (start != -1) {
				int b = content.indexOf("userfiles", start);
				last = content.indexOf(">", start);
					temp = content.substring(b, last-1) ; 
				break ;
			}
		}
		return temp;
	}
	
	public void destroy() {
		super.destroy(); 
	}

}
