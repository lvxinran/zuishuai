package com.lxr.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lxr.mapper.VideoUserMapper;
import com.lxr.model.VideoUser;

@Service
public class VideoUserService {
	
	@Autowired
	private VideoUserMapper videoUserMapper;
	public VideoUser loginValidate(VideoUser record){
		return videoUserMapper.selectByNameAndPassword(record);
	}
	public VideoUser getById(Integer id){
		return videoUserMapper.selectByPrimaryKey(id);
	}
	public int updatePermission(Integer id){
		return videoUserMapper.updatePermissionById(id);
	}
}
