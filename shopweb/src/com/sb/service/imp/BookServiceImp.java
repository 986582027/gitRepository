package com.sb.service.imp;

import com.sb.bean.Book;
import com.sb.dao.BookDao;
import com.sb.dao.imp.BookDaoImp;
import com.sb.service.BookService;

public class BookServiceImp implements BookService{
	//浏览量修改查询
	@Override
	public int glanceNumber(int glance, int bookid) {

		int glanceNumber = 0;
		BookDao bd = new BookDaoImp();
		int i = bd.updateGlance(glance, bookid);
		if(i==1){
			Book book = bd.getByIdBook(bookid);
			glanceNumber = book.getGlanceNumber();
		}
		return glanceNumber;
		
	}

	
	
	
	
	
}
