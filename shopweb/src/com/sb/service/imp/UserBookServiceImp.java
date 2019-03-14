package com.sb.service.imp;

import java.util.ArrayList;
import java.util.List;

import com.sb.bean.UserBook;
import com.sb.dao.UserBookDao;
import com.sb.dao.imp.UserBookDaoImp;
import com.sb.service.UserBookService;

public class UserBookServiceImp implements UserBookService{
	//购物车查询
	@Override
	public List<UserBook> getAll(int userid, int bookid) {
		UserBookDao ubd = new UserBookDaoImp();
		List<UserBook> list = new ArrayList<UserBook>();
		int i =0;
		int update = 0;
		//判断是否存在该用户买这本书
		int count = ubd.getByIdCount(userid, bookid);
		if(count==0){
			//新增
			//定义购买数量
			int booknum = 1;
			//定义未购买
			String isBuy="0";
			i = ubd.addUserBook(userid, bookid, booknum,isBuy);
		}else{
			//如果存在获取购买数量
			int booknum = ubd.getByIdNumber(userid, bookid);
			//购买数量+1
			int booknums = booknum+1;
			//修改购买数量
			update = ubd.updateByIdNumber(userid, bookid, booknums);
		}
		if(i==1||update==1){
			list = ubd.getAll();
		}
		return list;
		
		
	}
	//购物车提交
	@Override
	public int shopSubmit(int userid) {
		//返回是否购买成功
		int i =0;
		//修改is_buy已经购买
		UserBookDao ubd = new UserBookDaoImp();
		int updateIsBuy = ubd.updateIsBuy(userid);
		//修改图书的售出数量
		//通过用户id查询用户已经购买得图书集合
		List<UserBook> userbooks = ubd.selectIsBuy(userid);
		for (UserBook userBook : userbooks) {
			//通过图书id查询图书售出数量
			int sell = ubd.getSell(userBook.getBookId());
			//图书本身的售出数量+用户购买的数量
			int usersell = userBook.getBookNum();
			int newsell = sell + usersell;
			////通过图书Id和图书售出数量来修改图书信息
			i = ubd.updatebook(userBook.getBookId(), newsell);
		}
		
		
		return i;
	}

	
	
	
	
}
