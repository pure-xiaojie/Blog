package blog.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import blog.entity.Article;
import blog.service.ArticleService;
import blog.utils.ExcelUtils;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class ExportServlet
 */
@WebServlet("/ExportServlet")
public class ExportServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArticleService as = ArticleService.getInstance();
		List<Article> articleList = as.getArticle();
		String msg = null;
		try {
			ExcelUtils.WriteExcvel(articleList, "C:\\Users\\Public\\Desktop\\", "Article.xlsx");
			msg = "导出成功,请看桌面Article.xlsx";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			//System.out.println("导出出错");
			msg = "Sory,导出出错";
			e.printStackTrace();
		}
		
		JSONObject json = new JSONObject();
		json.put("msg",msg);
		response.getWriter().println(json);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
