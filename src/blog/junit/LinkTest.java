package blog.junit;

import java.util.List;

import org.junit.Test;

import blog.dao.LinkInterface;
import blog.daoImpl.LinkInterfaceImpl;
import blog.entity.Link;

/** 
* @author  jie
* @date 创建时间：2019年12月11日 
* @version 1.0  
* @return  
*/
public class LinkTest {
	/**
	 * 友链增加测试
	 */
	@Test
	public void testAddTag() {
		LinkInterface dao = LinkInterfaceImpl.getInstance();
		Link link = new Link();
		link.setName("小杰");
		link.setUrl("https://pure-xiaojie.github.io");
		link.setImage("https://profile.csdnimg.cn/1/1/B/2_qq_41216743");
		boolean result = dao.addLink(link);
		System.out.println("友链增加测试结果：" + result);
	}
	
	/**
	 * 友链更新测试
	 */
	@Test
	public void testUpdate() {
		LinkInterface dao = LinkInterfaceImpl.getInstance();
		Link link = new Link();
		link.setName("小杰日志");
		link.setUrl("https://pure-xiaojie.github.io");
		link.setImage("https://profile.csdnimg.cn/1/1/B/2_qq_41216743");
		boolean result = dao.updateLink(2, link);
		System.out.println("友链修改测试结果：" + result);
	}
	
	/**
	 * 友链删除测试
	 */
	@Test
	public void testDelete() {
		LinkInterface dao = LinkInterfaceImpl.getInstance();
		boolean result = dao.deleteLink(3);
		System.out.println("友链删除测试结果：" + result);
	}
	
	/**
	 * 获取所有
	 */
	@Test
	public void testGetLink() {
		LinkInterface dao = LinkInterfaceImpl.getInstance();
		List list = dao.getLink();
		for(int i = 0; i < list.size(); i++) {
			Link link = (Link) list.get(i);
			System.out.println(link);
		}
	}
	
	/**
	 * 获取单个
	 */
	@Test
	public void testGetLinkById() {
		LinkInterface dao = LinkInterfaceImpl.getInstance();
		Link link = dao.getLinkById(1);
		System.out.println(link);
	}
}

