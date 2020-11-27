package com.example.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.GroupVO;
import com.example.domain.GuVO;
import com.example.domain.User1VO;
import com.example.domain.UserVO;
import com.example.mapper_oracle.GroupMapper;
import com.example.mapper_oracle.GuMapper;
import com.example.mapper_oracle.User1Mapper;

@Controller
public class GroupController {
	@Autowired
	User1Mapper uMapper;
	
	@Autowired
	GroupMapper gMapper;
	
	@Autowired
	GuMapper guMapper;
	
	@RequestMapping("gu")
	public void gu(){
		
	}
	
	@RequestMapping("guget")
	@ResponseBody
	public List<UserVO> guget(HttpSession session){
		String gcode = (String) session.getAttribute("gcode");
		System.out.println(gcode);
		return gMapper.guget(gcode);
	}
	
	@RequestMapping("mygroup")
	@ResponseBody
	public List<GuVO> mygroup(HttpSession session){
		
		String id = (String) session.getAttribute("id");
		System.out.println(id);
		return gMapper.mygroup(id);
		
	}
	
	
	@RequestMapping("makeGroup")
	public void makeGroup(){}
	
	
	@RequestMapping(value="makeGroup",method=RequestMethod.POST)
	public void makeGroupPost(GroupVO vo){
		System.out.println(vo);
		gMapper.insert(vo);
	}
	
	@RequestMapping("addMember")
	public void addMember(){}
	
	
	@RequestMapping("searchGroupMember")
	@ResponseBody
	public List<User1VO> list(String query){
		return uMapper.list(query);
	}
	
	   @RequestMapping("addMembers")
	   @ResponseBody
	   public void addMembers(GuVO vo){
	      guMapper.insert(vo);
	   }
	
}
