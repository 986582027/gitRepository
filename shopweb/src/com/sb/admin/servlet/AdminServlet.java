package com.sb.admin.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sb.admin.bean.Admin;
import com.sb.admin.dao.AdminDao;
import com.sb.admin.dao.imp.AdminDaoImp;
import com.sb.admin.service.AdminService;
import com.sb.admin.service.imp.AdminServiceImp;
import com.sb.dao.UserDao;
import com.sb.dao.imp.UserDaoImp;

/**
 * Servlet implementation class AdminServlet
 */
@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public AdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String bzw = request.getParameter("bzw");
		if("login".equals(bzw)){
			login(request,response);
		}else if("list".equals(bzw)){
			list(request,response);
		}else if("update".equals(bzw)){
			update(request,response);
		}else if("updatepsd".equals(bzw)){
			updatepsd(request,response);
		}else if("zhuxiao".equals(bzw)){
			zhuxiao1(request,response);
		}else if("phone".equals(bzw)){
			phone(request,response);
		}else if("email".equals(bzw)){
			email(request,response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	//登录
	public void login(HttpServletRequest request, HttpServletResponse response){
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		AdminDao ad = new AdminDaoImp();
		int login = ad.login(username, password);
		if(login==1){
			//通过用户名查找admin对象
			int userid = ad.getByUserName(username);
			Admin admin = ad.getAll(userid);
			HttpSession session = request.getSession();
			//获取当前时间
			SimpleDateFormat sdf = new SimpleDateFormat("HH");
			int hour = Integer.parseInt(sdf.format(new Date()));
			//定义早上好或者晚上好
			String s = "";
			if(hour<12&&hour>0){
				s="早上好";
			}else if(hour>=12&&hour<=2){
				s="中午好";
			}else if(hour>12&&hour<=19){
				s="下午好";
			}else if(hour>19&&hour<=24){
				s="晚上好";
				
			}
			session.setAttribute("adminusername", username);
			session.setAttribute("adminpassword", password);
			session.setAttribute("admin", admin);
			session.setAttribute("s", s);
				try {
					//response.getWriter().write("<h1>登录成功</h1>");
					response.setHeader("refresh", "1;url=/shopweb/admin/main/main1.jsp");
//					request.getRequestDispatcher("/admin/main/main1.jsp").forward(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}else{
			try {
				//response.getWriter().write("<h1>登录失败，请重新登录</h1>");
				response.setHeader("refresh", "1;url=/shopweb/admin/admin.jsp");
				//request.getRequestDispatcher("/admin/admin.jsp").forward(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
		}
		
		
	}
	//查询修改信息
	public void list(HttpServletRequest request, HttpServletResponse response){
		HttpSession session = request.getSession(true);
		//session中的账号
		String adminusername = (String) session.getAttribute("adminusername");
		AdminDao ad = new AdminDaoImp();
		//通过用户账号查找用户ID
		int adminid = ad.getByUserName(adminusername);
		//通过id查找用户
		Admin admin = ad.getAll(adminid);
		request.setAttribute("admin",admin);
		try {
			request.getRequestDispatcher("/admin/main/data.jsp").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	//修改信息
	public void update(HttpServletRequest request, HttpServletResponse response){
		
		String adminname = request.getParameter("name");
		String adminusername = request.getParameter("username");
		String adminsex = request.getParameter("sex");
		String adminphone = request.getParameter("phone");
		String adminemail = request.getParameter("email");
		String adminaddress = request.getParameter("address");
		int adminid = Integer.parseInt(request.getParameter("adminid"));
		Admin a = new Admin();
		a.setAdminId(adminid);
		a.setAdminName(adminname);
		a.setAdminAccount(adminusername);
		a.setAdminSex(adminsex);
		a.setAdminPhone(adminphone);
		a.setAdminEmail(adminemail);
		a.setAdminAddress(adminaddress);
		AdminDao ad = new AdminDaoImp();
		//修改
		int i  = ad.updateUser(a);
		//通过id查找用户
		Admin admin = ad.getAll(adminid);
		request.setAttribute("admin",admin);
		request.setAttribute("update", i);
		if(i==1){
			try {
				//response.getWriter().write("<h1>修改信息成功</h1>");
				response.setHeader("refresh", "1;url=/shopweb/AdminServlet?bzw=list");
			} catch (Exception e1) { 
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}else{
			try {
				//response.getWriter().write("<h1>修改信息失败</h1>");
				response.setHeader("refresh", "1;url=/shopweb/AdminServlet?bzw=list");
			} catch (Exception e1) { 
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		
		
	}
	//修改密码
	public void updatepsd(HttpServletRequest request, HttpServletResponse response){
		String password = request.getParameter("password");
		String newpassword = request.getParameter("newpassword");
		String oldpassword = request.getParameter("oldpassword");
		int adminid = Integer.parseInt(request.getParameter("adminid"));
		AdminService as = new AdminServiceImp();
		int updatemima = as.updatemima(adminid, oldpassword, newpassword, password);
		request.setAttribute("i", updatemima);
		if(updatemima==1){
			try {
				
				//response.getWriter().write("<h1>修改密码成功</h1>");
				response.setHeader("refresh", "1;url=/shopweb/admin/main/index.jsp");
	//			request.getRequestDispatcher("/BookServlet").forward(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			try {
				//response.getWriter().write("<h1>修改密码失败</h1>");
				response.setHeader("refresh", "1;url=/shopweb/admin/main/changepsd.jsp");
//				request.getRequestDispatcher("/admin/main/changepsd.jsp").forward(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	//注销
	public void zhuxiao1(HttpServletRequest request, HttpServletResponse response){

		HttpSession session = request.getSession(false);
		if(session==null){
			try {
				response.sendRedirect(request.getContextPath()+"/admin/admin.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}		
		}
		session.removeAttribute("admin");
		session.removeAttribute("adminusername");
		session.removeAttribute("adminpassword");
		try {
			//response.getWriter().write("<h1>注销成功</h1>");
			response.setHeader("refresh", "1;url=/shopweb/admin/admin.jsp");
//			response.sendRedirect(request.getContextPath()+"/admin/admin.jsp");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	//验证手机号是否存在
	public void phone(HttpServletRequest request, HttpServletResponse response){
		
		String phone = request.getParameter("phone");
		//通过手机号验证是否存在
		AdminDao ud = new AdminDaoImp();
		int count = ud.phone(phone);
		try {
			PrintWriter writer = response.getWriter();
			writer.println(count);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	//验证邮箱是否存在
		public void email(HttpServletRequest request, HttpServletResponse response){
			
			String email = request.getParameter("email");
			//通过邮箱验证是否存在
			AdminDao ud = new AdminDaoImp();
			int count = ud.email(email);
			try {
				PrintWriter writer = response.getWriter();
				writer.println(count);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}
	

}
