package blog.service;/** 
* @author  jie
* @date 创建时间：2019年12月11日 
* @version 1.0  
* @return  
*/

import java.util.List;

import blog.dao.LinkInterface;
import blog.daoImpl.LinkInterfaceImpl;
import blog.entity.Link;

public class LinkService {
	private LinkInterface dao;
	
	private static LinkService instance;
	
	public LinkService() {
		dao = LinkInterfaceImpl.getInstance();
	}
	
	public static final LinkService getInstance() {
		if(instance == null) {
			try {
				instance = new LinkService();
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		return instance;
	}
	
	//获取友链
	public List getLinkList() {
		List list = dao.getLink();
//		for(int i = 0; i < list.size(); i++) {
//			Link link = (Link) list.get(i);
//			System.out.println(link);
//		}
		return list;
	}
	
	//根据id获取友链
	public Link getLinkById(int id) {
		return dao.getLinkById(id);
	}
	
	//增加友链
	public boolean addLink(Link link) {
		return dao.addLink(link);
	}
	
	//更新友链
	public boolean updateLink(int link_id,Link link) {
		return dao.updateLink(link_id, link);
	}
	
	//删除友链
	public boolean deleteLink(int id) {
		return dao.deleteLink(id);
	}
}

