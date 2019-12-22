package blog.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import blog.dao.UserInterface;
import blog.daoImpl.UserInterfaceImpl;
import blog.entity.User;


/**
 * 主页数据初始化
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		//System.out.println(username  + "  " + password);
		UserInterface dao = UserInterfaceImpl.getInstance();
		User user = dao.login(username, password);
		if (user == null)
			System.out.println("用户不存在或密码错误");
		
		if(user != null) {
			// 写入session
			HttpSession session = request.getSession();
			session.setAttribute("userName", user.getUser_name());
			

			// 转发到 日志主页 界面
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
		else {
			
			response.setContentType("text/html;charset=utf-8");    
			response.getWriter().write("<script>alert('用户名或密码错误');"
					+ "</script>");    
			response.getWriter().write("<script>alert('网页将跳转到login');"
					+ "window.location='login.html' ;window.close();"
					+ "</script>");    
			response.getWriter().flush();

		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
