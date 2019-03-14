package com.sb.service;

import java.util.List;

import com.sb.bean.UserBook;

public interface UserBookService {

	//购物车查询
	public List<UserBook> getAll(int userid,int bookid);
	//购物车提交
	public int shopSubmit(int userid);
	
}
