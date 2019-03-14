package com.sb.admin.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sb.admin.bean.AdminVO;
import com.sb.admin.dao.AdminVODao;
import com.sb.admin.dao.imp.AdminVODaoImp;
import com.sb.bean.Book;
import com.sb.bean.BookType;
import com.sb.bean.Page;
import com.sb.dao.BookDao;
import com.sb.dao.BookTypeDao;
import com.sb.dao.imp.BookDaoImp;
import com.sb.dao.imp.BookTypeDaoImp;
import com.sb.util.PageUtil;

/**
 * Servlet implementation class AdminBookServlet
 */
@WebServlet("/AdminBookServlet")
public class AdminBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AdminBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String book = request.getParameter("book");
		if("booklist".equals(book)){
			bookList(request,response);
		}else if("mohu".equals(book)){
			select(request,response);
		}else if("addbook".equals(book)){
			addbook(request,response);
		}else if("updateselet".equals(book)){
			updateselet(request,response);
		}else if("updatebook".equals(book)){
			updatebook(request,response);
		}else if("shangjia".equals(book)){
			shangjia(request,response);
		}else if("xiajia".equals(book)){
			xiajia(request,response);
		}else if("bookname".equals(book)){
			bookname(request,response);
		}
		
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	//查询图书
	public void bookList(HttpServletRequest request, HttpServletResponse response){
		//定义当前页
		int pagenow = 1;
		//定义一页的个数
		int pagesize = 5;
		String page1 = request.getParameter("page");
		if(page1==null){
			pagenow = 1;
		}else{
			pagenow = Integer.parseInt(page1);
		}
		//定义分页查询语句从第几条开始
		int in = (pagenow-1)*pagesize;
		if(in<0){
			in=0;
		}
		//分页查询所有信息
		AdminVODao ad = new AdminVODaoImp();
		List<AdminVO> bookAll = ad.getAll(in,pagesize);
		//查询一共多少图书
		BookDao bd = new BookDaoImp();
		int counts = bd.getBookCount();
		Page page = PageUtil.getPage(pagesize, counts, pagenow);
		
		
		request.setAttribute("books", "booklist");
		request.setAttribute("page", page);
		request.setAttribute("book", bookAll);
		try {
			request.getRequestDispatcher("/admin/main/book.jsp").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	//模糊查询
	public void select(HttpServletRequest request, HttpServletResponse response){
		//定义当前页
				int pagenow = 1;
				//定义一页的个数
				int pagesize = 5;
				String page1 = request.getParameter("page");
				if(page1==null){
					pagenow = 1;
				}else{
					pagenow = Integer.parseInt(page1);
				}
				//定义分页查询语句从第几条开始
				int in = (pagenow-1)*pagesize;
				if(in<0){
					in=0;
				}
		String bookname = request.getParameter("bookname");
		List<AdminVO> list = new ArrayList<AdminVO>();
		BookTypeDao btd = new BookTypeDaoImp();
		BookDao bd = new BookDaoImp();
		List<Book> byName = bd.getByName(in,pagesize,bookname);
		 for (Book book : byName) {
			//查询对应的类型名称
				String booktypename = btd.getByIdTypeName(book.getTypeId());
				AdminVO av = new AdminVO();
				av.setBookAuthor(book.getBookAuthor());
				av.setBookId(book.getBookId());
				av.setBookIntroduce(book.getBookIntroduce());
				av.setBookName(book.getBookName());
				av.setBookPrice(book.getBookPrice());
				av.setBookState(book.getBookState());
				av.setBookTime(book.getBookTime());
				av.setBookTypeName(booktypename);
				list.add(av);
		}
		//所有书得数量
		BookDao d = new BookDaoImp();
		int counts = d.getCountByName(bookname);
			
		//通过图书名称查询图书(分页)
		Page page = PageUtil.getPage(pagesize, counts, pagenow);
		
		request.setAttribute("bookname", bookname);
		request.setAttribute("books", "mohu");
		request.setAttribute("page", page);
		request.setAttribute("book", list);
		try {
			request.getRequestDispatcher("/admin/main/book.jsp").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	//新增图书
	public void addbook(HttpServletRequest request, HttpServletResponse response){
		
		String bookname = request.getParameter("bookname");
		Double bookprice = Double.parseDouble(request.getParameter("bookprice"));
		String bookintroduce = request.getParameter("bookintroduce");
		String bookauthor = request.getParameter("bookauthor");
		int booktypeid = Integer.parseInt(request.getParameter("booktype"));
		String bookstate = "已上架";
		Book b = new Book();
		b.setBookName(bookname);
		b.setBookPrice(bookprice);
		b.setBookIntroduce(bookintroduce);
		b.setBookAuthor(bookauthor);
		b.setBookState(bookstate);
		b.setTypeId(booktypeid);
		BookDao bd = new BookDaoImp();
		int addBook = bd.addBook(b);
		request.setAttribute("addbook", addBook);
		if(addBook==1){
			try {
				//response.getWriter().write("<h1>新增图书成功</h1>");
				response.setHeader("refresh", "1;url=/shopweb/AdminBookServlet?book=booklist");
				//request.getRequestDispatcher("/admin/main/addbook.jsp").forward(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			try {
				//response.getWriter().write("<h1>新增图书失败</h1>");
				response.setHeader("refresh", "1;url=/shopweb/AdminBookServlet?book=booklist");
				//request.getRequestDispatcher("/admin/main/addbook.jsp").forward(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	//修改查询
	public void updateselet(HttpServletRequest request, HttpServletResponse response){
		
		int bookid = Integer.parseInt(request.getParameter("bookid"));
		int pagenow = Integer.parseInt(request.getParameter("pagenow"));
		AdminVODao avd = new AdminVODaoImp();
		AdminVO admin = avd.getById(bookid);
		
		BookTypeDao btd = new BookTypeDaoImp();
		List<BookType> typeAll = btd.getTypeAll();
		
		request.setAttribute("pagenow", pagenow);
		request.setAttribute("type", typeAll);
		request.setAttribute("bookvo", admin);
		
		try {
			request.getRequestDispatcher("/admin/main/updatebook.jsp").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	//修改图书
	public void updatebook(HttpServletRequest request, HttpServletResponse response){
		
		int pagenow = Integer.parseInt(request.getParameter("pagenow"));
		String bookname = request.getParameter("bookname");
		Double bookprice = Double.parseDouble(request.getParameter("bookprice"));
		String bookintroduce = request.getParameter("bookintroduce");
		String bookauthor = request.getParameter("bookauthor");
		int booktypeid = Integer.parseInt(request.getParameter("booktype"));
		int bookid = Integer.parseInt(request.getParameter("bookid"));
		Book b = new Book();
		b.setBookId(bookid);
		b.setBookName(bookname);
		b.setBookPrice(bookprice);
		b.setBookIntroduce(bookintroduce);
		b.setBookAuthor(bookauthor);
		b.setTypeId(booktypeid);
		BookDao bd = new BookDaoImp();
		int i = bd.updateBook(b);
		request.setAttribute("update", i);
		if(i==1){
			try {
				//response.getWriter().write("<h1>修改图书成功</h1>");
				response.setHeader("refresh", "1;url=/shopweb/AdminBookServlet?book=booklist&&page="+pagenow+"");
				//request.getRequestDispatcher("/admin/main/updatebook.jsp").forward(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			try {
				//response.getWriter().write("<h1>修改图书失败</h1>");
				response.setHeader("refresh", "1;url=/shopweb/AdminBookServlet?book=booklist");
				//request.getRequestDispatcher("/admin/main/updatebook.jsp").forward(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	//上架图书
	public void shangjia(HttpServletRequest request, HttpServletResponse response){
		
		int pagenow = Integer.parseInt(request.getParameter("pagenow"));
		int bookid = Integer.parseInt(request.getParameter("bookid"));
		BookDao bd = new BookDaoImp();
		int i = bd.updateshangjia(bookid);
		
		if(i==1){
			
			//定义一页的个数
			int pagesize = 5;
			//定义分页查询语句从第几条开始
			int in = (pagenow-1)*pagesize;
			if(in<0){
				in=0;
			}
			//分页查询所有信息
			AdminVODao ad = new AdminVODaoImp();
			List<AdminVO> bookAll = ad.getAll(in,pagesize);
			//查询一共多少图书
			int counts = bd.getBookCount();
			Page page = PageUtil.getPage(pagesize, counts, pagenow);
			
			request.setAttribute("books", "booklist");
			request.setAttribute("page", page);
			request.setAttribute("book", bookAll);
			try {
				request.getRequestDispatcher("/admin/main/book.jsp").forward(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	}
	
	//下架图书
	public void xiajia(HttpServletRequest request, HttpServletResponse response){
		
		int pagenow = Integer.parseInt(request.getParameter("pagenow"));
		int bookid = Integer.parseInt(request.getParameter("bookid"));
		BookDao bd = new BookDaoImp();
		int i = bd.updatexiajia(bookid);
		
		if(i==1){
			//定义一页的个数
			int pagesize = 5;
			//定义分页查询语句从第几条开始
			int in = (pagenow-1)*pagesize;
			if(in<0){
				in=0;
			}
			//分页查询所有信息
			AdminVODao ad = new AdminVODaoImp();
			List<AdminVO> bookAll = ad.getAll(in,pagesize);
			//查询一共多少图书
			int counts = bd.getBookCount();
			Page page = PageUtil.getPage(pagesize, counts, pagenow);
			request.setAttribute("books", "booklist");
			request.setAttribute("page", page);
			request.setAttribute("book", bookAll);
			try {
				request.getRequestDispatcher("/admin/main/book.jsp").forward(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	//查询图书是否存在
	public void bookname(HttpServletRequest request, HttpServletResponse response){
		
		String bookname = request.getParameter("bookname");
		BookDao ud = new BookDaoImp();
		int i = ud.bookname(bookname);
		try {
			PrintWriter writer = response.getWriter();
			writer.println(i);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	
}
