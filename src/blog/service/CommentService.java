package blog.service;

import java.util.List;

import blog.dao.CommentInterface;
import blog.daoImpl.CommentInterfaceImpl;
import blog.entity.Comment;

public class CommentService {

	private CommentInterface dao;

	private static CommentService instance;

	private CommentService() {
		dao = CommentInterfaceImpl.getInstance();
	}

	public static final CommentService getInstance() {
		if (instance == null) {
			try {
				instance = new CommentService();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return instance;
	}

	//根据文章id获取评论
	public List loadComment(int article_id) {
		return dao.getComment(article_id);
	}

	//获取所有评论
	public List getComment() {
		return dao.getComments();
	}
	
	//添加评论
	public boolean addComment(Comment comment) {
		return dao.addComment(comment);
	}

	//点赞
	public int star_diss(int id, int star_or_diss) {
		return dao.star_diss(id, star_or_diss);
	}

	//删除评论
	public boolean deleteComment(int id) {
		return dao.deleteComment(id);
	}
}
