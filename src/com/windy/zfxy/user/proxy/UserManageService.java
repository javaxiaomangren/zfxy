package com.windy.zfxy.user.proxy;


import com.windy.zfxy.user.domain.UserInfo;
import com.windy.zfxy.utils.PageBean;


/**
 * 用户信息的管理类（采用单例模式实现）
 */
public interface UserManageService {
	/**
	 * 增加用户
	 * @param user 用户信息实体
	 */
	public void addUser(UserInfo user);
	/**
	 * 删除用户
	 * @param userIdList 用户ID集合
	 */
	public void deleteUsers(String[] userIdList) ;
	/**
	 * 用户查询
	 * @param userId    用户ID
	 * @return userList 用户信息实体
	 */
	public UserInfo findUserById(String userId) ;
	/**
	 * 按类型查找
	 * @return PageBean<UserInfo> 
	 * @param type
	 */
	public PageBean<UserInfo> listByType(int pageSize,int pageNow ,String type) ;
	/**
	 * 按名称查询
	 * @return userList 用户信息实体集合
	 */
	public PageBean<UserInfo> findByName(int pageSize , int pageNow ,String name);
	/**
	 * 修改用户信息
	 * @param user 用户信息实体
	 */
	public void modifyUser(UserInfo user) ;
	
	/**
	 * 验证登陆
	 * @param username
	 * @return boolean
	 */
	public String getPassword(String username); 
}
