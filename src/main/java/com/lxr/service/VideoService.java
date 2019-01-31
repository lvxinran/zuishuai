package com.lxr.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lxr.mapper.VideoMapper;
import com.lxr.model.Video;

@Service
public class VideoService {
	@Autowired
	private VideoMapper videoMapper;
	
	public List<Video> getAll(){
		return videoMapper.list();
	}
	public int insertTo(Video video){
		return videoMapper.insert(video);
	}
	public int delete(int id){
		return videoMapper.deleteByPrimaryKey(id);
	}
	public Video getById(Integer id){
		return videoMapper.selectByPrimaryKey(id);
	}
	public int updateByRecord(Video video){
		return videoMapper.updateByPrimaryKeySelective(video);
	}
	//1->0,3
	//2->3,3
	public List<Video> getByPage(int start,int perPage){
		int startPage = (start-1)*3;
		return videoMapper.listByPage(startPage, perPage);
	}
}
