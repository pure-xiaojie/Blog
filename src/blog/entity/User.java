package blog.entity;

public class User {

	private int user_id;
	private String user_name;
	private String user_password;
	private String user_work;
	private String user_place;
	private String user_email;
	private String user_phone;

	public User() {
		super();
	}
	
	//注册
	public User(String user_name, String user_password, String user_work, String user_place, String user_email,
			String user_phone) {
		super();
		this.user_name = user_name;
		this.user_password = user_password;
		this.user_work = user_work;
		this.user_place = user_place;
		this.user_email = user_email;
		this.user_phone = user_phone;
	}
	
	//修改
	public User(int user_id, String user_name, String user_work, String user_place, String user_email,
			String user_phone) {
		super();
		this.user_id = user_id;
		this.user_name = user_name;
		this.user_work = user_work;
		this.user_place = user_place;
		this.user_email = user_email;
		this.user_phone = user_phone;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}

	public String getUser_work() {
		return user_work;
	}

	public void setUser_work(String user_work) {
		this.user_work = user_work;
	}

	public String getUser_place() {
		return user_place;
	}

	public void setUser_place(String user_place) {
		this.user_place = user_place;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", user_name=" + user_name + ", user_password=" + user_password
				+ ", user_work=" + user_work + ", user_place=" + user_place + ", user_email=" + user_email
				+ ", user_phone=" + user_phone + "]";
	}
	
	
}
