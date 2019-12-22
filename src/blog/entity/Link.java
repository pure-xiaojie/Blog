package blog.entity;

/**
 * 友链实体
 */
public class Link{
    private int id;

    private String url;

    private String name;

    private String image;


    public int getId() {
        return id;
    }

    public void setId(int linkId) {
        this.id = linkId;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    
    public String toString() {
    	
    	return "name:" + this.name + "   url:" + this.url  + "   image:" + this.image;
    }
}