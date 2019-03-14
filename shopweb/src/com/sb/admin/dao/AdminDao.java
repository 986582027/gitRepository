package com.sb.admin.dao;


import com.sb.admin.bean.Admin;

public interface AdminDao {

	//登录
	public int login(String username,String password);
	//通过用户ID查询用户信息
	public Admin getAll(int adminid);
	//通过用户名获取用户ID
	public int getByUserName(String adminname);
	//修改用户信息
	public int updateUser(Admin a);
	//修改密码
	public int updatemima(int adminid,String password);
	//通过手机号获取用户ID(判断手机号是否存在)
	public int phone(String phone);
	//通过邮箱获取用户ID(判断邮箱是否存在)
	public int email(String eamil);
	
}
