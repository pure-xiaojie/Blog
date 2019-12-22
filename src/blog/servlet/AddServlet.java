package blog.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import blog.entity.User;
import blog.service.ArticleService;
import blog.service.TagService;

/**
 * Servlet implementation class AddServlet
 */
@WebServlet("/AddServlet")
public class AddServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String user =  (String)request.getSession().getAttribute("userName");
		if(user == null) {
			System.out.println("未登录");
			response.sendRedirect("login.html");
		}
		else {
			System.out.println("已登录");
		
			// 初始化时间
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date = new Date();
			request.setAttribute("time", df.format(date));
			// 获取分类
			ArticleService as = ArticleService.getInstance();
			Map sort_count = as.getSortAndCount();
			request.setAttribute("sort_count", sort_count);
			// 获取标签
			TagService tg = TagService.getInstance();
		
			List all_tag = tg.getAllTag();
			request.setAttribute("all_tag", all_tag);
		
			request.getRequestDispatcher("/writeLog.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
