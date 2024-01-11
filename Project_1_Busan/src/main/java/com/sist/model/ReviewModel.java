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
		String gno=request.getParameter("gno");
		if(page==null) {
			page="1";
		}
        int curpage=Integer.parseInt(page);
        
        // 2. 데이터베이스 연결
        ReviewDAO dao=ReviewDAO.newInstance();
		List<ReviewVO> rlist=dao.reviewListData(curpage);
		
		int count=dao.ReviewRowCount();
		int totalpage=(int)(Math.ceil(count/10.0));
		count=count-((curpage*10)-10);
		
		/*
		 * final int BLOCK=5; int startPage=((curpage-1)/BLOCK*BLOCK)+1; int
		 * endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		 * 
		 * if(endPage>totalpage) {endPage=totalpage;}
		 */
        request.setAttribute("curpage", curpage);
        request.setAttribute("count", count);
        request.setAttribute("totalpage", totalpage);
        request.setAttribute("rlist", rlist);
        request.setAttribute("gno", gno);
        request.setAttribute("today", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
        request.setAttribute("main_jsp", "../busan/review.jsp");
		return "../busan/review.jsp";
	}
	
	 
	@RequestMapping("busan/review_detail.do")
    public String board_detail(HttpServletRequest request, HttpServletResponse response) {
		String gno=request.getParameter("gno");
		String rno=request.getParameter("rno");
		ReviewDAO dao=ReviewDAO.newInstance();
		ReviewVO rvo=dao.reviewDetailData(Integer.parseInt(rno));
		request.setAttribute("rvo", rvo);
		request.setAttribute("rno", rno);
		request.setAttribute("gno", gno);
		
		request.setAttribute("main_jsp", "../board/review.jsp");
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
		
		String gno=request.getParameter("gno");
		
		String rno=request.getParameter("rno");
		String score=request.getParameter("score");
		String cateno=request.getParameter("cateno");
		String id=request.getParameter("id");
		String cont=request.getParameter("cont");
		String img=request.getParameter("img");
		String password=request.getParameter("password");
		
		request.setAttribute("gno", gno);
		
		ReviewVO rvo=new ReviewVO();
		rvo.setRno(Integer.parseInt(rno));
		rvo.setScore(Integer.parseInt(score));
		rvo.setCateno(Integer.parseInt(cateno));
		rvo.setId(id);
		rvo.setCont(cont);
		rvo.setImg(img);
		rvo.setPassword(password);
		
		// 데이터베이스 연결 
		ReviewDAO dao=ReviewDAO.newInstance();
		dao.reviewInsert(rvo);		
		
		return "redirect:../busan/review.do";
	}
	
	// 삭제
	@RequestMapping("busan/review_delete_ok.do")
	public void review_delete(HttpServletRequest request, HttpServletResponse response) {
		
		String gno=request.getParameter("gno");
		String rno=request.getParameter("rno");
		String password=request.getParameter("password");
		ReviewDAO dao=ReviewDAO.newInstance();
		String result=dao.reviewDelete(Integer.parseInt(rno), password);
		
		request.setAttribute("gno", gno);
		
		try {
			PrintWriter out=response.getWriter();
			out.write(result);
		}catch(Exception ex) {}
	}
	
	// 수정
	@RequestMapping("busan/review_update.do")
	public String review_update(HttpServletRequest request, HttpServletResponse response) {
		
		String gno=request.getParameter("gno");
		String rno=request.getParameter("rno");
		ReviewDAO dao=ReviewDAO.newInstance();
		ReviewVO rvo=new ReviewVO();
		request.setAttribute("rvo", rvo);
		request.setAttribute("main_jsp", "../busan/review_update.jsp");
		return "../busan/review_update.jsp";
	}
	
	@RequestMapping("busan/review_update_ok.do")
	public void review_update_ok(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		
		String gno=request.getParameter("gno");
		String rno=request.getParameter("rno");
		String score=request.getParameter("score");
		String cont=request.getParameter("cont");
		String img=request.getParameter("img");
		String password=request.getParameter("password");
		
		ReviewVO rvo=new ReviewVO();
		rvo.setRno(Integer.parseInt(rno));
		rvo.setScore(Integer.parseInt(score));
		rvo.setCont(cont);
		rvo.setImg(img);
		rvo.setPassword(password);
	   
		ReviewDAO dao=ReviewDAO.newInstance();
		String res=dao.reviewUpdate(rvo);
		try {
			PrintWriter out=response.getWriter();
			out.write(res);
		} catch(Exception ex) {}
	}
	
}