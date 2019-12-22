package blog.dao;

import java.util.List;
/** 
* @author  jie
* @date 创建时间：2019年12月11日 
* @version 1.0  
* @return  
*/
public interface TagInterface {
	/**
	 * 新的标签
	 * 
	 * @param id
	 * @param tag
	 * @return
	 */
	boolean addTag(int id, String tag);

	/**
	 * 删除标签
	 * 
	 * @param id
	 * @param tag
	 * @return
	 */
	boolean deleteTag(int id, String tag);

	/**
	 * 获取所有的标签 不含重复
	 * 
	 * @return
	 */
	List getAllTag();

	/**
	 * 获取所有的标签,含重复
	 * 
	 * @return
	 */
	List getAllTags();
	
	/**
	 * 更新标签
	 * 
	 * @param old_tag
	 * @param new_tag
	 * @return
	 */
	boolean updateTag(int id ,String old_tag, String new_tag);

	/**
	 * 通过列属性获取标签
	 * 
	 * @param column
	 * @param value
	 * @return
	 */
	List getTagByColumn(String column, String value);

}