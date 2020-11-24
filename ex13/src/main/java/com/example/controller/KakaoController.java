package com.example.controller;

import java.net.URL;
import java.net.URLEncoder;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.KakaoAPI;

@Controller
public class KakaoController {

	//지역API
	@RequestMapping(value="local.json") //데이터생성
	@ResponseBody
	public String localJson(String query) throws Exception{
		String text=URLEncoder.encode(query,"UTF-8"); //쿼리를 한글로 하니까 깨져서 UTF8로 바꿔줌
		String apiURL="https://dapi.kakao.com/v2/local/search/keyword.json?query="+text;//개발자센터에서 로컬>키워드검색 샘플에서의 주소값
		String result = KakaoAPI.search(apiURL);
		return result;
	}
	
	@RequestMapping("local") //출력페이지
	public String local(){
		return "local";
	}
}
