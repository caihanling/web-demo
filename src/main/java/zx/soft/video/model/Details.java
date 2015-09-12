package zx.soft.video.model;

public class Details {

	private int did;
	private String image;
	private String describe;
	private int times;
	private String uname;
	
	
	public int getDid() {
		return did;
	}
	public void setDid(int did) {
		this.did = did;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getDescribe() {
		return describe;
	}
	public void setDescribe(String describe) {
		this.describe = describe;
	}
	public int getTimes() {
		return times;
	}
	public void setTimes(int times) {
		this.times = times;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	
	
	@Override
	public String toString() {
		return "Details [did=" + did + ", image=" + image + ", describe="
				+ describe + ", times=" + times + ", uname=" + uname + "]";
	}
	
	
	
	
}
