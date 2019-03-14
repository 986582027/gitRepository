package com.sb.admin.dao;

import java.util.List;

import com.sb.bean.BookType;

public interface AdminTypeDao {

	//分页查询类型
	public List<BookType> gettypeAll(int page,int pagesize);
	//查询有多少类型
	public int getTypeCount();
	//通过类型ID删除类型
	public int deleteType(int typeid);
	//新增图书类型
	public int addType(BookType type);
	//修改图书类型
	public int updatetype(BookType bt);
	//通过类型名称判断类型是否存在‘
	public int typename(String typename);
	
}
