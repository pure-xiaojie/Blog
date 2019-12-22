package blog.junit;

import java.util.List;

import org.junit.Test;

import blog.entity.Article;
import blog.service.ArticleService;
import blog.utils.ExcelUtils;

/** 
* @author  jie
* @date 创建时间：2019年12月19日 
* @version 1.0  
* @return  
*/
public class ExcelTesst {
	@Test
	public void export() {
		ArticleService as = ArticleService.getInstance();
		List<Article> articleList = as.getArticle();
		try {
			ExcelUtils.WriteExcvel(articleList, "C:\\Users\\Public\\Desktop\\", "Article.xlsx");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("导出出错");
			e.printStackTrace();
		}
	}
}

