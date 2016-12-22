package com.atguigu.jf.console.user.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.jf.console.baseapi.user.UserMapper;
import com.atguigu.jf.console.user.bean.pojo.User;
import com.atguigu.jf.console.user.service.UserService;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserMapper userMapper;

	@Override
	public List<User> selectAll() {
		return userMapper.selectAll();
	}

	@Override
	public List<User> selectAllPage(HashMap<Object, Object> map) {
		return userMapper.selectAllPage(map);
	}

	@Override
	public int selectUserListCount() {
		return userMapper.selectUserListCount();
	}
}
