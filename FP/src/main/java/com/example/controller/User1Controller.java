package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.GroupVO;
import com.example.domain.User1VO;
import com.example.mapper_oracle.GroupMapper;
import com.example.mapper_oracle.User1Mapper;

@Controller
public class User1Controller {
	@Autowired
	User1Mapper uMapper;
	
	@Autowired
	GroupMapper gMapper;
	
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
	
}
