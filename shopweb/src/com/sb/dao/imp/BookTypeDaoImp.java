package com.sb.dao.imp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sb.bean.BookType;
import com.sb.dao.BookTypeDao;
import com.sb.util.DBUtil;

public class BookTypeDaoImp implements BookTypeDao{
	//获取所有类型集合
	@Override
	public List<BookType> getTypeAll() {

		PreparedStatement ps = null;
		Connection conn = DBUtil.getConnection();
		ResultSet rs =null;
		List<BookType> list = new ArrayList<BookType>();
		int i = 0;
		try {
			String sql = "SELECT type_id,type_name FROM booktype order by type_id";
			ps = conn.prepareStatement(sql);
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
	//通过类型ID查询类型名称
	@Override
	public String getByIdTypeName(int typeid) {
		PreparedStatement ps = null;
		Connection conn = DBUtil.getConnection();
		ResultSet rs =null;
		String typename=null;
		int i = 0;
		try {
			String sql = "SELECT type_name FROM booktype where type_id=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, typeid);
			rs = ps.executeQuery();
			while(rs.next()){
				typename = rs.getString("type_name");
				
			}
			return typename;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(conn, ps, rs);
		}
		return typename;
	}

}
