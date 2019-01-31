package com.lxr.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.lxr.model.Video;
import com.lxr.model.VideoType;
import com.lxr.service.VideoService;
import com.lxr.service.VideoTypeService;

@Controller
public class TestController {
	@Autowired
	private VideoService videoService;
	@Autowired
	private VideoTypeService videoTypeService;

	private List<VideoType> listType() {
		return videoTypeService.list();
	}

	@RequestMapping("/test")
	public ModelAndView testController(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		System.out.println("session:"+session.getAttribute("managername"));
		if (session.getAttribute("managername")==null) {
			mav.setViewName("login");
			
		}else{
			List<Video> list = videoService.getAll();
			mav.addObject("list", list);
			mav.setViewName("test");	
		}		
		return mav;
	}

	@RequestMapping("/insert")
	public ModelAndView toInsert() {
		ModelAndView mav = new ModelAndView();

		mav.addObject("typeList", listType());
		mav.setViewName("insert");
		return mav;
	}

	@RequestMapping("/insertVideo")
	public String insertTo(@Param("videoName") String videoName, @Param("videoUrl") String videoUrl,
			@Param("videoHtml") String videoHtml, @Param("videoType") Integer videoType,
			@Param("videoDel") Integer videoDel, Model model) {
		System.out.println(videoType);
		Video video = new Video();
		video.setVideoName(videoName);
		video.setVideoUrl(videoUrl);
		video.setVideoHtml(videoHtml);
		video.setVideoTypeId(videoType);
		video.setVideoDel(videoDel);
		int i = videoService.insertTo(video);
		if (i > 0) {
			model.addAttribute("success", "1");
			return "success";
		} else {
			return "error";
		}
	}

	@RequestMapping("/delete")
	public String deleteRecord(@Param("id") Integer id, Model model) {
		int i = videoService.delete(id);
		if (i > 0) {
			model.addAttribute("success", "2");
			return "success";
		} else {
			return "error";
		}
	}

	// 跳转到表单
	@RequestMapping("/update")

	public String update(Integer id, Model model) {
		Video showVideo = videoService.getById(id);
		model.addAttribute("video", showVideo);
		model.addAttribute("typeList",listType());
		return "update";
	}
	@RequestMapping("/updateVideo")
	public String updateVideo(@Param("id")Integer id,@Param("videoName") String videoName, @Param("videoUrl") String videoUrl,
			@Param("videoHtml") String videoHtml, @Param("videoType") Integer videoType,
			@Param("videoDel") Integer videoDel, Model model){
		Video video = new Video();
		video.setId(id);
		video.setVideoName(videoName);
		video.setVideoUrl(videoUrl);
		video.setVideoHtml(videoHtml);
		video.setVideoTypeId(videoType);
		video.setVideoDel(videoDel);
		int i = videoService.updateByRecord(video);
		if (i>0) {
			model.addAttribute("success","3");
			return "success";
		}else{
			return "error";
		}
	}
}
