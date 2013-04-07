package com.windy.zfxy.edu.domain;
import java.sql.Date ;
/**
 * 学院信息
 * @author Administrator
 *
 */
public class EduInfo {
	private int id ;			//Id标识
	private String title ;		//标题
	private String content;   	//内容
	private Date addDate ;	    //添加时间
	private String auther ;	    //作者
	private String category ;   //分类
	private String photoPath ;  //图片路径
	private String audited ;    //审核
	private String newsResource ;//新闻来源
	private String isPhoto ;	//是否图片新闻
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getAddDate() {
		return addDate;
	}
	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}
	public String getAuther() {
		return auther;
	}
	public void setAuther(String auther) {
		this.auther = auther;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getPhotoPath() {
		return photoPath;
	}
	public void setPhotoPath(String photoPath) {
		this.photoPath = photoPath;
	}
	public String getAudited() {
		return audited;
	}
	public void setAudited(String audited) {
		this.audited = audited;
	}
	public String getNewsResource() {
		return newsResource;
	}
	public void setNewsResource(String newsResource) {
		this.newsResource = newsResource;
	}
	public String getIsPhoto() {
		return isPhoto;
	}
	public void setIsPhoto(String isPhoto) {
		this.isPhoto = isPhoto;
	}
	
}
