package com.company.VO;

import java.util.Date;

public class blogVO {
	//member table
	private String account;
	private String name;
    private String email;
    private String password;
    
    //authorities table
    private String auth;
    
	//writing table
    private String title;
    private String content;
    private Date date;
    private Date updatedate;
    private int w_no;
    
    //file table
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
    
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public String getUploadPath() {
		return uploadPath;
	}
	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public boolean isFileType() {
		return fileType;
	}
	public void setFileType(boolean fileType) {
		this.fileType = fileType;
	}
	public String getAccount() {
    	return account;
    }
    public void setAccount(String account) {
    	this.account = account;
    }
    public String getAuth() {
    	return auth;
    }
    public void setAuth(String auth) {
    	this.auth = auth;
    }
    public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	//엔터를 <br>로 변환하여 넘겨주기
	public String getContent() {
		if(content.contains("\n")) {
			content = content.replace("\r\n", "<br>");
		}
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Date getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
	public int getW_no() {
		return w_no;
	}
	public void setW_no(int w_no) {
		this.w_no = w_no;
	}
    
}
