package blog.junit;

import java.util.List;

import org.junit.Test;

import blog.dao.ArticleInterface;
import blog.daoImpl.ArticleInterfaceImpl;
import blog.entity.Article;

/** 
* @author  jie
* @date 创建时间：2019年12月15日 
* @version 1.0  
* @return  
*/
public class searchTest {
	/**
	 * 查找测试
	 */
	@Test
	public void testSearch() {
		ArticleInterface dao = ArticleInterfaceImpl.getInstance();
		List list = dao.searchArticle("java");
		for(int i = 0; i < list.size(); i++) {
			Article article = (Article) list.get(i);
			System.out.println(article);
		}
	}
}

