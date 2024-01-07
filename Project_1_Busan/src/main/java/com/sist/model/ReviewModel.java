package com.sist.model;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;
public class ReviewModel {
	
	@RequestMapping("busan/review.do")
	public String review_list(HttpServletRequest request, HttpServletResponse response){
		
		String page=request.getParameter("page");
		if(page==null) {
			page="1";
		}
        int curpage=Integer.parseInt(page);
        
        ReviewDAO dao=ReviewDAO.newInstance();
		List<ReviewVO> list=dao.reviewListData(curpage);
		int count=dao.ReviewRowCount();
		int totalpage=(int)(Math.ceil(count/10.0));
		count=count-((curpage*10)-10);
		
		final int BLOCK=5;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		
		if(endPage>totalpage) {
            endPage=totalpage;
		}
        
        request.setAttribute("curpage", curpage);
        request.setAttribute("count", count);
        request.setAttribute("totalpage", totalpage);
        request.setAttribute("startPage", startPage);
        request.setAttribute("endPage", endPage);
        request.setAttribute("list", list);
        request.setAttribute("today", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
        
		request.setAttribute("main_jsp", "../busan/review.jsp");
		return "../main/main.jsp";
	}
	
	
	@RequestMapping("busan/review_insert.do")
	public String review_insert(HttpServletRequest request, HttpServletResponse response){   
		
		request.setAttribute("main_jsp", "../busan/review_insert.jsp");
		return "../main/main.jsp";
	}
	
	
	@RequestMapping("busan/review_insert_ok.do")
	public String review_insert_ok(HttpServletRequest request, HttpServletResponse response){   
		
		try {
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		
		String score=request.getParameter("score");
		String cont=request.getParameter("score");
		String img=request.getParameter("img");
		String pwd=request.getParameter("pwd");
		
		ReviewVO vo=new ReviewVO();
		vo.setScore(Integer.parseInt(score));
		vo.setCont(cont);
		vo.setImg(img);
		vo.setPassword(pwd);
		
		ReviewDAO dao=ReviewDAO.newInstance();
		dao.reviewInsert(vo);		
		return "redirect:../busan/review.do";
	}
	
	
	@RequestMapping("busan/review_delete.do")
	public void review_delete(HttpServletRequest request, HttpServletResponse response) {
		String rno=request.getParameter("rno");
		String pwd=request.getParameter("pwd");
		ReviewDAO dao=ReviewDAO.newInstance();
		String result=dao.reviewDeleteData(Integer.parseInt(rno), pwd);
		
		try {
			PrintWriter out=response.getWriter();
			out.write(result);
		}catch(Exception ex) {}
	}
	
	
	@RequestMapping("busan/review_update.do")
	public void review_update(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
			String rno=request.getParameter("rno");
			String score=request.getParameter("score");
			String cont=request.getParameter("cont");
			String img=request.getParameter("img");
			String pwd=request.getParameter("pwd");
			
			ReviewVO vo=new ReviewVO();
			vo.setRno(Integer.parseInt(rno));
			vo.setScore(Integer.parseInt(score));
			vo.setCont(cont);
			vo.setImg(img);
			vo.setPassword(pwd);
		   
			ReviewDAO dao=ReviewDAO.newInstance();
			String res=dao.reviewUpdateData(vo);
			try {
				PrintWriter out=response.getWriter();
				out.write(res);
			}catch(Exception ex) {}
	}
	
}
