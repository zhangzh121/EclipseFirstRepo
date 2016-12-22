package com.atguigu.jf.console.user.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import net.sf.json.JSONObject;

import org.apache.http.HttpRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atguigu.jf.console.user.bean.pojo.User;
import com.atguigu.jf.console.user.service.UserService;

@Controller
@RequestMapping("user")
public class UserController {

	@Autowired
	private UserService userService ;
	
	@RequestMapping(value="selectAllTable",method=RequestMethod.GET)
	@ResponseBody
	public JSONObject queryUserForm(int start,int limit){
		HashMap<Object, Object> map = new HashMap<>();
		map.put("start",start);
		map.put("limit", limit);
		JSONObject object = new JSONObject();
		List<User> list = userService.selectAllPage(map);
		int total = userService.selectUserListCount();
		object.put("items", list);
		object.put("total", total);
		return object;
	}
	
	@RequestMapping(value="selectAll",method=RequestMethod.GET)
	@ResponseBody
	public List<JSONObject> queryUsersCombox(){
		List<User> list = userService.selectAll();
		List<JSONObject> arrayList = new ArrayList<JSONObject>();
		JSONObject obj = null;
		for (User user : list) {
			obj = new JSONObject();
			obj.put("id", user.getUserId());
			obj.put("name", user.getUserName());
			arrayList.add(obj);
		}
		return arrayList;
	}
}
