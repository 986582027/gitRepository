package com.sb.admin.service.imp;

import com.sb.admin.dao.AdminDao;
import com.sb.admin.dao.imp.AdminDaoImp;
import com.sb.admin.service.AdminService;

public class AdminServiceImp implements AdminService{

	//修改密码
	@Override
	public int updatemima(int adminid, String oldpassword, String newpassword, String password) {
		
		int updatemima=0;
		if(oldpassword.equals(password)){
			AdminDao ad = new AdminDaoImp();
			updatemima = ad.updatemima(adminid, newpassword);
		}
		return updatemima;
	}
	
	

}
