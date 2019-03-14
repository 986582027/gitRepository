package com.sb.dao;


import com.sb.bean.User;

public interface UserDao {
	//登录
	public int login(String username,String password);
	//注册
	public int register(User u);
	//通过用户名获取用户ID(判断账号是否存在)
	public int getByUserName(String username);
	//通过用户ID查询用户信息
	public User getAll(int userid);
	//通过用户ID修改用户信息
	public int updateUser(User u);
	//修改密码
	public int updatemima(int userid,String password);
	//通过手机号获取用户ID(判断手机号是否存在)
	public int phone(String phone);
	//通过邮箱获取用户ID(判断邮箱是否存在)
	public int email(String eamil);
}
