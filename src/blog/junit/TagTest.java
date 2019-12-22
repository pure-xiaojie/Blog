package blog.junit;

import java.util.Iterator;
import java.util.List;

import org.junit.Test;

import blog.dao.TagInterface;
import blog.daoImpl.TagInterfaceImpl;
import blog.entity.Tag;

public class TagTest {

	// @Test
	public void testdeleteTag() {
		TagInterface dao = TagInterfaceImpl.getInstance();
		boolean result = dao.deleteTag(1, "java");
		System.out.println(result);
	}

	@Test
	public void testAddTag() {

		TagInterface dao = TagInterfaceImpl.getInstance();
		boolean result = dao.addTag(1, "中文啊");
		System.out.println(result);
	}

	// @Test
	public void testGetAllTag() {
		TagInterface dao = TagInterfaceImpl.getInstance();
		List list = dao.getAllTag();
		Iterator it = list.iterator();

		while (it.hasNext()) {
			Tag tag = (Tag) it.next();
			System.out.println(tag.toString());
		}
	}

}
