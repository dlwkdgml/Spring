package com.example.mapper_oracle;

import com.example.domain.UserVO;

public interface UserMapper {
	public String getTime();
	
	public void signup(UserVO vo);
	
	public UserVO read(String id);
}
