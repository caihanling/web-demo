package zx.soft.video.Impl;

import org.apache.ibatis.session.SqlSession;

import zx.soft.video.dao.UserMapper;
import zx.soft.video.model.Users;
import zx.soft.video.util.MybatisUtils;

public class UserDao {
	
	/**
	 * login
	 */
	public Users login(Users users){
		
		try(SqlSession session = MybatisUtils.getSessionFactory().openSession()) {
			UserMapper mapper = session.getMapper(UserMapper.class);
			if(mapper.login(users) == null){
				return null;
			}else{
				return users;
			}
		}
	}

}
