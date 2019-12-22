package blog.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import blog.service.ArticleService;

@WebServlet("/searchServlet")
public class searchServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 获取的查找关键字
		String keyboard = request.getParameter("keyboard");
		//System.out.println(keyboard);
		
		// 初始化查找的文章
		ArticleService as = ArticleService.getInstance();
		// 初始查找文章列表
		request.setAttribute("search_list", as.searchArticle(keyboard));
		request.setAttribute("keyboard",keyboard);
		
		// 转发
		request.getRequestDispatcher("search.jsp").forward(request, response);
	}

}
