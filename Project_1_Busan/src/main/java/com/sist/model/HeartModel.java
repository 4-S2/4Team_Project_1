package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;
public class HeartModel {
	@RequestMapping("like/ex_like_insert.do")
	public String ex_like_insert(HttpServletRequest request,HttpServletResponse response) {
		String eno=request.getParameter("eno");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		HeartVO vo=new HeartVO();
		
	    vo.getMvo().setId(id);
		vo.getEvo().setEno(0);
		
		System.out.println(id);
		System.out.println(eno);
		
		
		HeartDAO dao=HeartDAO.newInstance();
		dao.HeartInsert(vo);
		
		return "redirect:../busan/ex_detail.do?eno="+eno;
	}
	
	@RequestMapping("like/like_cancle.do")
	public String ex_like_cancle(HttpServletRequest request,HttpServletResponse response) {
		String eno=request.getParameter("eno");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		HeartDAO dao=HeartDAO.newInstance();
		dao.HeartCancle(id, Integer.parseInt(eno));
		
		return "redirect:../busan/ex_detail.do?eno="+eno;
	}
}