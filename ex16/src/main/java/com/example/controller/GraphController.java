package com.example.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.mapper_oracle.GraphMapper;

@Controller
public class GraphController {
	@Autowired
	GraphMapper mapper;
	
	@RequestMapping(value="/cavg.json")
	@ResponseBody
	public List<HashMap<String, Object>> cavg(){
		List<HashMap<String, Object>> array=mapper.cavg();
		
		return array;
	}
	
}
