package com.sb.admin.dao.imp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sb.admin.dao.AdminTypeDao;
import com.sb.bean.BookType;
import com.sb.util.DBUtil;

public class AdminTypeDaoImp implements AdminTypeDao{

	//分页查询类型
	@Override
	public List<BookType> gettypeAll(int page,int pagesize) {
		PreparedStatement ps = null;
		Connection conn = DBUtil.getConnection();
		ResultSet rs =null;
		List<BookType> list = new ArrayList<BookType>();
		int i = 0;
		try {
			String sql = "SELECT type_id,type_name FROM booktype order by type_id limit ?,?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, page);
			ps.setInt(2, pagesize);
			rs = ps.executeQuery();
			while(rs.next()){
				BookType bt = new BookType();
				bt.setTypeId(rs.getInt("type_id"));
				bt.setTypeName(rs.getString("type_name"));
				list.add(bt);
			}
			return list;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(conn, ps, rs);
		}
		return list;
	}
	//查询有多少类型
	@Override
	public int getTypeCount() {
		PreparedStatement ps = null;
		Connection conn = DBUtil.getConnection();
		ResultSet rs =null;
		int i = 0;
		try {
			String sql = "SELECT COUNT(1) FROM booktype";
			ps = conn.prepareStatement(sql);
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
	//通过类型ID删除类型
	@Override
	public int deleteType(int typeid) {
		Connection conn = null;
		PreparedStatement ps = null;
		int i = 0;
		try {
			conn = DBUtil.getConnection();
			String sql ="DELETE FROM booktype WHERE type_id=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1,typeid);
			i = ps.executeUpdate();
			return i;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(conn, ps, null);
		}
		return i;
	}
	//新增图书类型
	@Override
	public int addType(BookType type) {
		Connection conn = null;
		PreparedStatement ps = null;
		int i = 0;
		try {
			conn = DBUtil.getConnection();
			String sql ="INSERT INTO booktype(type_name) VALUES(?) ";
			ps = conn.prepareStatement(sql);
			ps.setString(1,type.getTypeName());
			i = ps.executeUpdate();
			return i;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(conn, ps, null);
		}
		return i;
	}
	//修改图书类型
	@Override
	public int updatetype(BookType bt) {
		Connection conn = null;
		PreparedStatement ps = null;
		int i = 0;
		try {
			conn = DBUtil.getConnection();
			String sql ="update booktype set type_name=? where type_id=? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, bt.getTypeName());
			ps.setInt(2, bt.getTypeId());
			i = ps.executeUpdate();
			return i;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(conn, ps, null);
		}
		return i;
	}
	//通过类型名称判断类型是否存在‘
	@Override
	public int typename(String typename) {
		PreparedStatement ps = null;
		Connection conn = DBUtil.getConnection();
		ResultSet rs =null;
		int i = 0;
		try {
			String sql = "SELECT count(1) FROM booktype WHERE type_name=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, typename);
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
