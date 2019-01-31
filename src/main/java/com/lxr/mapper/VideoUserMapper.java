package com.lxr.mapper;

import com.lxr.model.VideoUser;

public interface VideoUserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(VideoUser record);

    int insertSelective(VideoUser record);

    VideoUser selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(VideoUser record);

    int updateByPrimaryKey(VideoUser record);
    
    int updatePermissionById(Integer id);
    
    VideoUser selectByNameAndPassword(VideoUser record);
}