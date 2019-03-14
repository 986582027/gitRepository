package com.sb.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sb.bean.Book;
import com.sb.bean.BookType;
import com.sb.bean.Page;
import com.sb.bean.User;
import com.sb.bean.UserBook;
import com.sb.dao.BookDao;
import com.sb.dao.BookTypeDao;
import com.sb.dao.UserBookDao;
import com.sb.dao.UserDao;
import com.sb.dao.imp.BookDaoImp;
import com.sb.dao.imp.BookTypeDaoImp;
import com.sb.dao.imp.UserBookDaoImp;
import com.sb.dao.imp.UserDaoImp;
import com.sb.service.BookService;
import com.sb.service.UserBookService;
import com.sb.service.imp.BookServiceImp;
import com.sb.service.imp.UserBookServiceImp;
import com.sb.util.PageUtil;

/**
 * Servlet implementation class BookServlet
 */
@WebServlet("/BookServlet")
public class BookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String book = request.getParameter("book");
		if("type".equals(book)){
			type(request,response);
		}else if("sousuo".equals(book)){
			sort(request,response);
		}else if("shangpin".equals(book)){
			produce(request,response);
		}else if("liulan".equals(book)){
			glanceNumber(request,response);
		}else if("gouwuche".equals(book)){
			shopCar(request,response);
		}else if("shanchu".equals(book)){
			deleteBook(request,response);
		}else if("shopcarAll".equals(book)){
			shopcarAll(request,response);
		}else if("shopsubmit".equals(book)){
			shopsubmit(request,response);
		}else if("num".equals(book)){
			num1(request,response);
		}
		else{
			list(request,response);
		}
		
		
		
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	//随机取五本书
	public List<Book> getRandom(){
		//所有书得数量
		BookDao d = new BookDaoImp();
		int counts = d.getBookCount();
		//随机取五本
		List<Book> bookRandom = new ArrayList<Book>();
		int s[] = new int[20];
		int size = bookRandom.size();
		int count = 0;
		int random = 1+(int)(Math.random()*(counts-1+1));
		s[0] = random;
		boolean flg = false;
		while(size<5){
			random = 1+(int)(Math.random()*(counts-1+1));
			for (int i = 0; i <= count; i++) {
				if(s[i]==random){
					flg = false;
					break;
				}else{
					flg = true;
				}
			}
			
			if(flg==true){
				s[count]=random;
				count++;
				//查随机数random这本书是否上架
				int b = d.isBook(random);
				if(b==1){
					Book book = d.getByIdBook(random);
					bookRandom.add(book);
					size++;
				}
			}
		}
		
		return bookRandom;
	}

	
	
	
	
	//获取主页所需要得list
	public void list(HttpServletRequest request, HttpServletResponse response){
		//定义初始页数
		int pagenow = 1;
		//从页面获取到需要第几页数据
		String p = request.getParameter("pagenow");
		if(p!=null){
			pagenow = Integer.parseInt(p);
		}else{
			pagenow = 1;
		}
		//定义每页多少条数据
		int pagesize = 6;
		//定义分页查询语句从第几条开始
		int in = (pagenow-1)*pagesize;
		if(in<0){
			in=0;
		}
		//所有书得数量
		BookDao d = new BookDaoImp();
		int counts = d.getBookCount();
		
		//随机取五本
		List<Book> random = getRandom();
		request.setAttribute("bookrandom", random);
		//所有类型得集合
		BookTypeDao bt = new BookTypeDaoImp();
		List<BookType> typeAll = bt.getTypeAll();
		//分页
		List<Book> pageAll = d.getPageAll(in, pagesize);
		Page page = PageUtil.getPage(pagesize, counts, pagenow);
		
		request.setAttribute("pagenow", pagenow);
		request.setAttribute("list", "list");
		request.setAttribute("page", page);
		request.setAttribute("bookAll", pageAll);
		request.setAttribute("typeAll", typeAll);
		try {
			request.getRequestDispatcher("/main.jsp").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	//通过图书类型ID查询图书集合
	public void type(HttpServletRequest request, HttpServletResponse response){
		//获取页面类型ID
		int typeid = Integer.parseInt(request.getParameter("typeid"));
		//定义初始页数
		int pagenow = 1;
		//从页面获取到需要第几页数据
		String p = request.getParameter("pagenow");
		if(p!=null){
			pagenow = Integer.parseInt(p);
		}else{
			pagenow = 1;
		}
		//定义每页多少条数据
		int pagesize = 6;
		//定义分页查询语句从第几条开始
		int in = (pagenow-1)*pagesize;
		if(in<0){
			in=0;
		}
		//通过类型ID获取总图书数量
		BookDao d = new BookDaoImp();
		int counts = d.getBookByTypeId(typeid);
		//所有类型得集合
		BookTypeDao bt = new BookTypeDaoImp();
		List<BookType> typeAll = bt.getTypeAll();
		//分页
		List<Book> pageAll = d.getPageByIdAll(in, pagesize, typeid);
		
		Page page = PageUtil.getPage(pagesize, counts, pagenow);
		//随机五本
		List<Book> random = getRandom();
		request.setAttribute(  "list", "type");
		request.setAttribute("typeid", typeid);
		request.setAttribute("bookrandom", random);
		request.setAttribute("page", page);
		request.setAttribute("bookAll", pageAll);
		request.setAttribute("typeAll", typeAll);
		try {
			request.getRequestDispatcher("/main.jsp").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	//通过图书名称查询图书
	public void sort(HttpServletRequest request, HttpServletResponse response){
				//定义初始页数
				int pagenow = 1;
				//从页面获取到需要第几页数据
				String p = request.getParameter("pagenow");
				if(p!=null){
					pagenow = Integer.parseInt(p);
				}else{
					pagenow = 1;
				}
				//定义每页多少条数据
				int pagesize = 6;
				//定义分页查询语句从第几条开始
				int in = (pagenow-1)*pagesize;
				if(in<0){
					in=0;
				}
		//接受从页面拿到的要搜索的书名
		String bookname = request.getParameter("bookname");
		//所有类型得集合
		BookTypeDao bt = new BookTypeDaoImp();
		List<BookType> typeAll = bt.getTypeAll();
		//所有书得数量
		BookDao d = new BookDaoImp();
		int counts = d.getCountByName(bookname);
		//通过图书名称查询图书(分页)
		List<Book> book = d.getByName(in, pagesize,bookname);
		Page page = PageUtil.getPage(pagesize, counts, pagenow);
		//随机取五本
		List<Book> random = getRandom();
		request.setAttribute("bookrandom", random);
		request.setAttribute("bookname", bookname);
		request.setAttribute("list", "sousuo");
		request.setAttribute("bookAll", book);
		request.setAttribute("page", page);
		request.setAttribute("typeAll", typeAll);
		try {
			request.getRequestDispatcher("/main.jsp").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//获取每个产品的相信信息
	public void produce(HttpServletRequest request, HttpServletResponse response){
		
		int pagenow = Integer.parseInt(request.getParameter("pagenow"));
		int bookid = Integer.parseInt(request.getParameter("bookid"));
		BookDao b = new BookDaoImp();
		//通过图书ID查询图书信息
		Book book = b.getByIdBook(bookid);
		BookTypeDao bt = new BookTypeDaoImp();
		//通过类型ID查询类型名称
		String typename = bt.getByIdTypeName(book.getTypeId());
		request.setAttribute("pagenow", pagenow);
		request.setAttribute("book", book);
		request.setAttribute("typename", typename);
		try {
			request.getRequestDispatcher("/products.jsp").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//浏览量
	public void glanceNumber(HttpServletRequest request, HttpServletResponse response){
		//浏览量+1
		int glanceNumber =Integer.parseInt(request.getParameter("glanceNumber"));
		int bookid = Integer.parseInt(request.getParameter("bookid"));
		//浏览量修改查询
		BookService bs = new BookServiceImp();
		int glanceNumber2 = bs.glanceNumber(glanceNumber, bookid);
		try {
			PrintWriter writer = response.getWriter();
			writer.println(glanceNumber2);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	//点击产品并查询购物车中的信息
	public void shopCar(HttpServletRequest request, HttpServletResponse response){
		
		int pagenow = Integer.parseInt(request.getParameter("pagenow"));
		//获取图书ID
		int bookid  = Integer.parseInt(request.getParameter("bookid"));
		//获取用户ID
		HttpSession session = request.getSession(true);
		String username = (String) session.getAttribute("username");
		UserDao ud = new UserDaoImp();
		int userid = ud.getByUserName(username);
		//查询购物车
		UserBookService ubs = new UserBookServiceImp();
		List<UserBook> list = ubs.getAll(userid, bookid);
		//算总价钱
		int princes=0;
		for (UserBook userBook : list) {
			int num = userBook.getBookNum();
			Double prince = userBook.getBookPrice();
			princes += num*prince;
		}
		//通过用户id查询用户信息
		UserDao u = new UserDaoImp();
		User user = u.getAll(userid);
		
		request.setAttribute("pagenow", pagenow);
		request.setAttribute("princes", princes);
		request.setAttribute("user", user);
		request.setAttribute("list", list);
		try {
			request.getRequestDispatcher("/shopping.jsp").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	//删除购物车里的东西
	public void deleteBook(HttpServletRequest request, HttpServletResponse response){
		
		int pagenow = Integer.parseInt(request.getParameter("p1"));
		int userid = Integer.parseInt(request.getParameter("userid"));
		int bookid = Integer.parseInt(request.getParameter("bookid"));
		//通过图书id和用户id删除
		UserBookDao ubd = new UserBookDaoImp();
		int i = ubd.delete(userid, bookid);
		if(i==1){
			try {
				//response.getWriter().write("<h1>删除成功</h1>");
				response.setHeader("refresh", "1;url=/shopweb/BookServlet?book=shopcarAll&&pagenow="+pagenow+"");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			try {
				//response.getWriter().write("<h1>删除失败</h1>");
				response.setHeader("refresh", "1;url=/shopweb/BookServlet?book=shopcarAll&&pagenow="+pagenow+"");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		
	}
	//查询购物车里得所有产品
	public void shopcarAll(HttpServletRequest request, HttpServletResponse response){
		int pagenow = Integer.parseInt(request.getParameter("pagenow"));
		//获取用户ID
		HttpSession session = request.getSession(true);
		String username = (String) session.getAttribute("username");
		//获取购物车集合
		if(username!=null){
			UserBookDao ubd = new UserBookDaoImp();
			List<UserBook> list = ubd.getAll();
			request.setAttribute("list", list);
			//算总价钱
			int princes=0;
			for (UserBook userBook : list) {
				int num = userBook.getBookNum();
				Double prince = userBook.getBookPrice();
				princes += num*prince;
			}
			request.setAttribute("princes", princes);
			
		}
		UserDao ud = new UserDaoImp();
		int userid = ud.getByUserName(username);
		//通过用户id查询用户信息
		UserDao u = new UserDaoImp();
		User user = u.getAll(userid);
		
		request.setAttribute("pagenow", pagenow);
		request.setAttribute("user", user);
		try {
			request.getRequestDispatcher("/shopping.jsp").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	//购物车提交
	public void shopsubmit(HttpServletRequest request, HttpServletResponse response){
		
		int pagenow = Integer.parseInt(request.getParameter("pagenow"));
		HttpSession session = request.getSession(true);
		User user = (User) session.getAttribute("user");
		UserBookService ubs = new UserBookServiceImp();
		int shopSubmit = ubs.shopSubmit(user.getUserId());
		if(shopSubmit==1){
			try {
				response.getWriter().write("<h1>购买成功</h1>");
				response.setHeader("refresh", "1;url=/shopweb/BookServlet&&pagenow="+pagenow+"");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}else{
			try {
				//response.getWriter().write("<h1>购买失败</h1>");
				response.setHeader("refresh", "1;url=/shopweb/BookServlet?book=shopcarAll");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
	}
	//改变购物车里的数量
	public void num1(HttpServletRequest request, HttpServletResponse response){
		
		HttpSession session = request.getSession(true);
		User user = (User) session.getAttribute("user");
		int bookid = Integer.parseInt(request.getParameter("bookid"));
		int num = Integer.parseInt(request.getParameter("num2"));
		UserBookDao ubd = new UserBookDaoImp();
		int i = ubd.updateByIdNumber(user.getUserId(), bookid, num)	;	
		Double prince = 0.0;
		if(i==1){
			//通过图书ID找出图书价格
			BookDao bd = new BookDaoImp();
			Book book = bd.getByIdBook(bookid);
			prince = book.getBookPrice();
			try {
				PrintWriter writer = response.getWriter();
				writer.println(prince);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
	}
	
	
	
	

}
