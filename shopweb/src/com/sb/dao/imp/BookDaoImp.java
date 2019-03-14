package com.sb.dao.imp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sb.bean.Book;
import com.sb.dao.BookDao;
import com.sb.util.DBUtil;

public class BookDaoImp implements BookDao{
	//获取所有图书信息
	@Override
	public List<Book> getBookAll() {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Book> list = new ArrayList<Book>();
		try {
			conn = DBUtil.getConnection();
			String sql ="SELECT book_id,book_name,book_price,book_introduce,book_time,book_author,book_state,book_image,book_sell,glance_number,type_id FROM book where book_state='已上架'";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				Book b = new Book();
				b.setBookId(rs.getInt("book_id"));
				b.setBookName(rs.getString("book_name"));
				b.setBookPrice(rs.getDouble("book_price"));
				b.setBookIntroduce(rs.getString("book_introduce"));
				b.setBookTime(rs.getDate("book_time"));
				b.setBookAuthor(rs.getString("book_author"));
				b.setBookState(rs.getString("book_state"));
				b.setBookImage(rs.getString("book_image"));
				b.setBookSell(rs.getInt("book_sell"));
				b.setGlanceNumber(rs.getInt("glance_number"));
				b.setTypeId(rs.getInt("type_id"));
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
	//通过图书类型ID查询图书集合
	@Override
	public List<Book> getByTypeAll(int typeID) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Book> list = new ArrayList<Book>();
		try {
			conn = DBUtil.getConnection();
			String sql = "SELECT book_id,book_name,book_price,book_introduce,book_time,book_author,book_state,book_image,book_sell,glance_number FROM book WHERE type_id=? and book_state='已上架'";
			ps = conn.prepareStatement(sql);
			ps.setInt(1,typeID);
			rs = ps.executeQuery();
			while(rs.next()){
				Book b = new Book();
				b.setBookId(rs.getInt("book_id"));
				b.setBookName(rs.getString("book_name"));
				b.setBookPrice(rs.getDouble("book_price"));
				b.setBookIntroduce(rs.getString("book_introduce"));
				b.setBookTime(rs.getDate("book_time"));
				b.setBookAuthor(rs.getString("book_author"));
				b.setBookState(rs.getString("book_state"));
				b.setBookImage(rs.getString("book_image"));
				b.setBookSell(rs.getInt("book_sell"));
				b.setGlanceNumber(rs.getInt("glance_number"));
				b.setTypeId(typeID);
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
	//通过图书名称查询图书
	@Override
	public List<Book> getByName(int in, int pagesize,String name) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Book> list = new ArrayList<Book>();
		
		try {
			conn = DBUtil.getConnection();
			String sql = "SELECT book_id,book_name,book_price,book_introduce,book_time,book_author,book_state,book_image,book_sell,glance_number,type_id FROM book WHERE  book_state='已上架' and book_name LIKE ? limit ?,?";
			ps = conn.prepareStatement(sql);
			ps.setString(1,"%" + name + "%");
			ps.setInt(2, in);
			ps.setInt(3, pagesize);
			rs = ps.executeQuery();
			while(rs.next()){
				Book b = new Book();
				b.setBookId(rs.getInt("book_id"));
				b.setBookName(rs.getString("book_name"));
				b.setBookPrice(rs.getDouble("book_price"));
				b.setBookIntroduce(rs.getString("book_introduce"));
				b.setBookTime(rs.getDate("book_time"));
				b.setBookAuthor(rs.getString("book_author"));
				b.setBookState(rs.getString("book_state"));
				b.setBookImage(rs.getString("book_image"));
				b.setBookSell(rs.getInt("book_sell"));
				b.setGlanceNumber(rs.getInt("glance_number"));
				b.setTypeId(rs.getInt("type_id"));
;				list.add(b);
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
	//通过图书ID查询图书信息
	@Override
	public Book getByIdBook(int bookID) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Book b = new Book();
		try {
			conn = DBUtil.getConnection();
			String sql = "SELECT book_name,book_price,book_introduce,book_time,book_author,book_state,book_image,book_sell,glance_number,type_id FROM book WHERE book_state='已上架' and book_id=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1,bookID);
			rs = ps.executeQuery();
			while(rs.next()){
				b.setBookId(bookID);
				b.setBookName(rs.getString("book_name"));
				b.setBookPrice(rs.getDouble("book_price"));
				b.setBookIntroduce(rs.getString("book_introduce"));
				b.setBookTime(rs.getDate("book_time"));
				b.setBookAuthor(rs.getString("book_author"));
				b.setBookState(rs.getString("book_state"));
				b.setBookImage(rs.getString("book_image"));
				b.setBookSell(rs.getInt("book_sell"));
				b.setGlanceNumber(rs.getInt("glance_number"));
				b.setTypeId(rs.getInt("type_id"));
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
	//获取图书数量
	@Override
	public int getBookCount() {
		PreparedStatement ps = null;
		Connection conn = DBUtil.getConnection();
		ResultSet rs =null;
		int i = 0;
		try {
			String sql = "SELECT COUNT(1) FROM book where book_state='已上架'";
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
	//通过类型ID获取总图书数量
	@Override
	public int getBookByTypeId(int typeId) {
		PreparedStatement ps = null;
		Connection conn = DBUtil.getConnection();
		ResultSet rs =null;
		int i = 0;
		try {
			String sql = "SELECT COUNT(1) FROM book where book_state='已上架' and type_id=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, typeId);
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
	//获取一页的数据
	@Override
	public List<Book> getPageAll(int in, int pagesize) {

		List<Book> list = new ArrayList<Book>();
		Connection conn = DBUtil.getConnection();
		String sql = "SELECT book_id,book_name,book_price,book_introduce,book_time,book_author,book_state,book_image,book_sell,glance_number,type_id FROM book where book_state='已上架' limit ?,?";
		PreparedStatement ps =null;
		ResultSet rs = null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, in);
			ps.setInt(2, pagesize);
			rs = ps.executeQuery();
			while(rs.next()){
				Book b = new Book();
				b.setBookId(rs.getInt("book_id"));
				b.setBookName(rs.getString("book_name"));
				b.setBookPrice(rs.getDouble("book_price"));
				b.setBookIntroduce(rs.getString("book_introduce"));
				b.setBookTime(rs.getDate("book_time"));
				b.setBookAuthor(rs.getString("book_author"));
				b.setBookState(rs.getString("book_state"));
				b.setBookImage(rs.getString("book_image"));
				b.setBookSell(rs.getInt("book_sell"));
				b.setGlanceNumber(rs.getInt("glance_number"));
				b.setTypeId(rs.getInt("type_id"));
				list.add(b);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		DBUtil.close(conn, ps, rs);
		return list;
	}
	//通过图书类型id获取一页数据
	@Override
	public List<Book> getPageByIdAll(int in, int pagesize, int typeid) {
		List<Book> list = new ArrayList<Book>();
		Connection conn = DBUtil.getConnection();
		String sql = "SELECT book_id,book_name,book_price,book_introduce,book_time,book_author,book_state,book_image,book_sell,glance_number,type_id FROM book where type_id=? and book_state='已上架'  limit ?,?";
		PreparedStatement ps =null;
		ResultSet rs = null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, typeid);
			ps.setInt(2, in);
			ps.setInt(3, pagesize);
			rs = ps.executeQuery();
			while(rs.next()){
				Book b = new Book();
				b.setBookId(rs.getInt("book_id"));
				b.setBookName(rs.getString("book_name"));
				b.setBookPrice(rs.getDouble("book_price"));
				b.setBookIntroduce(rs.getString("book_introduce"));
				b.setBookTime(rs.getDate("book_time"));
				b.setBookAuthor(rs.getString("book_author"));
				b.setBookState(rs.getString("book_state"));
				b.setBookImage(rs.getString("book_image"));
				b.setBookSell(rs.getInt("book_sell"));
				b.setGlanceNumber(rs.getInt("glance_number"));
				b.setTypeId(rs.getInt("type_id"));
				list.add(b);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		DBUtil.close(conn, ps, rs);
		return list;
	}
	//修改图书浏览量
	@Override
	public int updateGlance(int glance,int bookid) {
		PreparedStatement ps = null;
		Connection conn = DBUtil.getConnection();
		int i = 0;
		try {
			String sql = "UPDATE  book SET glance_number=? WHERE book_state='已上架' and book_id=? ";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, glance);
			ps.setInt(2, bookid);
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
	//新增图书
	@Override
	public int addBook(Book b) {
		Connection conn = null;
		PreparedStatement ps = null;
		int i = 0;
		try {
			conn = DBUtil.getConnection();
			String sql ="INSERT INTO book(book_name,book_price,book_introduce,book_time,book_author,book_state,type_id) VALUES(?,?,?,now(),?,?,?) ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, b.getBookName());
			ps.setDouble(2, b.getBookPrice());
			ps.setString(3, b.getBookIntroduce());
			ps.setString(4, b.getBookAuthor());
			ps.setString(5, b.getBookState());
			ps.setInt(6, b.getTypeId());
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
	//修改图书
	@Override
	public int updateBook(Book b) {
		PreparedStatement ps = null;
		Connection conn = DBUtil.getConnection();
		int i = 0;
		try {
			String sql = "UPDATE  book SET book_name=?,book_price=?,book_introduce=?,book_author=?,type_id=? WHERE   book_id=? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, b.getBookName());
			ps.setDouble(2, b.getBookPrice());
			ps.setString(3, b.getBookIntroduce());
			ps.setString(4, b.getBookAuthor());
			ps.setInt(5, b.getTypeId());
			ps.setInt(6, b.getBookId());
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
	//通过id修改上架
	@Override
	public int updateshangjia(int bookid) {
		PreparedStatement ps = null;
		Connection conn = DBUtil.getConnection();
		int i = 0;
		try {
			String sql = "UPDATE  book SET book_time=now(),book_state='已上架' WHERE book_id=? ";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, bookid);
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
	//通过id修改下架
	@Override
	public int updatexiajia(int bookid) {
		PreparedStatement ps = null;
		Connection conn = DBUtil.getConnection();
		int i = 0;
		try {
			String sql = "UPDATE  book SET book_state='已下架' WHERE book_id=? ";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, bookid);
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
	//通过图书名称模糊查询图书数量
	@Override
	public int getCountByName(String name) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int count = 0;
		try {
			conn = DBUtil.getConnection();
			String sql = "SELECT COUNT(1) FROM book WHERE  book_state='已上架' AND book_name LIKE \"%\"?\"%\"";
			ps = conn.prepareStatement(sql);
			ps.setString(1,name);
			rs = ps.executeQuery();
			while(rs.next()){
				count = rs.getInt(1);
			}
			return count;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(conn, ps, rs);
		}
		return count;
	}
	//通过图书名称查询图书是否存在
	@Override
	public int bookname(String bookname) {
		PreparedStatement ps = null;
		Connection conn = DBUtil.getConnection();
		ResultSet rs =null;
		int i = 0;
		try {
			String sql = "SELECT count(1) FROM book WHERE book_name=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, bookname);
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
	//通过图书ID查询这本书是否上架存在
	@Override
	public int isBook(int bookid) {
		PreparedStatement ps = null;
		Connection conn = DBUtil.getConnection();
		ResultSet rs =null;
		int i = 0;
		try {
			String sql = "SELECT count(1) FROM book WHERE book_id=? and book_state='已上架'";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, bookid);
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
