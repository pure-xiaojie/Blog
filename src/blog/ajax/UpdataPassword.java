package blog.ajax;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import blog.service.UserService;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class UpdataPassword
 */
@WebServlet("/admin/UpdataPassword")
public class UpdataPassword extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String oldPass = request.getParameter("oldPass");
		String newPass = request.getParameter("newPass");
		
		String name = (String)request.getSession().getAttribute("userName");
		
		UserService us = UserService.getInstance();
		String msg = us.updataPassword(name, oldPass, newPass);
		int flag = Integer.parseInt(msg.substring(0,1));
		
		// 返回的数据
		JSONObject jo = new JSONObject();
		jo.put("msg", msg);
		jo.put("flag", flag);
		// 写回ajax
		response.getWriter().println(jo);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
