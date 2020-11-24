package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.domain.CirclesVO;
import com.example.mapper.CirclesMapper;


@Controller
public class CirclesController {
	@Autowired
	CirclesMapper cMapper;
	
	@RequestMapping("동아리 만드는 홈페이지")
	public void signup(){
		
	}
	
	@RequestMapping(value = "동아리 만들기 버튼", method=RequestMethod.POST)
	public void insert(CirclesVO vo){
		
	}
	
}
