package blog.dao;

import java.util.List;

import blog.entity.Link;

/** 
* @author  jie
* @date 创建时间：2019年12月11日 
* @version 1.0  
* @return  
*/
public interface LinkInterface {
	/**
	 * 删除友链
	 * @param link_id
	 * @return
	 */
	boolean deleteLink(int link_id);

	/**
	 * 增加友链
	 * @param Link
	 * @return
	 */
	boolean addLink(Link link);

	/**
	 * 修改友链
	 * @param Link
	 * @return
	 */
	boolean updateLink(int link_id,Link link);
	
	
	/**
	 * 获取友链列表
	 * @return
	 */
	List getLink();

	/**
	 * 获取友链
	 * @param id
	 * @return
	 */
	Link getLinkById(int id);
}

