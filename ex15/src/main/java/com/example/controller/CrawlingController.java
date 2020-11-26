package com.example.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CrawlingController {
	@RequestMapping("cgv.json")
	@ResponseBody
	public ArrayList<HashMap<String,Object>> cgvJson(){
		ArrayList<HashMap<String,Object>> array=new ArrayList<>();
		System.setProperty("webdriver.chrome.driver","d:/Spring/Spring/chromedriver.exe");
		ChromeOptions options=new ChromeOptions();
		options.addArguments("headless");
		
		WebDriver driver=new ChromeDriver(options);
		driver.get("http://www.cgv.co.kr/movies/");
		
		//더보기 버튼
		WebElement btnMore=driver.findElement(By.className("btn-more-fontbold"));
		btnMore.click();
		
		System.out.println("........................\n"+driver.getPageSource());
		
		return array;
	}
}