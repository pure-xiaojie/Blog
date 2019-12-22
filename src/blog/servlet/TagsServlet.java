package blog.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import blog.entity.Link;
import blog.entity.Tag;
import blog.service.AdminService;
import blog.service.LinkService;
import blog.service.TagService;
import blog.utils.StringUtils;
import net.sf.json.JSONObject;

@WebServlet("/TagsServlet")
public class TagsServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = request.getParameter("id");
		String tag = request.getParameter("tag");
		int tagId = Integer.parseInt(id);
		
		// 返回的数据
		JSONObject jo = new JSONObject();

		
		AdminService as = AdminService.getInstance();
		boolean res = as.deleteTag(tagId,tag);
		if(res == true) {
			jo.put("result","删除成功！");
		}
		else {
			jo.put("result","删除失败！");
		}
		
		// 写回ajax
		response.getWriter().println(jo);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		int tagId = Integer.parseInt(id);
		String oldTag = (String)request.getParameter("oldTag");
		String newTag = (String)request.getParameter("newTag");
		
		// 返回的数据
		JSONObject jo = new JSONObject();
		
		AdminService as = AdminService.getInstance();
		boolean res = as.updateTag(tagId, oldTag, newTag);
		
		if(res == true) {
			jo.put("result","修改成功！");
		}
		else {
			jo.put("result","修改失败！");
		}
		
		// 写回ajax
		response.getWriter().println(jo);
	}

}
