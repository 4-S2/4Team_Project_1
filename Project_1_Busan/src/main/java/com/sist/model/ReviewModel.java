package com.sist.model;

import java.io.*;
import java.text.*;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;
public class ReviewModel {
	
	@RequestMapping("busan/review.do")
	public String review_list(HttpServletRequest request, HttpServletResponse response){
		
		//1. 페이지 받기
		String page=request.getParameter("page");
		
		if(page==null) {
			page="1";
		}
        int curpage=Integer.parseInt(page);
        
        // 2. 데이터베이스 연결
        ReviewDAO dao=ReviewDAO.newInstance();
		List<ReviewVO> list=dao.reviewListData(curpage);
		
		int count=dao.ReviewRowCount();
		int totalpage=(int)(Math.ceil(count/10.0));
		count=count-((curpage*10)-10);
		
		/*
		 * final int BLOCK=5; int startPage=((curpage-1)/BLOCK*BLOCK)+1; int
		 * endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		 * 
		 * if(endPage>totalpage) { endPage=totalpage; }
		 */
        request.setAttribute("curpage", curpage);
        request.setAttribute("count", count);
        request.setAttribute("totalpage", totalpage);
        request.setAttribute("list", list);
        request.setAttribute("today", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));

		request.setAttribute("main_jsp", "../busan/review.jsp");
		return "../main/main.jsp";
	}
	
	
	@RequestMapping("busan/review_detail.do")
	   public String board_detail(HttpServletRequest request, HttpServletResponse response) {
		   String rno=request.getParameter("rno");
		   ReviewDAO dao=ReviewDAO.newInstance();
		   // 오라클에서 데이터 읽기
		   ReviewVO vo=dao.reviewDetailData(Integer.parseInt(rno));
		   request.setAttribute("vo", vo);
		   request.setAttribute("rno", rno);
		   // => 댓글 목록 
		   request.setAttribute("main_jsp", "../board/review_detail.jsp");
		   return "../main/main.jsp";
	   }
	
	
	// 추가
	@RequestMapping("busan/review_insert.do")
	public String review_insert(HttpServletRequest request, HttpServletResponse response){   
		
		request.setAttribute("main_jsp", "../busan/review_insert.jsp");
		return "../busan/review_insert.jsp";
	}
	
	@RequestMapping("busan/review_insert_ok.do")
	public String review_insert_ok(HttpServletRequest request, HttpServletResponse response){   
		
		try {
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		String rno=request.getParameter("rno");
		String score=request.getParameter("score");
		String cateno=request.getParameter("cateno");
		String id=request.getParameter("id");
		String cont=request.getParameter("cont");
		String img=request.getParameter("img");
		String password=request.getParameter("password");
		
		ReviewVO vo=new ReviewVO();
		vo.setRno(Integer.parseInt(rno));
		vo.setScore(Integer.parseInt(score));
		vo.setCateno(Integer.parseInt(cateno));
		vo.setId(id);
		vo.setCont(cont);
		vo.setImg(img);
		vo.setPassword(password);
		
		// 데이터베이스 연결 
		ReviewDAO dao=ReviewDAO.newInstance();
		dao.reviewInsert(vo);		
		
		return "redirect:../busan/review.do";
	}
	
	// 삭제
	@RequestMapping("busan/review_delete_ok.do")
	public void review_delete(HttpServletRequest request, HttpServletResponse response) {
		String rno=request.getParameter("rno");
		String password=request.getParameter("password");
		ReviewDAO dao=ReviewDAO.newInstance();
		String result=dao.reviewDelete(Integer.parseInt(rno), password);
		try {
			PrintWriter out=response.getWriter();
			out.write(result);
		}catch(Exception ex) {}
	}
	
	// 수정
	@RequestMapping("busan/review_update.do")
	public String review_update(HttpServletRequest request, HttpServletResponse response) {
		
		String rno=request.getParameter("rno");
		ReviewDAO dao=ReviewDAO.newInstance();
		ReviewVO vo=new ReviewVO();
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../busan/review_update.jsp");
		return "../busan/review_update.jsp";
	}
	
	@RequestMapping("busan/review_update_ok.do")
	public void review_update_ok(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		String rno=request.getParameter("rno");
		String score=request.getParameter("score");
		String cont=request.getParameter("cont");
		String img=request.getParameter("img");
		String password=request.getParameter("password");
		
		ReviewVO vo=new ReviewVO();
		vo.setRno(Integer.parseInt(rno));
		vo.setScore(Integer.parseInt(score));
		vo.setCont(cont);
		vo.setImg(img);
		vo.setPassword(password);
	   
		ReviewDAO dao=ReviewDAO.newInstance();
		String res=dao.reviewUpdate(vo);
		try {
			PrintWriter out=response.getWriter();
			out.write(res);
		} catch(Exception ex) {}
	}
	
}