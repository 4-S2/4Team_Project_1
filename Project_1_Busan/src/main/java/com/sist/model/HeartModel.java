package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;
public class HeartModel {
	@RequestMapping("like/ex_like_insert.do")
	public String food_like_insert(HttpServletRequest request,HttpServletResponse response) {
		String eno=request.getParameter("eno");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		HeartVO vo=new HeartVO();
		
	    vo.setMvo(id);
		vo.setHno(Integer.parseInt(eno));
		
		System.out.println(id);
		System.out.println(eno);
		
		
		LikeDAO dao=LikeDAO.newInstance();
		dao.LikeInsert(vo);
		
		return "redirect:../busan/ex_detail.do?eno="+eno;
	}
	
	@RequestMapping("Like/like_cancle.do")
	public String like_cancle(HttpServletRequest request,HttpServletResponse response) {
		String eno=request.getParameter("eno");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		LikeDAO dao=LikeDAO.newInstance();
		dao.LikeCancle(id, Integer.parseInt(eno));
		
		return "redirect:../busan/ex_detail.do?eno="+eno;
	}
}