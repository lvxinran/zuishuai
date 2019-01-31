package com.lxr.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lxr.model.Video;

public interface VideoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Video record);

    int insertSelective(Video record);

    Video selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Video record);

    int updateByPrimaryKey(Video record);
    
    List<Video> list();
    
    List<Video> listByPage(@Param("pageStart")int pageStart,@Param("perPage")int perPage);
}