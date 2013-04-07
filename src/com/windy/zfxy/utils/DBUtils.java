package com.windy.zfxy.utils;
/**
 * 建立数据库连接
 * 该类负责处理数据库相关操作
 * */
import java.io.InputStream;
import java.sql.* ;
import java.util.Properties;

public class DBUtils {
	private static DBUtils dBUtils; 
	/**
	 * 构造方法私有
	 * 单利设计模式
	 * */
	private DBUtils() {
		try {
			Class.forName("org.gjt.mm.mysql.Driver");
		} catch (Exception e) {
			throw new ServiceException("Can not for name", e);
		}
	}
	/*
	 * 读取properties文件
	 */
	public static Properties getPropObj() {
		InputStream in = dBUtils.getClass().getClassLoader().getResourceAsStream("database.properties") ;
		Properties proper = new Properties() ;
		try{
			proper.load(in) ;
		}catch(Exception e){
		}
		return proper ;
	}

	/**
	 * 获取数据库连接
	 * @return  Connection
	 */
	public static Connection getConnection(){
		Connection conn = null;
		if (dBUtils == null) { 
			dBUtils = new DBUtils();
		}
		try {
			 conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/zfxy",
					 getPropObj().getProperty("username"), 
					 getPropObj().getProperty("password"));
		} catch (SQLException e) {
			throw new ServiceException("Can not get connection", e);
		}
		return conn;
	}
	/**
	 * 开启事务
	 * @param conn
	 */
	public static void beginTransaction(Connection conn) {
		try {
			conn.setAutoCommit(false); //设置不自动提交事物
		} catch (SQLException e) {
			throw new ServiceException("Can not begin transaction", e);
		}
	}
	/**
	 * 提交事务
	 * @param conn
	 */
	public static void commit(Connection conn) {
		try {
			conn.commit();
			conn.setAutoCommit(true);
		} catch (SQLException e) {
			throw new ServiceException("Can not commit transaction", e);
		}
	}
	/**
	 * 回滚事务
	 * @param conn
	 */
	public static void rollback(Connection conn) {
		try {
			conn.rollback(); 
			conn.setAutoCommit(true); //不懂
		} catch (SQLException e) {
			throw new ServiceException("Can not rollback transaction", e);
		}
	}
	/**
	 * 关闭数据库连接
	 * @param conn
	 */
	public static void closeConnection(Connection conn) {
		try {
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 关闭statement对象
	 * @param stmt
	 */
	public static void closeStatement(Statement stmt) {
		try {
			if (stmt != null) {
				stmt.close();
			}
		} catch (SQLException e) {
			throw new ServiceException("Can not close statement", e);
		}
	}
}
