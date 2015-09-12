package zx.soft.video.Impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import zx.soft.video.dao.DetailMapper;
import zx.soft.video.model.Details;
import zx.soft.video.util.MybatisUtils;

public class DetailDao {
	
	public List<Details> getDetails(){
		try(SqlSession session = MybatisUtils.getSessionFactory().openSession()) {
			DetailMapper mapper = session.getMapper(DetailMapper.class);
			return mapper.getDetails();
		}
	}
	
	/**
	 * 更新描述
	 * @param details
	 */
	public void updateDescribe(Details details){
		try(SqlSession session = MybatisUtils.getSessionFactory().openSession()) {
			DetailMapper mapper = session.getMapper(DetailMapper.class);
			mapper.updateDescribe(details);
		}
	}
	
	/**
	 * 删除一条记录
	 */
	public void deleteDetail(int did){
		try(SqlSession session = MybatisUtils.getSessionFactory().openSession()) {
			DetailMapper mapper = session.getMapper(DetailMapper.class);
			mapper.deleteDetail(did);
		}
	}

}
