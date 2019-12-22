package blog.dao;

import blog.entity.User;
/** 
* @author  jie
* @date 创建时间：2019年12月11日 
* @version 1.0  
* @return  
*/
public interface UserInterface {

	/**
	 * 注册用户
	 * 
	 * @param User
	 * @return  -1为用户已存在，0为注册失败，大于0为注册成功
	 */
	int register(User user);

	/**
	 * 登录验证
	 * 
	 * @param username
	 * @param password
	 * @return
	 */
	User login(String username, String password);
	
	/**
	 * 读取用户信息
	 * @param userName
	 */
	User getUser(String userName);
	
	/**
	 * 修改用户信息
	 * @param User
	 * @param userName
	 */
	boolean updataUser(String userId,User user);
	
	/**
	 * 更新密码
	 * @param userName
	 * @param oldPass
	 * @param newPass
	 * @return  -1为原密码输入错误，0为修改处从，大于0为修改成功
	 */
	int updatePassword(String userName,String oldPass, String newPass);
}