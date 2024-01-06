package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;
public class LikeModel {
	@RequestMapping("like/like_insert.do")
	public String like_insert(HttpServletRequest request,HttpServletResponse response) {
		
		String eno=request.getParameter("eno");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		System.out.println(id);
		System.out.println(eno);
		
		LikeVO vo=new LikeVO();
	    vo.getDvo().getId();
		vo.setEno(Integer.parseInt(eno));
		
		LikeDAO dao=LikeDAO.newInstance();
		dao.LikeInsert(vo);
		
		return "redirect:../busan/ex_detail.do?eno="+eno;
	}
	
	@RequestMapping("like/like_cancle.do")
	public String like_cancle(HttpServletRequest request,HttpServletResponse response) {
		String eno=request.getParameter("eno");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		LikeDAO dao=LikeDAO.newInstance();
		dao.LikeCancle(id, Integer.parseInt(eno));
		
		return "redirect:../busan/ex_detail.do?eno="+eno;
	}
}