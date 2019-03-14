package com.sb.service.imp;

import com.sb.bean.User;
import com.sb.dao.UserDao;
import com.sb.dao.imp.UserDaoImp;
import com.sb.service.UserService;

public class UserServiceImp implements UserService{
	//修改密码
	@Override
	public int updatemima(int userid, String password, String newpassword) {
		UserDao ud = new UserDaoImp();
		User user = ud.getAll(userid);
		int i =0;
		//判断密码是否正确
		if(user.getPassword().equals(password)){
			//修改密码
			int updatemima = ud.updatemima(userid, newpassword);
			if(updatemima==1){
				i=1;
			}
		}
		return i;
	}
	
	

}
