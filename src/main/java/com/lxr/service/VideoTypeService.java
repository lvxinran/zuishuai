package com.lxr.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lxr.mapper.VideoTypeMapper;
import com.lxr.model.VideoType;

@Service
public class VideoTypeService {
	@Autowired
	private VideoTypeMapper videoTypeMapper;
	public List<VideoType> list(){
		return videoTypeMapper.listType();
	}
	
}
