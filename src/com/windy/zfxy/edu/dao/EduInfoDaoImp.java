package com.windy.zfxy.edu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.windy.zfxy.edu.domain.EduInfo;
import com.windy.zfxy.utils.DBUtils;
import com.windy.zfxy.utils.DaoException;
import com.windy.zfxy.utils.PageBean;

public class EduInfoDaoImp implements EduInfoDao {
	private Connection connection  ;
	public EduInfoDaoImp(Connection conn){
		this.connection = conn ;
	}
	
	public void doAdd(EduInfo edu) {
		String sql = "INSERT INTO eduinfo(title," +
										"content," +
										"auther," +
									    "category," +
									    "photopath," +
									    "audited," +
									    "newsResource," +
									    "isphoto)"+
						"VALUES ('"+ edu.getTitle()+"','"
								   + edu.getContent()+"','"
								   + edu.getAuther()+"'," +"'"
								   + edu.getCategory()+"','"
								   + edu.getPhotoPath()+"'," +"'"
								   + edu.getAudited()+"','"
								   + edu.getNewsResource()+"','"
								   + edu.getIsPhoto()+"')";
		PreparedStatement pstmt = null ;
		try {
			pstmt = connection.prepareStatement(sql) ;
			pstmt.executeUpdate() ;
		} catch (SQLException e) {
			throw new DaoException("数据库写入失败",e) ;
		}finally{
			DBUtils.closeStatement(pstmt) ;
		}
	}

	public void doDelete(String[] id) {
		StringBuffer sbfSql = new StringBuffer();
		for(int i = 0; i < id.length; i++) {
			if(!id[i].trim().equals(""))
				sbfSql.append("'").append(id[i]).append("'").append(",");
		}
		String sql = "delete from eduinfo where id in ("
				+ sbfSql.substring(0, sbfSql.length() - 1) + ")";
		Statement stmt = null;
		try {
			stmt = connection.createStatement();
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			throw new DaoException("数据库删除失败", e);
		} finally {
			DBUtils.closeStatement(stmt);
		}

	}

	public void doUpdate(EduInfo edu) {
		String sql = "update eduinfo set title='"+edu.getTitle()+"'" +			
					",content='"+edu.getContent()+"'" +					
					",auther='"+edu.getAuther()+"'" +
					",category='"+edu.getCategory()+"'" +
					",photopath='"+edu.getPhotoPath()+"'" +
					",audited='"+edu.getAudited()+"'" +
					",newsResource='"+edu.getNewsResource()+"'" +
					",isphoto='"+edu.getIsPhoto()+"'" +
					" where id="+edu.getId();		
		PreparedStatement pstmt = null ;
		try {
			pstmt = connection.prepareStatement(sql) ;
			pstmt.executeUpdate() ;
		} catch (SQLException e) {
			throw new DaoException("数据库更新失败",e) ;
		}finally{
			DBUtils.closeStatement(pstmt); 
		}
	}

	public EduInfo getInfoById(String id) {
		String sql ="select * from eduinfo where id ="+ id ;
		EduInfo edu = null ;
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		try {
			pstmt = connection.prepareStatement(sql) ;
			rs = pstmt.executeQuery() ;
			if(rs.next()){
				//封装到EduInfo
				 edu = new EduInfo() ;
				edu.setId(rs.getInt(1)) ;
				edu.setTitle(rs.getString(2)); 
				edu.setContent(rs.getString(3)) ;
				edu.setAddDate(rs.getDate(4)) ;
				edu.setAuther(rs.getString(5)) ;
				edu.setCategory(rs.getString(6)) ;
				edu.setPhotoPath(rs.getString(7)); 
				edu.setAudited(rs.getString(8)); 
				edu.setNewsResource(rs.getString(9)); 
				edu.setIsPhoto(rs.getString(10));
			}
		} catch (SQLException e) {
			throw new DaoException("数据库读取失败",e) ;
		}finally{
			DBUtils.closeStatement(pstmt) ;
		}
		return edu;
	}

	public PageBean<EduInfo> getInfoByName(int pageSize, int pageNow,
			String name) {
		 String sql="SELECT * FROM eduinfo WHERE title LIKE upper( '%" + name + "%') order by title desc limit "
			+(pageNow-1)*pageSize+ "," + pageSize ;
		 int rowCount = 0 ;  //数据库所以行信息
		 int pageCount = 0 ;//分页数量
		 PageBean<EduInfo> page = new PageBean<EduInfo>(); 
		 List<EduInfo> result = new ArrayList<EduInfo>() ;
		 PreparedStatement pstmt = null ;
		 ResultSet rs = null;
		 try {
			 String sql1 = "SELECT count(*) FROM eduinfo WHERE title LIKE upper( '%" + name + "%')" ;
				pstmt = connection.prepareStatement(sql1) ;
				rs = pstmt.executeQuery() ;
				if(rs.next()){
					rowCount = rs.getInt(1); 
				}
				if(rowCount%pageSize==0){
					pageCount = rowCount/pageSize ;
				}else{
					pageCount = rowCount/pageSize + 1 ;
				}
			pstmt = connection.prepareStatement(sql);  
			 rs = pstmt.executeQuery() ;
				while(rs.next()){
					//封装到EduInfo
					EduInfo edu = new EduInfo() ;
					edu.setId(rs.getInt(1)) ;
					edu.setTitle(rs.getString(2)); 
					edu.setContent(rs.getString(3)) ;
					edu.setAddDate(rs.getDate(4)) ;
					edu.setAuther(rs.getString(5)) ;
					edu.setCategory(rs.getString(6)) ;
					edu.setPhotoPath(rs.getString(7)); 
					edu.setAudited(rs.getString(8)); 
					edu.setNewsResource(rs.getString(9)); 
					edu.setIsPhoto(rs.getString(10));
					//添加到集合
					result.add(edu) ;
				}
				page.setPageNow(pageNow) ; //第几页
				page.setPageSize(pageSize) ;	//每页显示几条信息
				page.setRowCount(rowCount) ; //数据库所以行信息
				page.setPageCount(pageCount) ; //共有多少页
				page.setResult(result) ;
			} catch (SQLException e) {
				throw new  DaoException("数据库读取失败",e) ;
			}finally{
				DBUtils.closeStatement(pstmt) ;
			}
			return page;
		}

