package com.example.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.example.domain.UserVO;
import com.example.mapper_oracle.UserMapper;

@RunWith(SpringJUnit4ClassRunner.class) //���� SpringJUnit4ClassRunner.class import�Ѵ�.
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})

public class OracleTest {
	@Autowired
	private UserMapper mapper;
	
	@Test
	public void getTime() { mapper.getTime(); }
	
	@Test
	public void read(){
		mapper.read("cds301");
	}
	
	
}
