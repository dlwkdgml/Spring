package com.example.controller;

import java.io.File;
import java.nio.file.Files;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.util.WebUtils;

import com.example.domain.UserVO;
import com.example.mapper_oracle.UserMapper;

@Controller
public class UserController {
	@Autowired
	UserMapper mapper;
	
	@Resource(name="uploadPath")
	String path;
	
	@RequestMapping("signup")
	public void signup(){
		
	}
	
	@RequestMapping(value = "signup", method=RequestMethod.POST)
	@ResponseBody
	public String signup(UserVO vo,MultipartHttpServletRequest multi)throws Exception{
		//대표 이미지 하나 업로드
				MultipartFile file=multi.getFile("pic");
				
				if(!file.isEmpty()){
					UUID uid=UUID.randomUUID();
					String savedName=uid.toString() + "_" + file.getOriginalFilename();
					File target = new File(path,savedName);
					FileCopyUtils.copy(file.getBytes(),target);
					vo.setPic(savedName);
				}
	System.out.println("성공");
		mapper.signup(vo);
		return "redirect:home";
	}
	
	@RequestMapping("login")
	public void login(){
		
	}
	
	@ResponseBody
	@RequestMapping(value="login",method=RequestMethod.POST)
	public int loginPost(UserVO vo,HttpSession session , boolean chkLogin, HttpServletResponse response){
		UserVO resultVO= mapper.read(vo.getId());
		if(resultVO != null){
			if(resultVO.getPw().equals(vo.getPw())){
				session.setAttribute("id", vo.getId());
				if(chkLogin){
					Cookie cookie=new Cookie("id" , vo.getId());
					cookie.setPath("/");
					cookie.setMaxAge(60 * 60 * 24 * 7);
					response.addCookie(cookie);
				}
				return 1;//로그인 성공
			}else{
				return 2;//비번이 틀렸을떄
			}
		}
		return 0;// 아이디가 없을떄
	}
	
	//이미지 출력
		@RequestMapping("display") //display?
		@ResponseBody
		public ResponseEntity<byte[]> display(String fileName)throws Exception{
		    ResponseEntity<byte[]> result=null;
		    //display fileName이 있는 경우
		    if(!fileName.equals("")) {
		        File file=new File(path + File.separator + fileName);
		        HttpHeaders header=new HttpHeaders();
		        header.add("Content-Type", Files.probeContentType(file.toPath()));
		        result=new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		    }
		    return result;
		}
	
	
	@RequestMapping("logout")
	public String logout(HttpSession session, HttpServletRequest request ,HttpServletResponse response){
		session.invalidate();
		//쿠키삭제
				Cookie cookie=WebUtils.getCookie(request, "id"); 
				if(cookie != null){
					cookie.setPath("/");
					cookie.setMaxAge(0);
					response.addCookie(cookie);
				}
		return "redirect:/";
	}
}
