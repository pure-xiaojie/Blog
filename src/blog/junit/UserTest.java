package blog.junit;

import org.junit.Test;

import blog.dao.UserInterface;
import blog.daoImpl.UserInterfaceImpl;
import blog.entity.User;
import blog.service.UserService;

public class UserTest {

	@Test
	public void testLogin() throws Exception {
		// String name="myblog";
		// String password="123";
		String name = "小杰";
		String password = "123456";

		UserInterface userDao = UserInterfaceImpl.getInstance();
		User user = userDao.login(name, password);
		if (user != null) {
			System.out.println(user.getUser_id());
			System.out.println(user.getUser_name());
			System.out.println(user.getUser_password());
		} else {
			System.out.println("Login failed");
		}

	}
	
	
	@Test
	public void testRegister() {
		UserService us = UserService.getInstance();
		User user = new User();
		user.setUser_name("笃行");
		user.setUser_password("1314520");
		user.setUser_email("1952175699@qq.com");
		user.setUser_phone("15897476136");
		user.setUser_place("湖南张家界");
		user.setUser_work("还在学习");
		String msg = us.register(user);
		System.out.println(msg);
	}
	
	@Test
	public void getUser() {
		UserService us = UserService.getInstance();
		User user = us.getUser("小杰");
		System.out.println(user);
	}
	
	@Test
	public void updataUser() {
		UserService us = UserService.getInstance();
		User user = new User();
		user.setUser_name("创新");
		user.setUser_password("123");
		user.setUser_email("1952175699@qq.com");
		user.setUser_phone("15897476136");
		user.setUser_place("湖南张家界");
		user.setUser_work("还在学习");
		String msg = us.updataUser("2", user);
		System.out.println(msg);
	}
}
