package com.sb.admin.dao.imp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sb.admin.bean.AdminVO;
import com.sb.admin.dao.AdminVODao;
import com.sb.bean.Book;
import com.sb.util.DBUtil;

public class AdminVODaoImp implements AdminVODao{

	//查询所有分页信息
	@Override
	public List<AdminVO> getAll(int pagenow,int intpagesize) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<AdminVO> list = new ArrayList<AdminVO>();
		try {
			conn = DBUtil.getConnection();
			String sql ="SELECT b.book_id,b.book_name,b.book_price,b.book_introduce,b.book_time,b.book_author,b.book_state,t.type_name FROM book b,booktype t WHERE b.`type_id`=t.type_id order by b.book_id LIMIT ?,?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, pagenow);
			ps.setInt(2, intpagesize);
			rs = ps.executeQuery();
			while(rs.next()){
				AdminVO b = new AdminVO();
				b.setBookId(rs.getInt("book_id"));
				b.setBookName(rs.getString("book_name"));
				b.setBookPrice(rs.getDouble("book_price"));
				b.setBookIntroduce(rs.getString("book_introduce"));
				b.setBookTime(rs.getDate("book_time"));
				b.setBookAuthor(rs.getString("book_author"));
				b.setBookState(rs.getString("book_state"));
				b.setBookTypeName(rs.getString("type_name"));
				list.add(b);
			}
			return list;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(conn, ps, rs);
		}
		return list;
	}
	//根据ID查询对应的图书信息
	@Override
	public AdminVO getById(int bookid) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		AdminVO b = new AdminVO();
		try {
			conn = DBUtil.getConnection();
			String sql ="SELECT b.book_name,b.book_price,b.book_introduce,b.book_time,b.book_author,b.book_state,t.type_name FROM book b,booktype t WHERE b.`type_id`=t.type_id AND b.book_id=? ";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, bookid);
			rs = ps.executeQuery();
			while(rs.next()){
				
				b.setBookId(bookid);
				b.setBookName(rs.getString("book_name"));
				b.setBookPrice(rs.getDouble("book_price"));
				b.setBookIntroduce(rs.getString("book_introduce"));
				b.setBookTime(rs.getDate("book_time"));
				b.setBookAuthor(rs.getString("book_author"));
				b.setBookState(rs.getString("book_state"));
				b.setBookTypeName(rs.getString("type_name"));
			}
			return b;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(conn, ps, rs);
		}
		return b;
	}

	
}
