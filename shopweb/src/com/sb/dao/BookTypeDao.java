package com.sb.dao;

import java.util.List;
import com.sb.bean.BookType;
public interface BookTypeDao {

	//获取所有类型集合
	public List<BookType> getTypeAll();
	//通过类型ID查询类型名称
	public String getByIdTypeName(int typeid);
}
