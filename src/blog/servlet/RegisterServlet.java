package blog.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import blog.entity.User;
import blog.service.UserService;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("name");
		String password = request.getParameter("password");
		String work = request.getParameter("work");
		String email = request.getParameter("email");
		String place = request.getParameter("place");
		String phone = request.getParameter("phone");
		
		User user = new User(username,password,work,place,email,phone);
		UserService us = UserService.getInstance();
		String msg = us.register(user);
		System.out.println(msg);
		response.setContentType("text/html;charset=utf-8");    
		response.getWriter().write("<script>alert('" + msg + "');"
				+ "</script>");    
		response.getWriter().write("<script>"
				+ "window.location='login.html' ;window.close();"
				+ "</script>");    
		response.getWriter().flush();
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
