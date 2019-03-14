package com.sb.dao;

import java.util.List;

import com.sb.bean.Book;

public interface BookDao {
	//获取所有图书信息
	public List<Book> getBookAll();
	//通过图书类型ID查询图书集合
	public List<Book> getByTypeAll(int typeId);
	//通过图书名称查询图书
	public List<Book> getByName(int in, int pagesize,String name);
	//通过图书ID查询图书信息
	public Book getByIdBook(int bookID);
	//获取图书数量
	public int getBookCount();
	//通过类型ID获取总图书数量
	public int getBookByTypeId(int typeId);
	//获取一页得数据
	public List<Book> getPageAll(int in,int pagesize);
	//通过图书类型id获取一页数据
	public List<Book> getPageByIdAll(int in,int pagesize,int typeid);
	//修改浏览量
	public int updateGlance(int glance,int bookid);
	//新增图书
	public int addBook(Book b);
	//修改图书
	public int updateBook(Book b);
	//通过id修改上架
	public int updateshangjia(int bookid);
	//通过id修改下架
	public int updatexiajia(int bookid);
	//通过图书名称模糊查询图书数量
	public int getCountByName(String name);
	//通过图书名称查询图书是否存在
	public int bookname(String bookname);
	//通过图书ID查询这本书是否上架存在
	public int isBook(int bookid);
	
}