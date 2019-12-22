package blog.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import blog.entity.Link;
import blog.service.LinkService;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class LinkServlet
 */
@WebServlet("/LinkServlet")
public class LinkServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String methods = request.getParameter("methods");
		int linkId = Integer.parseInt(id);
		//System.out.println(methods + ":" + linkId);
		
		// 返回的数据
		JSONObject jo = new JSONObject();
		if(methods.equals("init")) {
			//初始化友链
			Link link = new Link();
			LinkService links = LinkService.getInstance();
			link = links.getLinkById(linkId);

			jo.put("name",link.getName());
			jo.put("url",link.getUrl());
			jo.put("image",link.getImage());
		} else if(methods.equals("delete")) {
			LinkService links = LinkService.getInstance();
			boolean res = links.deleteLink(linkId);
			if(res == true) {
				jo.put("result","友链删除成功！");
			}
			else {
				jo.put("result","友链删除失败！");
			}
		}
		// 写回ajax
		response.getWriter().println(jo);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		int linkId = Integer.parseInt(id);
		String linkName = (String)request.getParameter("linkName");
		String linkUrl = (String)request.getParameter("linkUrl");
		String linkImage = (String)request.getParameter("linkImage");
		
		Link link = new Link();
		link.setName(linkName);
		link.setUrl(linkUrl);
		link.setImage(linkImage.substring(linkImage.lastIndexOf("\\")+1));
		
		//System.out.println("添加友链：" + "id:" + id + "  linkName:" + linkName  + "    linkUrl:" + linkUrl + "    linkImage:" + linkImage);
		
		// 返回的数据
		JSONObject jo = new JSONObject();
		
		LinkService links = LinkService.getInstance();
		
		//添加友链
		if(linkId == 0) {
			boolean res = links.addLink(link);
			if(res == true) {
				jo.put("result","友链添加成功！");
			}
			else {
				jo.put("result","友链添加失败！");
			}
		}else {
			boolean res = links.updateLink(linkId, link);
			if(res == true) {
				jo.put("result","友链修改成功！");
			}
			else {
				jo.put("result","友链修改失败！");
			}
		}
		
		// 写回ajax
		response.getWriter().println(jo);
	}

}
