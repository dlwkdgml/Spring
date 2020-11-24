package com.example.controller;

import javax.servlet.http.Cookie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.domain.UserVO;
import com.example.mapper.UserMapper;

@Controller
public class UserController {
	
	@Autowired
	UserMapper mapper;
	
	@RequestMapping("signup")
	public void signup(){
		
	}
	
	@RequestMapping(value = "signup", method=RequestMethod.POST)
	public void insert(UserVO vo){
		mapper.insert(vo);
	}
	
	@RequestMapping("login")
	public int login(UserVO vo)	{
//		UserVO resultVO= mapper.read(vo.getId());
//		if(resultVO != null){
//			if(resultVO.getPw().equals(vo.getPw())){
//				}
//				return 1;//로그인 성공
//			}else{
//				return 2;//비번이 틀렸을떄
//			}
//		}

		return 0;// 아이디가 없을떄
	
	
	}
	
}
