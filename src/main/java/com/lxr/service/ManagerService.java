package com.lxr.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lxr.mapper.ManagerMapper;
import com.lxr.model.Manager;

@Service
public class ManagerService {
	@Autowired
	private ManagerMapper managerMapper;
	
	public Manager login(Manager record){
		return managerMapper.selectLogin(record);
	}
}
