package com.example.mapper_oracle;

import com.example.domain.CirclesVO;

public interface CirclesMapper {
	public String getTime();
	
	public  void insert(CirclesVO vo);

	public void read(String string);
}
