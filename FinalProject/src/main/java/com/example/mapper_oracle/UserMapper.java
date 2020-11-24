package com.example.mapper_oracle;

import java.util.List;

import com.example.domain.UserVO;

public interface UserMapper {
	public List<UserVO> list();
	public UserVO read(String uid);
	public void insert(UserVO vo);
}
