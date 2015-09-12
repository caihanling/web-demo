package zx.soft.video.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import zx.soft.video.model.Users;

public interface UserMapper {
	
	@Insert("INSERT INTO  `Users` (  `uname` ,  `upass` ) VALUES (#{uname},  #{upass})")
	public void addUser(Users users);
	
	
	/**
	 * login
	 */
	@Select("SELECT * FROM `Users` WHERE uname = #{uname} and upass = #{upass}")
	public Users login(Users users);

}