	public PageBean<EduInfo> getInfoByType(int pageSize, int pageNow,
			String type) {
		String sql="SELECT * FROM eduinfo WHERE category=? order by id desc limit "
			+(pageNow-1)*pageSize+ "," + pageSize ;
		 int rowCount = 0 ;  //数据库所以行信息
		 int pageCount = 0 ;//分页数量
		 PageBean<EduInfo> page = new PageBean<EduInfo>(); 
		 List<EduInfo> result = new ArrayList<EduInfo>() ;
		 PreparedStatement pstmt = null ;
		 ResultSet rs = null;
		 try {
			 String sql1 =  "select count(*) from eduinfo where category=?" ;
				pstmt = connection.prepareStatement(sql1) ;
				pstmt.setString(1, type) ;
				rs = pstmt.executeQuery() ;
				if(rs.next()){
					rowCount = rs.getInt(1); 
				}
				if(rowCount%pageSize==0){
					pageCount = rowCount/pageSize ;
				}else{
					pageCount = rowCount/pageSize + 1 ;
				}
			pstmt = connection.prepareStatement(sql);  
			pstmt.setString(1, type) ;
			 rs = pstmt.executeQuery() ;
			while(rs.next()){
				//封装到EduInfo
				EduInfo edu = new EduInfo() ;
				edu.setId(rs.getInt(1)) ;
				edu.setTitle(rs.getString(2)); 
				edu.setContent(rs.getString(3)) ;
				edu.setAddDate(rs.getDate(4)) ;
				edu.setAuther(rs.getString(5)) ;
				edu.setCategory(rs.getString(6)) ;
				edu.setPhotoPath(rs.getString(7)); 
				edu.setAudited(rs.getString(8)); 
				edu.setNewsResource(rs.getString(9)); 
				edu.setIsPhoto(rs.getString(10));
				//添加到集合
				result.add(edu) ;
			}
			page.setPageNow(pageNow) ; //第几页
			page.setPageSize(pageSize) ;	//每页显示几条信息
			page.setRowCount(rowCount) ; //数据库所以行信息
			page.setPageCount(pageCount) ; //共有多少页
			page.setResult(result) ;
		} catch (SQLException e) {
			throw new  DaoException("数据库读取失败",e) ;
		}finally{
			DBUtils.closeStatement(pstmt) ;
		}
		return page;
	}
	/**
	 * 取出标题和名称
	 * @param pageNow
	 * @param pageSize
	 * @param type
	 * @return
	 */

	public PageBean<EduInfo> getName(int pageNow, int pageSize, String type) {
		String sql="SELECT id,title,addDate FROM eduinfo WHERE category=? and audited='是' order by id desc limit "
			+(pageNow-1)*pageSize+ "," + pageSize ;
		 int rowCount = 0 ;  //数据库所以行信息
		 int pageCount = 0 ;//分页数量
		 PageBean<EduInfo> page = new PageBean<EduInfo>(); 
		 List<EduInfo> result = new ArrayList<EduInfo>() ;
		 PreparedStatement pstmt = null ;
		 ResultSet rs = null;
		 try {
			 String sql1 =  "select count(*) from eduinfo where category=? and audited='是'" ;
				pstmt = connection.prepareStatement(sql1) ;
				pstmt.setString(1, type) ;
				rs = pstmt.executeQuery() ;
				if(rs.next()){
					rowCount = rs.getInt(1); 
				}
				if(rowCount%pageSize==0){
					pageCount = rowCount/pageSize ;
				}else{
					pageCount = rowCount/pageSize + 1 ;
				}
			pstmt = connection.prepareStatement(sql);  
			pstmt.setString(1, type) ;
			 rs = pstmt.executeQuery() ;
			while(rs.next()){
				//封装到EduInfo
				EduInfo edu = new EduInfo() ;
				edu.setId(rs.getInt(1)) ;
				edu.setTitle(rs.getString(2)); 
				edu.setAddDate(rs.getDate(3)) ;
				//添加到集合
				result.add(edu) ;
			}
			page.setPageNow(pageNow) ; //第几页
			page.setPageSize(pageSize) ;	//每页显示几条信息
			page.setRowCount(rowCount) ; //数据库所以行信息
			page.setPageCount(pageCount) ; //共有多少页
			page.setResult(result) ;
		} catch (SQLException e) {
			throw new  DaoException("数据库读取失败",e) ;
		}finally{
			DBUtils.closeStatement(pstmt) ;
		}
		return page;
	}
}
