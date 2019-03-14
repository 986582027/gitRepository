package com.sb.admin.dao.imp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.sb.admin.bean.Admin;
import com.sb.admin.dao.AdminDao;
import com.sb.util.DBUtil;

public class AdminDaoImp implements AdminDao{

	//登录
	@Override
	public int login(String username, String password) {
		PreparedStatement ps = null;
		Connection conn = DBUtil.getConnection();
		ResultSet rs =null;
		int i = 0;
		try {
			String sql = "SELECT COUNT(1) FROM admin WHERE admin_account=? AND admin_password=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, password);
			rs = ps.executeQuery();
			while(rs.next()){
				i = rs.getInt(1);
			}
			return i;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(conn, ps, rs);
		}
		return i;
	}
	//通过用户ID查询用户信息
	@Override
	public Admin getAll(int adminid) {
		PreparedStatement ps = null;
		Connection conn = DBUtil.getConnection();
		ResultSet rs =null;
		Admin a = new Admin();
		try {
			String sql = "SELECT admin_name,admin_account,admin_password,admin_sex,admin_email,admin_phone,admin_address FROM admin WHERE admin_id=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, adminid);
			rs = ps.executeQuery();
			while(rs.next()){
				a.setAdminId(adminid);
				a.setAdminName(rs.getString("admin_name"));
				a.setAdminAccount(rs.getString("admin_account"));
				a.setAdminPassword(rs.getString("admin_password"));
				a.setAdminSex(rs.getString("admin_sex"));
				a.setAdminPhone(rs.getString("admin_phone"));
				a.setAdminAddress(rs.getString("admin_address"));
				a.setAdminEmail(rs.getString("admin_email"));
				a.setAdminId(adminid);
			}
			return a;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(conn, ps, rs);
		}
		return a;
	}
	//通过用户名获取用户ID
	@Override
	public int getByUserName(String adminname) {
		PreparedStatement ps = null;
		Connection conn = DBUtil.getConnection();
		ResultSet rs =null;
		int adminid=0;
		try {
			String sql = "SELECT admin_id FROM admin WHERE admin_account=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, adminname);
			rs = ps.executeQuery();
			while(rs.next()){
				adminid = rs.getInt("admin_id");
			}
			return adminid;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(conn, ps, rs);
		}
		return adminid;
	}
	//修改用户信息
	@Override
	public int updateUser(Admin a) {
		PreparedStatement ps = null;
		Connection conn = DBUtil.getConnection();
		int i = 0;
		try {
			String sql = "UPDATE admin SET admin_name=?,admin_account=?,admin_sex=?,admin_email=?,admin_phone=?,admin_address=? WHERE admin_id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, a.getAdminName());
			ps.setString(2, a.getAdminAccount());
			ps.setString(3, a.getAdminSex());
			ps.setString(4, a.getAdminEmail());
			ps.setString(5, a.getAdminPhone());
			ps.setString(6, a.getAdminAddress());
			ps.setInt(7, a.getAdminId());
			i = ps.executeUpdate();
			return i;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(conn, ps, null);
		}
		return i;
	}
	//修改密码
	@Override
	public int updatemima(int adminid, String password) {
		PreparedStatement ps = null;
		Connection conn = DBUtil.getConnection();
		int i = 0;
		try {
			String sql = "UPDATE admin SET admin_password=? WHERE admin_id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, password);
			ps.setInt(2, adminid);
			i = ps.executeUpdate();
			return i;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(conn, ps, null);
		}
		return i;
	}
	//通过手机号判断手机号是否存在
		@Override
		public int phone(String phone) {
			PreparedStatement ps = null;
			Connection conn = DBUtil.getConnection();
			ResultSet rs =null;
			int i = 0;
			try {
				String sql = "SELECT count(1) FROM admin WHERE admin_phone=?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, phone);
				rs = ps.executeQuery();
				while(rs.next()){
					i = rs.getInt(1);
				}
				return i;
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DBUtil.close(conn, ps, rs);
			}
			return i;
		}
		//通过邮箱判断邮箱是否存在
		@Override
		public int email(String eamil) {
			PreparedStatement ps = null;
			Connection conn = DBUtil.getConnection();
			ResultSet rs =null;
			int i = 0;
			try {
				String sql = "SELECT count(1) FROM admin WHERE admin_eamil=?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, eamil);
				rs = ps.executeQuery();
				while(rs.next()){
					i = rs.getInt(1);
				}
				return i;
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DBUtil.close(conn, ps, rs);
			}
			return i;
		}
		
	
	
	
	
	
	
	

}
