package com.sb.admin.bean;

public class Admin {
	//管理员ID
	private int adminId;
	//管理员姓名
	private String adminName;
	//管理员账号
	private String adminAccount;
	//管理员密码
	private String adminPassword;
	//管理员性别
	private String adminSex;
	//管理员邮箱
	private String adminEmail;
	//管理员手机号
	private String adminPhone;
	//管理员地址
	private String adminAddress;
	public Admin() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getAdminId() {
		return adminId;
	}
	public void setAdminId(int adminId) {
		this.adminId = adminId;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public String getAdminAccount() {
		return adminAccount;
	}
	public void setAdminAccount(String adminAccount) {
		this.adminAccount = adminAccount;
	}
	public String getAdminPassword() {
		return adminPassword;
	}
	public void setAdminPassword(String adminPassword) {
		this.adminPassword = adminPassword;
	}
	public String getAdminSex() {
		return adminSex;
	}
	public void setAdminSex(String adminSex) {
		this.adminSex = adminSex;
	}
	public String getAdminEmail() {
		return adminEmail;
	}
	public void setAdminEmail(String adminEmail) {
		this.adminEmail = adminEmail;
	}
	public String getAdminPhone() {
		return adminPhone;
	}
	public void setAdminPhone(String adminPhone) {
		this.adminPhone = adminPhone;
	}
	public String getAdminAddress() {
		return adminAddress;
	}
	public void setAdminAddress(String adminAddress) {
		this.adminAddress = adminAddress;
	}
	@Override
	public String toString() {
		return "Admin [adminId=" + adminId + ", adminName=" + adminName + ", adminAccount=" + adminAccount
				+ ", adminPassword=" + adminPassword + ", adminSex=" + adminSex + ", adminEmail=" + adminEmail
				+ ", adminPhone=" + adminPhone + ", adminAddress=" + adminAddress + "]";
	}
	
	
}
