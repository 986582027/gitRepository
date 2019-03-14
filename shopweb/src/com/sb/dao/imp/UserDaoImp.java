package com.sb.dao.imp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sb.bean.User;
import com.sb.dao.UserDao;
import com.sb.util.DBUtil;

public class UserDaoImp implements UserDao{
	//登录
	@Override
	public int login(String username, String password) {
		PreparedStatement ps = null;
		Connection conn = DBUtil.getConnection();
		ResultSet rs =null;
		int i = 0;
		try {
			String sql = "SELECT COUNT(1) FROM USER WHERE username=? AND PASSWORD=?";
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
	//注册
	@Override
	public int register(User u) {
		PreparedStatement ps = null;
		Connection conn = DBUtil.getConnection();
		int i = 0;
		try {
			String sql = "INSERT INTO USER(NAME,username,PASSWORD,user_sex,user_email,user_phone,user_address) VALUES(?,?,?,?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, u.getName());
			ps.setString(2, u.getUsername());
			ps.setString(3, u.getPassword());
			ps.setString(4, u.getUserSex());
			ps.setString(5, u.getUserEmail());
			ps.setString(6, u.getUserPhone());
			ps.setString(7, u.getUserAddress());
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
	//通过用户名获取用户ID
	@Override
	public int getByUserName(String username) {
		PreparedStatement ps = null;
		Connection conn = DBUtil.getConnection();
		ResultSet rs =null;
		int i = 0;
		try {
			String sql = "SELECT user_id FROM USER WHERE username=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, username);
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
	public User getAll(int userid) {
		PreparedStatement ps = null;
		Connection conn = DBUtil.getConnection();
		ResultSet rs =null;
		User u = new User();
		try {
			String sql = "SELECT NAME,username,PASSWORD,user_sex,user_email,user_phone,user_address FROM USER WHERE user_id=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, userid);
			rs = ps.executeQuery();
			while(rs.next()){
				u.setName(rs.getString("name"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setUserSex(rs.getString("user_sex"));
				u.setUserPhone(rs.getString("user_phone"));
				u.setUserAddress(rs.getString("user_address"));
				u.setUserEmail(rs.getString("user_email"));
				u.setUserId(userid);
			}
			return u;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(conn, ps, rs);
		}
		return u;
	}
	//通过用户ID修改用户信息
	@Override
	public int updateUser(User u) {
		PreparedStatement ps = null;
		Connection conn = DBUtil.getConnection();
		int i = 0;
		try {
			String sql = "UPDATE USER SET user_email=?,user_sex=?,user_phone=?,user_address=? WHERE user_id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, u.getUserEmail());
			ps.setString(2, u.getUserSex());
			ps.setString(3, u.getUserPhone());
			ps.setString(4, u.getUserAddress());
			ps.setInt(5, u.getUserId());
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
	public int updatemima(int userid, String password) {
		PreparedStatement ps = null;
		Connection conn = DBUtil.getConnection();
		int i = 0;
		try {
			String sql = "UPDATE USER SET password=? WHERE user_id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, password);
			ps.setInt(2, userid);
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
			String sql = "SELECT count(1) FROM USER WHERE user_phone=?";
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
			String sql = "SELECT count(1) FROM USER WHERE user_eamil=?";
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
