package com.sb.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sb.bean.User;
import com.sb.dao.UserDao;
import com.sb.dao.imp.UserDaoImp;
import com.sb.service.UserService;
import com.sb.service.imp.UserServiceImp;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public UserServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String bzw = request.getParameter("bzw");
		if("login".equals(bzw)){
			login(request,response);
		}else if("register".equals(bzw)){
			register(request,response);
		}else if("selectupdate".equals(bzw)){
			selectupdate(request,response);
		}else if("update".equals(bzw)){
			update(request,response);
		}else if("updatemima".equals(bzw)){
			updatemima(request,response);
		}else if("zhuxiao".equals(bzw)){
			zhuxiao(request,response);
		}else if("zhanghao".equals(bzw)){
			zhanghao(request,response);
		}else if("phone".equals(bzw)){
			phone(request,response);
		}else if("email".equals(bzw)){
			email(request,response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	//登录
	public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		UserDao u = new UserDaoImp();
		int i = u.login(username, password);
		if(i==1){
			int userid = u.getByUserName(username);
			User user = u.getAll(userid);
			HttpSession session = request.getSession(true);
			session.setAttribute("username", username);
			session.setAttribute("password", password);
			session.setAttribute("user", user);
//			response.getWriter().write("<h1>登录成功</h1>");
//			response.setHeader("refresh", "1;url=/shopweb/BookServlet");
			request.getRequestDispatcher("/BookServlet").forward(request, response);
		}else{
//			response.getWriter().write("<h1>登录失败</h1>");
//			response.setHeader("refresh", "1;url=/shopweb/login.jsp");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}
		
	}
	//注册
	public void register(HttpServletRequest request, HttpServletResponse response){
		
		String name = request.getParameter("name");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String sex = request.getParameter("sex");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		User u = new User();
		u.setName(name);
		u.setUsername(username);
		u.setPassword(password);
		u.setUserEmail(email);
		u.setUserSex(sex);
		u.setUserPhone(phone);
		u.setUserAddress(address);
		UserDao ud = new UserDaoImp(); 
		int i = ud.register(u);
		request.setAttribute("i", i);
		if(i==1){
			try {
			//response.getWriter().write("<h1>注册成功,请登录</h1>");
				response.setHeader("refresh", "1;url=/shopweb/UserServlet?bzw=zhuxiao");
				//request.getRequestDispatcher("/register.jsp").forward(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			try {
				//response.getWriter().write("<h1>注册失败</h1>");
				response.setHeader("refresh", "1;url=/shopweb/register.jsp");
			//	request.getRequestDispatcher("/register.jsp").forward(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
	}
	//个人信息修改查询
	public void selectupdate(HttpServletRequest request, HttpServletResponse response){
		//获取页面的用户名
		String username = request.getParameter("username");
		//通过用户名获取用户ID
		UserDao ud = new UserDaoImp();
		int userid = ud.getByUserName(username);
		//通过用户ID获取用户
		User user = ud.getAll(userid);
		request.setAttribute("user", user);
		request.setAttribute("username", username);
		try {
			request.getRequestDispatcher("/help.jsp").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	//个人资料修改
	public void update(HttpServletRequest request, HttpServletResponse response){
		UserDao ud = new UserDaoImp();
		int userid = Integer.parseInt(request.getParameter("userid"));
		String email = request.getParameter("email");
		String sex = request.getParameter("sex");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		User u = new User();
		u.setUserId(userid);
		u.setUserEmail(email);
		u.setUserSex(sex);
		u.setUserPhone(phone);
		u.setUserAddress(address);
		//修改信息
		int i = ud.updateUser(u);
		if(i==1){
			try {
				//response.getWriter().write("<h1>修改个人信息成功</h1>");
				response.setHeader("refresh", "1;url=/shopweb/UserServlet?bzw=selectupdate");
				//request.getRequestDispatcher("/help.jsp").forward(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			try {
				//response.getWriter().write("<h1>修改个人信息失败</h1>");
				response.setHeader("refresh", "1;url=/shopweb/UserServlet?bzw=selectupdate");
				//request.getRequestDispatcher("/help.jsp").forward(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	
	}
	//修改密码
	public void updatemima(HttpServletRequest request, HttpServletResponse response){
		int userid = Integer.parseInt(request.getParameter("userid"));
		String password = request.getParameter("password");
		String newpassword = request.getParameter("newpassword");
		UserService us = new UserServiceImp();
		UserDao ud = new UserDaoImp();
		int updatemimai = us.updatemima(userid, password, newpassword);
		if(updatemimai==1){
			
			try {
				//response.getWriter().write("<h1>修改密码成功</h1>");
				response.setHeader("refresh", "1;url=/shopweb/UserServlet?bzw=zhuxiao");
			//	request.getRequestDispatcher("/help.jsp").forward(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			try {
				//response.getWriter().write("<h1>修改密码失败</h1>");
				response.setHeader("refresh", "1;url=/shopweb/UserServlet?bzw=selectupdate");
			//	request.getRequestDispatcher("/help.jsp").forward(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	//注销
	public void zhuxiao(HttpServletRequest request, HttpServletResponse response){
		//不再创建session
		HttpSession session = request.getSession(false);
		if(session==null){
			try {
				response.sendRedirect(request.getContextPath()+"/login.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}		
		}
		session.removeAttribute("user");
		session.removeAttribute("username");
		session.removeAttribute("password");
		try {
			//response.getWriter().write("<h1>注销成功</h1>");
			//response.setHeader("refresh", "1;url=/shopweb/BookServlet");
			request.getRequestDispatcher("/BookServlet").forward(request, response);	
			//response.sendRedirect(request.getContextPath()+"/login.jsp");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	//注册判断账号是否存在
	public void zhanghao(HttpServletRequest request, HttpServletResponse response){
		
		String username = request.getParameter("username");
		UserDao ud = new UserDaoImp();
		int userid = ud.getByUserName(username);
		int i = 0;
		if(userid!=0){
			i= 1;
		}
		try {
			PrintWriter writer = response.getWriter();
			writer.println(i);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	//验证手机号是否存在
	public void phone(HttpServletRequest request, HttpServletResponse response){
		
		String phone = request.getParameter("phone");
		//通过手机号验证是否存在
		UserDao ud = new UserDaoImp();
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
			UserDao ud = new UserDaoImp();
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
