package com.windy.zfxy.utils;

import java.util.List;
/**
 * 分页bean
 * 
 * */
public class PageBean<T> {
	private int pageSize ; // 每页显示几条记录
	private int pageCount ;//一共有多少页
	private int rowCount ; //数据库里的所有记录
	private int pageNow ; //第几页
	private List<T> result ;
	
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getRowCount() {
		return rowCount;
	}
	public void setRowCount(int rowCount) {
		this.rowCount = rowCount;
	}
	public int getPageNow() {
		return pageNow;
	}
	public void setPageNow(int pageNow) {
		this.pageNow = pageNow;
	}
	public List<T> getResult() {
		return result;
	}
	public void setResult(List<T> result) {
		this.result = result;
	}
}
