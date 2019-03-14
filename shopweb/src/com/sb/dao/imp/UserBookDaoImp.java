package com.sb.dao.imp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sb.bean.UserBook;
import com.sb.dao.UserBookDao;
import com.sb.util.DBUtil;

public class UserBookDaoImp implements UserBookDao{
	//新增表
	@Override
	public int addUserBook(int userid, int bookid, int booknum,String isBuy) {
		Connection conn = null;
		PreparedStatement ps = null;
		int i = 0;
		try {
			conn = DBUtil.getConnection();
			String sql ="INSERT INTO user_book VALUES(?,?,?,?) ";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, userid);
			ps.setInt(2,bookid);
			ps.setInt(3, booknum);
			ps.setString(4, isBuy);
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
	//查询信息
	@Override
	public List<UserBook> getAll() {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<UserBook> list = new ArrayList<UserBook>();
		try {
			conn = DBUtil.getConnection();
			String sql ="SELECT u.name,u.user_id,u.user_phone,b.book_id,b.book_image,b.book_name,b.book_price,ub.book_num FROM USER u,book b,user_book ub WHERE u.`user_id`=ub.`user_id`AND b.`book_id`=ub.`book_id` and is_buy='0'";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				UserBook b = new UserBook();
				b.setBookId(rs.getInt("book_id"));
				b.setBookImage(rs.getString("book_image"));
				b.setBookName(rs.getString("book_name"));
				b.setBookNum(rs.getInt("book_num"));
				b.setBookPrice(rs.getDouble("book_price"));
				b.setUserName(rs.getString("name"));
				b.setUserid(rs.getInt("user_id"));
				b.setUserPhone(rs.getString("user_phone"));
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
	//通过图书id和用户id删除
	@Override
	public int delete(int userid,int bookid) {
		Connection conn = null;
		PreparedStatement ps = null;
		int i = 0;
		try {
			conn = DBUtil.getConnection();
			String sql ="DELETE FROM user_book WHERE user_id=? AND book_id=? and is_buy='0'";
			ps = conn.prepareStatement(sql);
			ps.setInt(1,userid);
			ps.setInt(2,bookid);
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
	//通过图书ID和用户id查询是否存在
	@Override
	public int getByIdCount(int userid, int bookid) {
		Connection conn = null;
		PreparedStatement ps = null;
		int i = 0;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConnection();
			String sql ="select count(1) from user_book where user_id=? and book_id=? and is_buy='0'";
			ps = conn.prepareStatement(sql);
			ps.setInt(1,userid);
			ps.setInt(2,bookid);
			rs = ps.executeQuery();
			while(rs.next()){
				i = rs.getInt(1);
			}
			return i;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(conn, ps, rs);
		}
		return i;
	}
	//通过图书ID和用户ID查询购买数量
	@Override
	public int getByIdNumber(int userid, int bookid) {
		Connection conn = null;
		PreparedStatement ps = null;
		int i = 0;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConnection();
			String sql ="select book_num from user_book where user_id=? and book_id=? and is_buy='0'";
			ps = conn.prepareStatement(sql);
			ps.setInt(1,userid);
			ps.setInt(2,bookid);
			rs = ps.executeQuery();
			while(rs.next()){
				i = rs.getInt("book_num");
			}
			return i;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(conn, ps, null);
		}
		return i;
	}
	//通过图书ID和用户ID修改购买数量
	@Override
	public int updateByIdNumber(int userid, int bookid,int booknum) {
		Connection conn = null;
		PreparedStatement ps = null;
		int i = 0;
		try {
			conn = DBUtil.getConnection();
			String sql ="update user_book set book_num=? where user_id=? and book_id=? and is_buy='0'";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, booknum);
			ps.setInt(2,userid);
			ps.setInt(3,bookid);
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
	//通过用户id修改是否购买
	@Override
	public int updateIsBuy(int userid) {
		Connection conn = null;
		PreparedStatement ps = null;
		int i = 0;
		try {
			conn = DBUtil.getConnection();
			String sql ="update user_book set is_buy = '1' where user_id=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, userid);
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
	//通过用户id查询用户已经购买得图书集合
	@Override
	public List<UserBook> selectIsBuy(int userid) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<UserBook> list = new ArrayList<UserBook>();
		try {
			conn = DBUtil.getConnection();
			String sql ="SELECT u.name,u.user_id,u.user_phone,b.book_id,b.book_image,b.book_name,b.book_price,ub.book_num FROM USER u,book b,user_book ub WHERE u.`user_id`=ub.`user_id`AND b.`book_id`=ub.`book_id` and u.user_id=? and is_buy='1'";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, userid);
			rs = ps.executeQuery();
			while(rs.next()){
				UserBook b = new UserBook();
				b.setBookId(rs.getInt("book_id"));
				b.setBookImage(rs.getString("book_image"));
				b.setBookName(rs.getString("book_name"));
				b.setBookNum(rs.getInt("book_num"));
				b.setBookPrice(rs.getDouble("book_price"));
				b.setUserName(rs.getString("name"));
				b.setUserid(rs.getInt("user_id"));
				b.setUserPhone(rs.getString("user_phone"));
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
	//通过图书id查询图书售出数量
	@Override
	public int getSell(int bookid) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int sell=0;
		try {
			conn = DBUtil.getConnection();
			String sql ="SELECT book_sell FROM book WHERE book_id=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, bookid);
			rs = ps.executeQuery();
			while(rs.next()){
				sell = rs.getInt("book_sell");
			}
			return sell;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(conn, ps, rs);
		}
		return sell;
	}
	//通过图书Id和图书售出数量来修改图书信息
	@Override
	public int updatebook(int bookid, int newsell) {
		Connection conn = null;
		PreparedStatement ps = null;
		int i = 0;
		try {
			conn = DBUtil.getConnection();
			String sql ="update book set book_sell=? where book_id=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, newsell);
			ps.setInt(2, bookid);
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

}
