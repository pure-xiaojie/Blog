package blog.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import blog.dao.ArticleInterface;
import blog.dao.TagInterface;
import blog.db.C3P0Connection;
import blog.entity.Tag;
import blog.utils.DBUtils;

/**
 * 文章的标签类
 */
public class TagInterfaceImpl implements TagInterface {

	private Connection conn;

	private static TagInterface instance;

	private TagInterfaceImpl() {
		conn = C3P0Connection.getInstance().getConnection();
	}

	public static final TagInterface getInstance() {
		if (instance == null) {
			try {
				instance = new TagInterfaceImpl();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return instance;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see blog.daoImpl.TagDao#addTag(int, java.lang.String)
	 */
	@Override
	public boolean addTag(int id, String tag) {

		String sql = "insert into t_tag values(?,?)";
		int result = 0;
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ps.setString(2, tag);
			result = ps.executeUpdate();
			DBUtils.Close(ps);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result != 0;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see blog.daoImpl.TagDao#deleteTag(int, java.lang.String)
	 */
	@Override
	public boolean deleteTag(int id, String tag) {

		String sql = "delete from t_tag where id=? and tag=?";
		int result = 0;
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ps.setString(2, tag);
			result = ps.executeUpdate();
			DBUtils.Close(ps);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result != 0;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see blog.daoImpl.TagDao#getAllTag()
	 */
	@Override
	public List getAllTag() {

		String sql = "SELECT  distinct(tag)  FROM t_tag";
		List<Tag> list = null;
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			list = new ArrayList();
			Tag tag;
			while (rs.next()) {
				tag = new Tag();
				tag.setTag(rs.getString(1));
				// 缺省标签对象的id
				tag.setId(0);
				list.add(tag);
			}
			DBUtils.Close(ps, rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	/*
	 * (non-Javadoc)
	 * 
	 * @see blog.daoImpl.TagDao#getAllTag()
	 */
	@Override
	public List getAllTags() {

		String sql = "SELECT  *  FROM t_tag";
		List<Tag> list = null;
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			list = new ArrayList();
			Tag tag;
			while (rs.next()) {
				tag = new Tag();
				tag.setTag(rs.getString("tag"));
				tag.setId(rs.getInt("id"));
				list.add(tag);
			}
			DBUtils.Close(ps, rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see blog.daoImpl.TagDao#updateTag(java.lang.String, java.lang.String)
	 */
	@Override
	public boolean updateTag(int id,String old_tag, String new_tag) {

		String sql = "update t_tag set tag=? where id=? and tag=?";
		int result = 0;
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, new_tag);
			ps.setInt(2,id);
			ps.setString(3, old_tag);
			result = ps.executeUpdate();
			DBUtils.Close(ps);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result != 0;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see blog.daoImpl.TagDao#getTagByColumn(java.lang.String, java.lang.String)
	 */
	@Override
	public List getTagByColumn(String column, String value) {

		String sql = "select * from t_tag where " + column + "=?";
		List list = null;
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, value);
			ResultSet rs = ps.executeQuery();
			list = new ArrayList();
			Tag tag;
			while (rs.next()) {
				tag = new Tag();
				tag.setId(rs.getInt("id"));
				tag.setTag(rs.getString("tag"));
				list.add(tag);
			}
			DBUtils.Close(ps, rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
