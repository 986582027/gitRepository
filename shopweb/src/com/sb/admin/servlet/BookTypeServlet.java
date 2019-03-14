package com.sb.admin.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sb.admin.dao.AdminTypeDao;
import com.sb.admin.dao.imp.AdminTypeDaoImp;
import com.sb.bean.BookType;
import com.sb.bean.Page;
import com.sb.dao.BookDao;
import com.sb.dao.BookTypeDao;
import com.sb.dao.imp.BookDaoImp;
import com.sb.dao.imp.BookTypeDaoImp;
import com.sb.util.PageUtil;

/**
 * Servlet implementation class BookTypeServlet
 */
@WebServlet("/BookTypeServlet")
public class BookTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public BookTypeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String type = request.getParameter("type");
		if("typelist".equals(type)){
			typelist(request,response);
		}else if("delete".equals(type)){
			typedelete(request,response);
		}else if("addtype".equals(type)){
			typeadd(request,response);
		}else if("updateselet".equals(type)){
			updateselet(request,response);
		}else if("updatetype".equals(type)){
			updatetype(request,response);
		}else if("addtypeselect".equals(type)){
			addtypeselect(request,response);
		}else if("typename".equals(type)){
			typename(request,response);
		}
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	//类型查询
		public void typelist(HttpServletRequest request, HttpServletResponse response){
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
			//从那一条开始查
			int pagecount = (pagenow-1)*pagesize; 
			//分页查询所有信息
			AdminTypeDao atd = new AdminTypeDaoImp();
			List<BookType> gettypeAll = atd.gettypeAll(pagecount, pagesize);
			//查询一共多少图书
			int typeCount = atd.getTypeCount();
			Page page = PageUtil.getPage(pagesize, typeCount, pagenow);
			request.setAttribute("page", page);
			request.setAttribute("type", gettypeAll);
			try {
				request.getRequestDispatcher("/admin/main/type.jsp").forward(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	//删除类型
		public void typedelete(HttpServletRequest request, HttpServletResponse response){
			
			int pagenow = Integer.parseInt(request.getParameter("pagenow"));
			int typeid = Integer.parseInt(request.getParameter("typeid"));
			AdminTypeDao atd = new AdminTypeDaoImp();
			int i = atd.deleteType(typeid);	
			if(i==1){
				try {
					response.getWriter().write("<h1>删除图书类型成功</h1>");
					response.setHeader("refresh", "1;url=/shopweb/BookTypeServlet?type=typelist&&page="+pagenow+"");
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}else{
				BookDao ud = new BookDaoImp();
				int i1 = ud.getBookByTypeId(typeid);
				if(i1!=0){
					try {
						response.getWriter().write("<h1>删除图书类型失败,因为类型中还有图书存在</h1>");
						response.setHeader("refresh", "1;url=/shopweb/BookTypeServlet?type=typelist&&page="+pagenow+"");
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}else{
					try {
						response.getWriter().write("<h1>删除图书类型失败</h1>");
						response.setHeader("refresh", "1;url=/shopweb/BookTypeServlet?type=typelist&&page="+pagenow+"");
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
		}
	//新增类型
		public void typeadd(HttpServletRequest request, HttpServletResponse response){
			
			int pagenow = Integer.parseInt(request.getParameter("pagenow"));
			String typename = request.getParameter("typename");
			BookType bt = new BookType();
			bt.setTypeName(typename);
			AdminTypeDao atd = new AdminTypeDaoImp();
			int i = atd.addType(bt);
			if(i==1){
				try {
					//response.getWriter().write("<h1>新增图书类型成功</h1>");
					response.setHeader("refresh", "1;url=/shopweb/BookTypeServlet?type=typelist&&page="+pagenow+"");
					//request.getRequestDispatcher("/admin/main/addtype.jsp").forward(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else{
				try {
					//response.getWriter().write("<h1>新增图书类型失败</h1>");
					response.setHeader("refresh", "1;url=/shopweb/BookTypeServlet?type=typelist&&page="+pagenow+"");
					//request.getRequestDispatcher("/admin/main/addtype.jsp").forward(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
		
		}
		//修改类型查询
		public void updateselet(HttpServletRequest request, HttpServletResponse response){
			
			int pagenow = Integer.parseInt(request.getParameter("pagenow"));
			int typeid = Integer.parseInt(request.getParameter("typeid"));
			BookTypeDao btd = new BookTypeDaoImp();
			String typename = btd.getByIdTypeName(typeid);
			request.setAttribute("typename", typename);
			request.setAttribute("typeid", typeid);
			request.setAttribute("pagenow", pagenow);
			try {
				request.getRequestDispatcher("/admin/main/updatetype.jsp").forward(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		//修改类型
		public void updatetype(HttpServletRequest request, HttpServletResponse response){
			
			int pagenow = Integer.parseInt(request.getParameter("pagenow"));
			String typename = request.getParameter("typename");
			int typeid = Integer.parseInt(request.getParameter("typeid"));
			BookType bt = new BookType();
			bt.setTypeName(typename);
			bt.setTypeId(typeid);
			AdminTypeDao atd = new AdminTypeDaoImp();
			int i = atd.updatetype(bt);
			request.setAttribute("update", i);
			if(i==1){
				try {
					//response.getWriter().write("<h1>修改图书类型成功</h1>");
					response.setHeader("refresh", "1;url=/shopweb/BookTypeServlet?type=typelist&&page="+pagenow+"");
					//request.getRequestDispatcher("/admin/main/updatetype.jsp").forward(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else{
				try {
					//response.getWriter().write("<h1>修改图书类型失败</h1>");
					response.setHeader("refresh", "1;url=/shopweb/BookTypeServlet?type=typelist&&page="+pagenow+"");
					//request.getRequestDispatcher("/admin/main/updatetype.jsp").forward(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
		}
	//查询所有类型
		public void addtypeselect(HttpServletRequest request, HttpServletResponse response){
			
			BookTypeDao btd = new BookTypeDaoImp();
			List<BookType> typeAll = btd.getTypeAll();
			request.setAttribute("type", typeAll);
			try {
				request.getRequestDispatcher("/admin/main/addbook.jsp").forward(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	//通过类型名称判断是否存在
		public void typename(HttpServletRequest request, HttpServletResponse response){
			
			String typename = request.getParameter("typename");
			AdminTypeDao atd = new AdminTypeDaoImp();
			int i = atd.typename(typename);
			try {
				PrintWriter writer = response.getWriter();
				writer.println(i);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	
	
}
