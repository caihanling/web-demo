package zx.soft.video.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import zx.soft.video.model.Details;

public interface DetailMapper {
	
	@Select("select * from Detail")
	public List<Details> getDetails();
	
	/**
	 * 更新描述
	 * @param details
	 */
	@Update("UPDATE  `Detail` SET  `describe` = #{describe} WHERE did = #{did}")
	public void updateDescribe(Details details);

	/**
	 * 删除描述
	 */
	@Delete("DELETE FROM `Detail` WHERE did = #{did}")
	public void deleteDetail(int did);
}
