package com.windy.zfxy.user.proxy;

import java.sql.Connection;

import com.windy.zfxy.user.dao.UserInfoDao;
import com.windy.zfxy.user.dao.UserInfoDaoImp;
import com.windy.zfxy.user.domain.UserInfo;
import com.windy.zfxy.utils.DBUtils;
import com.windy.zfxy.utils.PageBean;
import com.windy.zfxy.utils.ServiceException;
/**
 * 用户信息的管理类（采用单例模式实现）
 */
public class UserManageProxy implements UserManageService {
	/**
	 * 类实例
	 */
	private static  UserManageProxy  instance  = new UserManageProxy() ;
	/**
	 * 取得实例
	 * @return UserManageService
	 */
	public static UserManageProxy getInstance(){
		return instance ;
	}
	/**
	 * 构造方法私有化
	 */
	private UserManageProxy (){
		
	}
	/**
	 * 增加用户
	 * @param user 用户信息实体
	 */
	public void addUser(UserInfo user) {
		Connection conn = null;
		try {
			conn = DBUtils.getConnection();
			UserInfoDao userDao = new UserInfoDaoImp(conn);
			DBUtils.beginTransaction(conn);
			userDao.addUser(user);
			DBUtils.commit(conn);
		} catch (ServiceException e) {
			throw e;
		} catch (Exception e) {
			DBUtils.rollback(conn);
			throw new ServiceException("添加信息错误");
		} finally {
			DBUtils.closeConnection(conn);
		}
	}
	
	public void deleteUsers(String[] userIdList) {
		Connection conn = null ;
		try {
			conn = DBUtils.getConnection() ;
			UserInfoDao udao = new UserInfoDaoImp(conn); 
			DBUtils.beginTransaction(conn) ;
			udao.deleteUsers(userIdList) ;
			DBUtils.commit(conn) ;
		} catch (Exception e) {
			DBUtils.rollback(conn) ;
			throw new ServiceException("删除用户失败",e) ;
		}finally{
			DBUtils.closeConnection(conn) ;
		}
	}

	public PageBean<UserInfo> findByName(int pageSize , int pageNow ,String name) {
		PageBean<UserInfo> page = null ;
		Connection conn = null ;
		try {
			conn = DBUtils.getConnection() ;
			UserInfoDao udao = new UserInfoDaoImp(conn) ;
			DBUtils.beginTransaction(conn) ;
			page = udao.findByName(pageSize, pageNow, name) ;
			DBUtils.commit(conn) ;
		} catch (Exception e) {
			DBUtils.rollback(conn) ;
			throw new ServiceException("请求列表失败",e) ;
		}finally{
			DBUtils.closeConnection(conn) ;
		}
		return page;
	}

	public UserInfo findUserById(String userId) {
		UserInfo user = new UserInfo() ;
		Connection conn = null ;
		try {
			conn = DBUtils.getConnection() ;
			UserInfoDao udao = new UserInfoDaoImp(conn) ;
			user = udao.findUserById(userId) ;
		} catch (Exception e) {
			throw new ServiceException("为找到相应的数据",e) ;
		}
		return user ;
	}
	/**
	 * 按类型查找
	 * @return PageBean<UserInfo> 
	 * @param type
	 */
	public PageBean<UserInfo> listByType(int pageSize , int pageNow ,String type) {
		PageBean<UserInfo> page = null ;
		Connection conn = null ;
		try {
			conn = DBUtils.getConnection() ;
			UserInfoDao udao = new UserInfoDaoImp(conn) ;
			DBUtils.beginTransaction(conn) ;
			page = udao.listByType(pageSize, pageNow, type) ;
			DBUtils.commit(conn) ;
		} catch (Exception e) {
			DBUtils.rollback(conn) ;
			throw new ServiceException("请求列表失败",e) ;
		}finally{
			DBUtils.closeConnection(conn) ;
		}
		return page;
	}

	public void modifyUser(UserInfo user) {
		Connection conn = null ;
		try {
			conn = DBUtils.getConnection() ;
			UserInfoDao udao = new UserInfoDaoImp(conn);
			DBUtils.beginTransaction(conn); 
			udao.modifyUser(user) ;
			DBUtils.commit(conn) ;
		} catch (Exception e) {
			DBUtils.rollback(conn) ;
			throw new ServiceException("更新错误",e); 
		}finally{
			DBUtils.closeConnection(conn) ;
		}
	}
	/**
	 * 验证登陆
	 * @param username
	 * @return boolean
	 */
	public String getPassword(String username){
		String password = "" ;
		Connection conn = null ;
		try {
			conn = DBUtils.getConnection() ;
			UserInfoDao udao = new UserInfoDaoImp(conn);
			DBUtils.beginTransaction(conn); 
			password = udao.getPassword(username); 
			DBUtils.commit(conn) ;
		} catch (Exception e) {
			DBUtils.rollback(conn) ;
			throw new ServiceException("查询用户失败",e); 
		}finally{
			DBUtils.closeConnection(conn) ;
		}
		return password  ;
	}
}
