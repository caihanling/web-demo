package zx.soft.video.model;

public class Users {
	
	private int uid;
	private String uname;
	private String upass;
	private int state;
	
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUpass() {
		return upass;
	}
	public void setUpass(String upass) {
		this.upass = upass;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	
	@Override
	public String toString() {
		return "Users [uid=" + uid + ", uname=" + uname + ", upass=" + upass + ", state=" + state + "]";
	}
	
	

}
