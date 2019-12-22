package blog.service;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import blog.dao.ArticleInterface;
import blog.dao.TagInterface;
import blog.daoImpl.ArticleInterfaceImpl;
import blog.daoImpl.TagInterfaceImpl;
import blog.db.C3P0Connection;
import blog.entity.Article;
import blog.utils.FailException;
import blog.utils.Form2Bean;

public class AdminService {

	private ArticleInterface adao;
	private TagInterface tdao;
	private static AdminService instance;

	private AdminService() {
		adao = ArticleInterfaceImpl.getInstance();
		tdao = TagInterfaceImpl.getInstance();
	}

	/**
	 * 获取实例
	 * 
	 * @return
	 */
	public static final AdminService getInstance() {
		if (instance == null) {
			try {
				instance = new AdminService();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return instance;
	}

	public Article addArticle(HttpServletRequest request) {
		// 新建文章
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		Article article = null;
		try {
			article = Form2Bean.articleForm2Bean(request);
		} catch (FailException e) {
			e.printStackTrace();
		}
		if (article == null)
			return null;
		System.out.println("添加文章");
		Article a = adao.addArticle(article);
		if (a == null)
			return null;
		// 增加标签
		String str = request.getParameter("tags").trim();
		String[] tags = str.split(" ");
		for (String tag : tags) {
			tdao.addTag(a.getId(), tag);
		}
		return a;
	}

	public Article updateArticle(HttpServletRequest request) {
		// 获取旧的文章id
		String old_id = request.getParameter("id");
		// 删除旧的文章
		this.delteArticle(old_id);

		return this.addArticle(request);
	}

	public Article getArticle(String article_id) {
		List<Article> list = adao.getArticleByColumn("id", article_id);
		if (list.size() != 0) {
			return list.get(0);
		}
		return null;
	}

	public boolean delteArticle(String id) {
		return adao.deleteArticle(id);
	}

	public boolean updateSort(String old_sort, String new_sort) {
		return adao.updateSort(old_sort, new_sort);
	}

	public boolean deleteSort(String sort) {
		return adao.delelteSort(sort);
	}

	public boolean updateTag(int id,String old_tag, String new_tag) {
		boolean result = tdao.updateTag(id,old_tag, new_tag);
		return result;
	}

	public boolean deleteTag(int id,String tag) {
		// 删除标签
		boolean result = tdao.deleteTag(id, tag);
		return result;
	}

}
