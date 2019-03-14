package com.sb.dao;

import java.util.List;

import com.sb.bean.UserBook;

public interface UserBookDao {

	//新增表
	public int addUserBook(int userid,int bookid,int booknum,String isBuy);
	//查询信息
	public List<UserBook> getAll();
	//通过图书id和用户id删除
	public int delete(int userid,int bookid);
	//通过图书ID和用户id查询是否存在
	public int getByIdCount(int userid,int bookid);
	//通过图书ID和用户ID查询购买数量
	public int getByIdNumber(int userid,int bookid);
	//通过图书ID和用户ID修改购买数量
	public int updateByIdNumber(int userid,int bookid,int booknum);
	//通过用户id修改是否购买
	public int updateIsBuy(int userid);
	//通过用户id查询用户已经购买得图书集合
	public List<UserBook> selectIsBuy(int userid);
	//通过图书id查询图书售出数量
	public int getSell(int bookid);
	//通过图书Id和图书售出数量来修改图书信息
	public int updatebook(int bookid,int newsell);
	
	
}
