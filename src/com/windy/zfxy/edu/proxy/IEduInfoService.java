package com.windy.zfxy.edu.proxy;


import com.windy.zfxy.edu.domain.EduInfo;
import com.windy.zfxy.utils.PageBean;

public interface IEduInfoService {
	/**
	 * 添加信息
	 * @param edu
	 */
	public void doAdd(EduInfo edu) ;
	/**
	 * 删除记录
	 * @param id
	 */
	public void doDelete(String[] id);
	/**
	 * 更新记录
	 * @param edu
	 */
	public void doUpdate(EduInfo edu) ;
	/**
	 * 读取分类新闻的信息
	 * @param pageSize
	 * @param pageNow
	 * @param type
	 * @return PageBean<EduInfo>
	 */
	public PageBean<EduInfo> getInfoByType(int pageSize , int pageNow , String type) ;
	/**
	 * 按id号查询
	 * @param id
	 * @return EduInfo
	 */
	public EduInfo getInfoById(String id) ; 
	/**
	 * 按条件进行查询
	 * @param pageSize
	 * @param pageNow
	 * @param name
	 * @return PageBean<EduInfo>
	 */
	public PageBean<EduInfo> getInfoByName(int pageSize , int pageNow , String name) ;
	public PageBean<EduInfo> getName(int pageNow,int pageSize, String type);
}
