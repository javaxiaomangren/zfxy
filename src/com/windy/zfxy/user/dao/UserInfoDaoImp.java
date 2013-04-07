package com.windy.zfxy.user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.windy.zfxy.user.domain.UserInfo;
import com.windy.zfxy.utils.DBUtils;
import com.windy.zfxy.utils.DaoException;
import com.windy.zfxy.utils.PageBean;
/**
 * 用户信息表的操作（增删改查）
 */
public class UserInfoDaoImp implements UserInfoDao {
	/**
	 * 数据库连接
	 */
	private Connection connection ;
	/**
	 * 构造方法初始化连接
	 * @param conn
	 */
	public UserInfoDaoImp(Connection conn){
		this.connection = conn ;
	}
	/**
	 * 增加用户
	 * @param user 用户信息对象
	 */
	public void addUser(UserInfo user) {
		String sql="INSERT INTO userinfo(name" +				// 用户名
											",sex," +			// 性别
											"password," +		// 密码
											"category," +		//分类
											"position," +		//职位
											"detail," +			//简介
											"email," +			// E-Mail
											"tel," +			// 电话号码
											"head)" +			//照片
						"VALUES (?,?,?,?,?,?,?,?,?);" ;
		PreparedStatement pstmt = null;
		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, user.getName()) ;
			pstmt.setString(2, user.getSex()) ;
			pstmt.setString(3, user.getPassword()); 
			pstmt.setString(4, user.getCategory()) ;
			pstmt.setString(5, user.getPosition());
			pstmt.setString(6, user.getDetail()) ;
			pstmt.setString(7, user.getEmail()) ;
			pstmt.setString(8, user.getTel()) ;
			pstmt.setString(9, user.getHead()) ;
		
			pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new DaoException("数据库写入失败", e);
		} finally {
			DBUtils.closeStatement(pstmt);
		}
	}


	public void deleteUsers(String[] userIdList) {
		StringBuffer sbfSql = new StringBuffer();
		for (int i = 0; i < userIdList.length; i++) {
			if(!userIdList[i].trim().equals(""))
				sbfSql.append("'").append(userIdList[i]).append("'").append(",");
		}
		String sql = "delete from userinfo where id in ("
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
	/**
	 * 按名称查找
	 */
	public PageBean<UserInfo> findByName(int pageSize, int pageNow ,String name) {
		 String sql="SELECT * FROM userinfo WHERE name LIKE upper( '%" + name + "%') and category='student' order by name  limit "
			+(pageNow-1)*pageSize+ "," + pageSize ;
		 int rowCount = 0 ;  //数据库所以行信息
		 int pageCount = 0 ;//分页数量
		 PageBean<UserInfo> page = new PageBean<UserInfo>(); 
		 List<UserInfo> result = new ArrayList<UserInfo>() ;
		 PreparedStatement pstmt = null ;
		 ResultSet rs = null;
		 try {
			 String sql1 = "SELECT count(*) FROM userinfo WHERE name LIKE upper( '%" + name + "%') and category='student'" ;
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
				//封装到UserInfo
				UserInfo user = new UserInfo() ;
				user.setId(rs.getInt(1)) ;
				user.setName(rs.getString(2)); 
				user.setSex(rs.getString(3)) ;
				user.setPassword(rs.getString(4)) ;
				user.setCategory(rs.getString(5)) ;
				user.setPosition(rs.getString(6)); 
				user.setDetail(rs.getString(7)); 
				user.setEmail(rs.getString(8)); 
				user.setTel(rs.getString(9));
				user.setHead(rs.getString(10)) ;
				//添加到集合
				result.add(user) ;
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

	public UserInfo findUserById(String userId) {
		String sql ="select * from userinfo where id ="+ userId ;
		UserInfo user = null ;
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		try {
			pstmt = connection.prepareStatement(sql) ;
			rs = pstmt.executeQuery() ;
			if(rs.next()){
				user = new UserInfo() ;
				user.setId(rs.getInt(1)) ;
				user.setName(rs.getString(2)); 
				user.setSex(rs.getString(3)) ;
				user.setPassword(rs.getString(4)) ;
				user.setCategory(rs.getString(5)) ;
				user.setPosition(rs.getString(6)); 
				user.setDetail(rs.getString(7)); 
				user.setEmail(rs.getString(8)); 
				user.setTel(rs.getString(9));
				user.setHead(rs.getString(10)) ;
			}
		} catch (SQLException e) {
			throw new DaoException("数据库读取失败",e) ;
		}finally{
			DBUtils.closeStatement(pstmt) ;
		}
		return user;
	}
/**
 * @param type 查找条件
 *@return  List<UserInfo> 用户信息集合
 */
	public PageBean<UserInfo> listByType(int pageSize, int pageNow ,String type) {
		 String sql="SELECT * FROM userinfo WHERE category=? order by id  limit "
			+(pageNow-1)*pageSize+ "," + pageSize ;
		 int rowCount = 0 ;  //数据库所以行信息
		 int pageCount = 0 ;//分页数量
		 PageBean<UserInfo> page = new PageBean<UserInfo>(); 
		 List<UserInfo> result = new ArrayList<UserInfo>() ;
		 PreparedStatement pstmt = null ;
		 ResultSet rs = null;
		 try {
			 String sql1 =  "select count(*) from userinfo where category=?" ;
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
				//封装到UserInfo
				UserInfo user = new UserInfo() ;
				user.setId(rs.getInt(1)) ;
				user.setName(rs.getString(2)); 
				user.setSex(rs.getString(3)) ;
				user.setPassword(rs.getString(4)) ;
				user.setCategory(rs.getString(5)) ;
				user.setPosition(rs.getString(6)); 
				user.setDetail(rs.getString(7)); 
				user.setEmail(rs.getString(8)); 
				user.setTel(rs.getString(9));
				user.setHead(rs.getString(10)) ;
				//添加到集合
				result.add(user) ;
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

	public void modifyUser(UserInfo user) {
		String sql = "update userinfo set name='"+user.getName()+"'" +				// 用户名
											",sex='"+user.getSex()+"'" +				// 性别
											",password='"+user.getPassword()+"'" +		// 密码
											",category='"+user.getCategory()+"'" +			//分类
											",position='"+user.getPosition()+"'" +			//职位
											",detail='"+user.getDetail()+"'" +			//简介
											",email='"+user.getEmail()+"'" +			// E-Mail
											",tel='"+user.getTel()+"'" +				// 电话号码
											",head='"+user.getHead()+"'" +			//照片
						" where id="+user.getId();		
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
	public String getPassword(String username) {
		String sql ="SELECT PASSWORD FROM userinfo	WHERE NAME ='"+ username+"'" ;
		String password  = "" ;
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		try {
			pstmt = connection.prepareStatement(sql) ;
			rs = pstmt.executeQuery() ;
			if(rs.next()){
				password = rs.getString(1) ;
			}
		} catch (SQLException e) {
			throw new DaoException("数据库读取失败",e) ;
		}finally{
			DBUtils.closeStatement(pstmt) ;
		}
		return password;
	}

}
