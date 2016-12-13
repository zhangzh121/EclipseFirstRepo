package com.atguigu.jf.console.baseapi.user;

import java.util.HashMap;
import java.util.List;

import com.atguigu.jf.console.user.bean.pojo.User;

public interface UserMapper {
	
		int deleteByPrimaryKey(Integer userId);

	    int insert(User record);

	    User selectByPrimaryKey(Integer userId);

	    List<User> selectAll();

	    int updateByPrimaryKey(User record);

		List<User> selectAllPage(HashMap<Object, Object> map);
		
		int selectUserListCount();

}
