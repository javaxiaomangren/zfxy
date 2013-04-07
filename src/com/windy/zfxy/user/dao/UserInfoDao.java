package com.windy.zfxy.user.dao;

import com.windy.zfxy.user.domain.UserInfo;
import com.windy.zfxy.utils.PageBean;


public interface UserInfoDao {
	/**
	 * 添加用户
	 * @param user
	 */
	public void addUser(UserInfo user);
	/**
	 * 删除用户
	 * @param userIdList
	 */
	public void deleteUsers(String[] userIdList);
	/**
	 * 按类型查找
	 * @return
	 * @param type
	 */
	public PageBean<UserInfo> listByType(int pageSize,int pageNow ,String type) ;
	/**
	 * 通过id查找
	 * @param userId
	 * @return UserInfo
	 */
	public UserInfo findUserById(String userId) ;
	/**
	 * 通过名称查找
	 * @return List<UserInfo>
	 */
	public  PageBean<UserInfo> findByName(int pageSize,int pageNow ,String name) ;
	/**
	 * 修改
	 * @param user
	 */
	public void modifyUser(UserInfo user);
	/**
	 * 验证登陆
	 * @param username
	 * @return boolean
	 */
	public String getPassword(String username); 
}
