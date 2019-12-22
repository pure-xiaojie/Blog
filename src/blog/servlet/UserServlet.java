package blog.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import blog.entity.User;
import blog.service.UserService;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/admin/UserServlet")
public class UserServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = (String)request.getSession().getAttribute("userName");
		UserService us = UserService.getInstance();
		User user = us.getUser(name);
		//System.out.println(user);
		request.setAttribute("user", user);
		request.getRequestDispatcher("information.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String work = request.getParameter("work");
		String place = request.getParameter("place");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		
		User user = new User(Integer.parseInt(id),name,work,place,email,phone);
		
		UserService us = UserService.getInstance();
		String msg = us.updataUser(id, user);
		
		// 返回的数据
		JSONObject jo = new JSONObject();
		jo.put("msg", msg);
		// 写回ajax
		response.getWriter().println(jo);
		
	}

}
