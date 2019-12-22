package blog.junit;

import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import org.junit.Test;

import blog.dao.ArticleInterface;
import blog.daoImpl.ArticleInterfaceImpl;
import blog.entity.Article;

public class ArticleTest {

	// @Test
	public void testGetArticleByColumn() {

		ArticleInterface dao = ArticleInterfaceImpl.getInstance();
		List<Article> articleBySort = dao.getArticleByColumn("id", "2");
		for (Article a : articleBySort) {
			System.out.println(a.toString());
		}

	}

	@Test
	public void testSplit() {
		String str = " ea eeare ear erae";
		String[] s = str.split(" ");
		for (String s1 : s) {
			System.out.println(s1);
		}
	}

	// @Test
	public void testGetArticle() {

		ArticleInterface dao = ArticleInterfaceImpl.getInstance();
		try {
			List allArticle = dao.getAllArticle();
			if (allArticle.size() > 0) {

				Iterator it = allArticle.iterator();
				while (it.hasNext()) {
					Article at = (Article) it.next();
					System.out.println(at.toString());
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
