package com.windy.zfxy.edu.proxy;

import java.sql.Connection;

import com.windy.zfxy.edu.dao.EduInfoDao;
import com.windy.zfxy.edu.dao.EduInfoDaoImp;
import com.windy.zfxy.edu.domain.EduInfo;
import com.windy.zfxy.utils.DBUtils;
import com.windy.zfxy.utils.PageBean;
import com.windy.zfxy.utils.ServiceException;

public class EduInfoProxy implements IEduInfoService {
	private static  EduInfoProxy instance = new EduInfoProxy() ;
	private EduInfoProxy(){
	}
	public static EduInfoProxy getInstance() {
		return instance;
	}

	public void doAdd(EduInfo edu) {
		Connection conn = null ;
		try {
			conn = DBUtils.getConnection() ;
			EduInfoDao edao = new EduInfoDaoImp(conn) ;
			DBUtils.beginTransaction(conn) ;
			edao.doAdd(edu) ;
			DBUtils.commit(conn) ;
		} catch (Exception e) {
			DBUtils.rollback(conn) ;
			throw new ServiceException("添加失败",e);
		}finally{
			DBUtils.closeConnection(conn) ;
		}

	}

	public void doDelete(String[] id) {
		Connection conn = null ;
		try {
			conn = DBUtils.getConnection() ;
			EduInfoDao edao = new EduInfoDaoImp(conn) ;
			DBUtils.beginTransaction(conn) ;
			edao.doDelete(id) ;
			DBUtils.commit(conn) ;
		} catch (Exception e) {
			DBUtils.rollback(conn) ;
			throw new ServiceException("删除失败",e);
		}finally{
			DBUtils.closeConnection(conn) ;
		}

	}

	public void doUpdate(EduInfo edu) {
		Connection conn = null ;
		try {
			conn = DBUtils.getConnection() ;
			EduInfoDao edao = new EduInfoDaoImp(conn) ;
			DBUtils.beginTransaction(conn) ;
			edao.doUpdate(edu) ;
			DBUtils.commit(conn) ;
		} catch (Exception e) {
			DBUtils.rollback(conn) ;
			throw new ServiceException("修改失败",e);
		}finally{
			DBUtils.closeConnection(conn) ;
		}
	}

	public EduInfo getInfoById(String id) {
		Connection conn = null ;
		EduInfo edu = null ;
		try {
			conn = DBUtils.getConnection() ;
			EduInfoDao edao = new EduInfoDaoImp(conn) ;
			DBUtils.beginTransaction(conn) ;
			edu = edao.getInfoById(id) ;
			DBUtils.commit(conn) ;
		} catch (Exception e) {
			DBUtils.rollback(conn) ;
			throw new ServiceException("读取数据失败",e);
		}finally{
			DBUtils.closeConnection(conn) ;
		}
		return edu ;
	}

	public PageBean<EduInfo> getInfoByName(int pageSize, int pageNow,
			String name) {
		Connection conn = null ;
		PageBean<EduInfo> page = null ;
		try {
			conn = DBUtils.getConnection() ;
			EduInfoDao edao = new EduInfoDaoImp(conn) ;
			DBUtils.beginTransaction(conn) ;
			page = edao.getInfoByName(pageSize, pageNow, name) ;
			DBUtils.commit(conn) ;
		} catch (Exception e) {
			DBUtils.rollback(conn) ;
			throw new ServiceException("查询信息失败",e);
		}finally{
			DBUtils.closeConnection(conn) ;
		}
		return page;
	}

	public PageBean<EduInfo> getInfoByType(int pageSize, int pageNow,
			String type) {
		Connection conn = null ;
		PageBean<EduInfo> page = null ;
		try {
			conn = DBUtils.getConnection() ;
			EduInfoDao edao = new EduInfoDaoImp(conn) ;
			DBUtils.beginTransaction(conn) ;
			page = edao.getInfoByType(pageSize, pageNow, type) ;
			DBUtils.commit(conn) ;
		} catch (Exception e) {
			DBUtils.rollback(conn) ;
			throw new ServiceException("信息列表失败",e);
		}finally{
			DBUtils.closeConnection(conn) ;
		}
		return page;
	}
	public  PageBean<EduInfo> getName(int pageNow,int pageSize, String type){
		Connection conn = null ;
		PageBean<EduInfo> page = null ;
		try {
			conn = DBUtils.getConnection() ;
			EduInfoDao edao = new EduInfoDaoImp(conn) ;
			DBUtils.beginTransaction(conn) ;
			page = edao.getName(pageSize, pageNow, type) ;
			DBUtils.commit(conn) ;
		} catch (Exception e) {
			DBUtils.rollback(conn) ;
			throw new ServiceException("信息列表失败",e);
		}finally{
			DBUtils.closeConnection(conn) ;
		}
		return page;
	}
}
