package blog.service;/** 
* @author  jie
* @date 创建时间：2019年12月18日 
* @version 1.0  
* @return  
*/

import blog.dao.UserInterface;
import blog.daoImpl.UserInterfaceImpl;
import blog.entity.User;

public class UserService {
	private UserInterface dao;
	private static UserService instance;
	
	public UserService(){
		dao = UserInterfaceImpl.getInstance();
	}
	
	public static final UserService getInstance() {
		if(instance == null) {
			try {
				instance = new UserService();
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		return instance;
	}
	
	//注册
	public String register(User user) {
		String msg = null;
		int res = dao.register(user);
		if(res == -1)
			msg="该用户已存在";
		else if(res == 0)
			msg="注册失败";
		else
			msg="注册成功";
		return msg;
	}
	
	//登录
	public User login(String userName, String passWod) {
		return dao.login(userName, passWod);
	}
	
	//获取某个用户
	public User getUser(String name) {
		return dao.getUser(name);
	}
	
	//修改个人信息
	public String updataUser(String id, User user) {
		String msg = null;
		boolean flag= dao.updataUser(id, user);
		if(flag) {
			msg = "用户信息修改成功！";
		}else {
			msg = "用户信息修改失败! ";
		}
		return msg;
	}
	
	//修改密码
	public String updataPassword(String userNmae, String oldPass, String newPass) {
		String msg = null;
		int flag= dao.updatePassword(userNmae, oldPass, newPass);
		if(flag > 0) {
			msg = "1密码修改成功！";
		}else if(flag == -10){
			msg = "9原密码输入错误! ";
		}else
			msg = "0密码修改失败";
		return msg;
	}
}

