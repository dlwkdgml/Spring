package com.example.mapper_oracle;

import java.util.List;

import com.example.domain.GroupVO;
import com.example.domain.GuVO;
import com.example.domain.UserVO;

public interface GroupMapper {
	
	public void insert(GroupVO vo);
	
	public GroupVO list();
	
	public List<GuVO> mygroup(String id);
	
	public List<UserVO> guget(String gcode);
	
}
