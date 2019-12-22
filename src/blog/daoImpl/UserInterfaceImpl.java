package blog.daoImpl;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;

import blog.dao.UserInterface;
import blog.db.C3P0Connection;
import blog.entity.User;
import blog.utils.DBUtils;

/**
 * 用户服务的具体实现类
 *
 */
public class UserInterfaceImpl implements UserInterface {

	private Connection conn;

	private UserInterfaceImpl() {
		conn = C3P0Connection.getInstance().getConnection();
	}

	private static UserInterface instance;

	public static final UserInterface getInstance() {
		if (instance == null) {
			try {
				instance = new UserInterfaceImpl();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return instance;
	}

	
	@Override
	public int register(User user) {
		int result = 0;
		String userName = user.getUser_name();
		String sql1 = "SELECT * FROM t_user WHERE user_name=?";
		String sql2 = "INSERT  INTO t_user VALUES(null,?,?,?,?,?,?)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql1);
			ps.setString(1, user.getUser_name());
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				//System.out.println("该用户已存在");
				result = -1;
				DBUtils.Close(ps, rs);
			}
			else {
				
				PreparedStatement ps2 = conn.prepareStatement(sql2);
				ps2.setString(1, user.getUser_name());
				ps2.setString(2, user.getUser_password());
				ps2.setString(3, user.getUser_work());
				ps2.setString(4, user.getUser_place());
				ps2.setString(5, user.getUser_email());
				ps2.setString(6, user.getUser_phone());
				result = ps2.executeUpdate();
				DBUtils.Close(ps2);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}

	
	@Override
	public User login(String username, String password) {

		User user = null;

		String sql = "select * from t_user where user_name=? and user_password=?";
		PreparedStatement ps = null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			// bean导入
			if (rs.next()) {
				Map<String, String> map = new HashMap<String, String>();
				user = new User();
				map.put("user_name", rs.getString("user_name"));
				map.put("user_password", rs.getString("user_password"));
				map.put("user_id", rs.getString("user_id"));
				try {
					BeanUtils.populate(user, map);
				} catch (Exception e) {
					throw new RuntimeException();
				}
			}
			DBUtils.Close(ps, rs);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("注册出错");
			e.printStackTrace();
		}
		return user;
	}


	@Override
	public User getUser(String suername) {
		User user = null;

		String sql = "select * from t_user where user_name=?";
		PreparedStatement ps = null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, suername);
			ResultSet rs = ps.executeQuery();
			// bean导入
			if (rs.next()) {
				Map<String, String> map = new HashMap<String, String>();
				user = new User();
				map.put("user_name", rs.getString("user_name"));
				map.put("user_password", rs.getString("user_password"));
				map.put("user_id", rs.getString("user_id"));
				map.put("user_place", rs.getString("user_place"));
				map.put("user_work", rs.getString("user_work"));
				map.put("user_email", rs.getString("user_email"));
				map.put("user_phone", rs.getString("user_phone"));
				try {
					BeanUtils.populate(user, map);
				} catch (Exception e) {
					System.out.println("获取出错");
					throw new RuntimeException();
				}
			}
			DBUtils.Close(ps, rs);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}

	/**
	 * 修改用户信息
	 */
	@Override
	public boolean updataUser(String userId, User user) {
		String sql = "UPDATE t_user set user_name=?,user_work=?,user_place=?,user_email=?,user_phone=? WHERE user_id=" + userId;
		int result = 0;
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			//System.out.println(user);
			ps.setString(1, user.getUser_name());
			ps.setString(2, user.getUser_work());
			ps.setString(3, user.getUser_place());
			ps.setString(4, user.getUser_email());
			ps.setString(5, user.getUser_phone());
			result = ps.executeUpdate();
			DBUtils.Close(ps);
		} catch (Exception e) {
			System.out.println("更新出错");
			// TODO: handle exception
		}
		return result > 0;
		
	}


	@Override
	public int updatePassword(String userName, String oldPass, String newPass) {
		int result = 0;
		String sql = "select user_password from t_user where user_name=?";
		PreparedStatement ps = null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, userName);
			ResultSet rs = ps.executeQuery();
			
			// bean导入
			if (rs.next()) {
				String password = rs.getString("user_password");
				if(password.equals(oldPass)) {
					String sql2 = "UPDATE t_user set user_password=? WHERE user_name=?";
					PreparedStatement ps2 = conn.prepareStatement(sql2);
					ps2.setString(1, newPass);
					ps2.setString(2, userName);
					result = ps2.executeUpdate();
					DBUtils.Close(ps2);
				} else {
					result = -10;
					System.out.println("原密码输入错误！");
				}
			}
			DBUtils.Close(ps,rs);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return result;
	}
}
