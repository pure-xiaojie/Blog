package blog.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import blog.dao.LinkInterface;
import blog.db.C3P0Connection;
import blog.entity.Link;
import blog.utils.DBUtils;

/** 
* @author  jie
* @date 创建时间：2019年12月11日 
* @version 1.0  
* @return  
*/
public class LinkInterfaceImpl implements LinkInterface {

	private Connection conn;
	
	private LinkInterfaceImpl() {
		conn = C3P0Connection.getInstance().getConnection();
	}
	
	private static LinkInterface instance;
	
	public static LinkInterface getInstance() {
		if(instance == null) {
			try {
				instance = new LinkInterfaceImpl();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return instance;
	}
	
	
	@Override
	public boolean deleteLink(int link_id) {
		String sql = "DELETE FROM t_link WHERE id=" + link_id;
		int result = 0;
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			result = ps.executeUpdate();
			DBUtils.Close(ps);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return result > 0;
	}

	@Override
	public boolean addLink(Link link) {
		String sql = "INSERT  INTO t_link VALUES(null,?,?,?)";
		int result = 0;
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, link.getName());
			ps.setString(2, link.getUrl());
			ps.setString(3, link.getImage());
			result = ps.executeUpdate();
			DBUtils.Close(ps);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result > 0;
	}

	@Override
	public List getLink() {
		String sql = "SELECT * FROM t_link";
		List<Link> list = null;
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			Link link;
			list = new ArrayList();
			while(rs.next()) {
				link = new Link();
				link.setId(rs.getInt("id"));
				link.setName(rs.getString("name"));
				link.setUrl(rs.getString("url"));
				link.setImage(rs.getString("image"));
				list.add(link);
			}
			DBUtils.Close(ps);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}


	@Override
	public boolean updateLink(int link_id,Link link) {
		String sql = "UPDATE t_link set name=?,url=?,image=? WHERE id=" + link_id;
		int result = 0;
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, link.getName());
			ps.setString(2, link.getUrl());
			ps.setString(3, link.getImage());
			result = ps.executeUpdate();
			DBUtils.Close(ps);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return result > 0;
	}


	@Override
	public Link getLinkById(int id) {
		String sql = "SELECT * FROM t_link WHERE id=" + id;
		Link link = null;
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				link = new Link();
				link.setId(rs.getInt("id"));
				link.setName(rs.getString("name"));
				link.setUrl(rs.getString("url"));
				link.setImage(rs.getString("image"));
			}
			DBUtils.Close(ps);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return link;
	}

}

