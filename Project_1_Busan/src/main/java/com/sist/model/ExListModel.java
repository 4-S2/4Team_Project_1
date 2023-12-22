package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;
public class ExListModel {
	// => if : => 
	@RequestMapping("busan/ex.do")
	public String busan_ex(HttpServletRequest request,
			  HttpServletResponse response)
	{
		  // DB연동 
		  //1. 요청값 받기
		  String page=request.getParameter("page");
		  if(page==null)
			  page="1";
		  int curpage=Integer.parseInt(page);
		  //2. DB연동 
		  ExDAO dao=new ExDAO();
		  List<ExVO> list=dao.exListData(curpage);
		  int totalpage=dao.exTotalPage();
		  
		   final int BLOCK=5;
		   int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		   int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		   
		   if(endPage>totalpage)
			   endPage=totalpage;
		  
		  request.setAttribute("curpage", curpage);
		  request.setAttribute("totalpage", totalpage);
		   request.setAttribute("startPage", startPage);
		   request.setAttribute("endPage", endPage);
		  request.setAttribute("list", list);
		  //3. 결과값 모아서 request에 저장 
		  request.setAttribute("main_jsp", "../busan/ex.jsp");
		  return "../main/main.jsp";
	}
	
	@RequestMapping("main/main.do")
	public String main_ex(HttpServletRequest request,
			  HttpServletResponse response)
	{
		  // DB연동 
		  //1. 요청값 받기
		  String page=request.getParameter("page");
		  if(page==null)
			  page="1";
		  int curpage=Integer.parseInt(page);
		  //2. DB연동 
		  ExDAO dao=new ExDAO();
		  List<ExVO> list=dao.exListData(curpage);
		  int totalpage=dao.exTotalPage();
		  
		  request.setAttribute("curpage", curpage);
		  request.setAttribute("totalpage", totalpage);
		  request.setAttribute("list", list);
		  //3. 결과값 모아서 request에 저장 
		  request.setAttribute("main_jsp", "../busan/ex.jsp");
		  return "../main/main.jsp";
	}
	
	@RequestMapping("busan/ex_detail.do")
	public String ex_detail(HttpServletRequest request,
			  HttpServletResponse response)
	{
		  // DB연동 
		  //1. 요청값 받기
		  String eno=request.getParameter("eno");

		  ExDAO dao=new ExDAO();
		  ExVO vo=dao.exDetailData(Integer.parseInt(eno));
		 
		  request.setAttribute("vo", vo);
		  //3. 결과값 모아서 request에 저장 
		  request.setAttribute("main_jsp", "../busan/ex_detail.jsp");
		  return "../main/main.jsp";
	}
	
	
	
}