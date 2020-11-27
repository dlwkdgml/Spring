package com.example.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.CirclesVO;
import com.example.mapper_oracle.CirclesMapper;


@Controller
public class CirclesController {
	@Autowired
	CirclesMapper cMapper;
	
	@RequestMapping("createClub")
	public void signup(){
		
	}
	
	@RequestMapping(value = "insert", method=RequestMethod.POST)
	@ResponseBody
	public void insert(CirclesVO vo,HttpSession session , HttpServletResponse response){
		String id = (String) session.getAttribute("id");
		vo.setC_pid(id);
		System.out.println(vo.toString());
		cMapper.insert(vo);
	}
	
}
