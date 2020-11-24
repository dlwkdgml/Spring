package com.example.controller;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.BookVO;
import com.example.domain.Criteria;
import com.example.domain.NaverAPI;
import com.example.domain.PageMaker;
import com.example.mapper.BookMapper;

@Controller
public class NaverController {
	@Autowired
	BookMapper mapper;
	
	//도서검색
	@RequestMapping(value="book.json")
	@ResponseBody
	public String bookJson(String query){
		String apiURL="https://openapi.naver.com/v1/search/book.json";
		String result=NaverAPI.Search(apiURL,query);
		
		return result;
	}
	
	@RequestMapping("book")
	public void book(){
		
	}
	
	@Resource(name="uploadPath")//path읽어드릴때
	 String path;
	
	@RequestMapping(value="insert", method=RequestMethod.POST)
	@ResponseBody
	public void insert(BookVO vo,String fullImage){
		//이미지다운로드
		try{
			URL url=new URL(fullImage);
			InputStream in = url.openStream();
			OutputStream out=new FileOutputStream(path+"/"+vo.getImage());
			FileCopyUtils.copy(in,out);
		}catch(Exception e){
			System.out.println(e.toString());
		}
		//데이터입력
		vo.setTitle(vo.getTitle().replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", ""));
		mapper.insert(vo);
	}
	
	@RequestMapping("list")
	public void list(Model model, Criteria cri){
		cri.setPerPageNum(5);
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(100);
		model.addAttribute("pm",pm);
		model.addAttribute("list", mapper.list(cri));
	}
	
	//이미지파일 보기
	   @ResponseBody
	   @RequestMapping("display")
	   public byte[] displayFile(String fileName)throws Exception{
	      FileInputStream in=new FileInputStream(path + "/" + fileName);
	      byte[] image=IOUtils.toByteArray(in);
	      in.close();
	      return image;
	   }
}
