package com.sb.admin.dao;

import java.util.List;

import com.sb.admin.bean.AdminVO;

public interface AdminVODao {

	//查询所有分页信息
	public List<AdminVO> getAll(int pagenow,int intpagesize);
	//根据ID查询对应的图书信息
	public AdminVO getById(int bookid);

	
}
