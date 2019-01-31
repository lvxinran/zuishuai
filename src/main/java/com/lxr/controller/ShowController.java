package com.lxr.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.lxr.model.Video;
import com.lxr.service.VideoService;

@Controller

public class ShowController {
	@Autowired
	private VideoService videoService;

	@RequestMapping("/main")
	public ModelAndView goMain(Integer page) {
		if (page == null) {
			page = 1;
		}
		int perPage = 3;

		ModelAndView mav = new ModelAndView();
		List<Video> listPage = videoService.getAll();
		List<Video> list = videoService.getByPage(page, perPage);
		int totalPage = 0;
		if (listPage.size() % perPage > 0) {
			totalPage = listPage.size() / perPage + 1;
		} else {
			totalPage = listPage.size() / perPage;
		}
		
		mav.addObject("list", list);
		mav.addObject("totalPage", totalPage);
		mav.setViewName("show/main");
		return mav;
	}

	@RequestMapping("/play")
	public ModelAndView play(Integer id) {
		ModelAndView mav = new ModelAndView();
		Video video = videoService.getById(id);
		mav.addObject("video", video);
		mav.setViewName("show/play");
		return mav;
	}



}
