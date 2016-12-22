package com.atguigu.jf.console.user.service;

import java.util.HashMap;
import java.util.List;

import com.atguigu.jf.console.user.bean.pojo.User;

public interface UserService {

	public List<User> selectAll();

	public List<User> selectAllPage(HashMap<Object, Object> map);
	
	public int selectUserListCount();
}
