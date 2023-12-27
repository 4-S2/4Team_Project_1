package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;

import java.io.UnsupportedEncodingException;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.BusanListVO;
public class BusanListModel {
	// => if : => 
	
	@RequestMapping("busan/tour.do")
	public String busan_tourList(HttpServletRequest request,
			  HttpServletResponse response)
	{
		  // DB연동 
		  //1. 요청값 받기
		  String page=request.getParameter("page");
		  if(page==null)
			  page="1";
		  int curpage=Integer.parseInt(page);
		  //2. DB연동 
		  BusanDAO dao=new BusanDAO();
		  List<BusanListVO> list=dao.BusanListData(curpage,"tour");
		  int totalpage=dao.BusanListTotalPage("tour");
		  
		   final int BLOCK=5;
		   int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		   int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		   
		   if(endPage>totalpage)
			   endPage=totalpage;
		  
		  request.setAttribute("cate","명소");
		  request.setAttribute("tab","tour");
		  request.setAttribute("curpage", curpage);
		  request.setAttribute("totalpage", totalpage);
		  request.setAttribute("startPage", startPage);
		  request.setAttribute("endPage", endPage);
		  request.setAttribute("list", list);
		  //3. 결과값 모아서 request에 저장 
		  request.setAttribute("main_jsp", "../busan/busan_list.jsp");
		  return "../main/main.jsp";
	}
	
	@RequestMapping("busan/festival.do")
	public String busan_festival(HttpServletRequest request,
			  HttpServletResponse response)
	{
		  // DB연동 
		  //1. 요청값 받기
		  String page=request.getParameter("page");
		  if(page==null)
			  page="1";
		  int curpage=Integer.parseInt(page);
		  //2. DB연동 
		  BusanDAO dao=new BusanDAO();
		  List<BusanListVO> list=dao.BusanListData(curpage,"festival");
		  int totalpage=dao.BusanListTotalPage("festival");
		  
		   final int BLOCK=5;
		   int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		   int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		   
		   if(endPage>totalpage)
			   endPage=totalpage;
		  
		  request.setAttribute("cate","축제");
		  request.setAttribute("tab","festival");
		  request.setAttribute("curpage", curpage);
		  request.setAttribute("totalpage", totalpage);
		  request.setAttribute("startPage", startPage);
		  request.setAttribute("endPage", endPage);
		  request.setAttribute("list", list);
		  //3. 결과값 모아서 request에 저장 
		  request.setAttribute("main_jsp", "../busan/busan_list.jsp");
		  return "../main/main.jsp";
	}
	
	@RequestMapping("busan/activity.do")
	public String busan_activityList(HttpServletRequest request,
			  HttpServletResponse response)
	{
		  // DB연동 
		  //1. 요청값 받기
		  String page=request.getParameter("page");
		  if(page==null)
			  page="1";
		  int curpage=Integer.parseInt(page);
		  //2. DB연동 
		  BusanDAO dao=new BusanDAO();
		  List<BusanListVO> list=dao.BusanListData(curpage,"activity");
		  int totalpage=dao.BusanListTotalPage("activity");
		  
		   final int BLOCK=5;
		   int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		   int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		   
		   if(endPage>totalpage)
			   endPage=totalpage;
		  
		  request.setAttribute("cate","체험");
		  request.setAttribute("tab","activity");
		  request.setAttribute("curpage", curpage);
		  request.setAttribute("totalpage", totalpage);
		  request.setAttribute("startPage", startPage);
		  request.setAttribute("endPage", endPage);
		  request.setAttribute("list", list);
		  //3. 결과값 모아서 request에 저장 
		  request.setAttribute("main_jsp", "../busan/busan_list.jsp");
		  return "../main/main.jsp";
	}
	
	@RequestMapping("busan/food.do")
	public String busan_foodList(HttpServletRequest request,
			  HttpServletResponse response)
	{
		try {
			  request.setCharacterEncoding("UTF-8");
		  }catch(Exception e) {}
		 
		  // DB연동 
		  //1. 요청값 받기
		  String page=request.getParameter("page");
		  String word=request.getParameter("word");
		  String tag=request.getParameter("tag");
		  System.out.println(word);
		  System.out.println(tag);
		  if(page==null)
			  page="1";
		  System.out.println(page);
		  int curpage=Integer.parseInt(page);
		  //2. DB연동 
		  BusanDAO dao=new BusanDAO();
		  List<BusanListVO> list=dao.BusanFindList(word,curpage,"food");
		  int totalpage=dao.BusanFindTotalPage(word, "food");
		  
		   final int BLOCK=10;
		   int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		   int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		   
		   if(endPage>totalpage)
			   endPage=totalpage;
		  
		  request.setAttribute("curpage", curpage);
		  request.setAttribute("totalpage", totalpage);
		   request.setAttribute("startPage", startPage);
		   request.setAttribute("endPage", endPage);
		  request.setAttribute("list", list);
		  request.setAttribute("word", word);
		  request.setAttribute("tag", tag);
		  //3. 결과값 모아서 request에 저장 
		  request.setAttribute("main_jsp", "../busan/food.jsp");
		  return "../main/main.jsp";
	}
	
	@RequestMapping("busan/food_find.do")
	public String busan_food_FindList(HttpServletRequest request,
			  HttpServletResponse response)
	{
		  try {
			  request.setCharacterEncoding("UTF-8");
		  }catch(Exception e) {}
		 
		  // DB연동 
		  //1. 요청값 받기
		  String page=request.getParameter("page");
		  String word=request.getParameter("word");
		  System.out.println(word);

		  if(page==null)
			  page="1";
		  System.out.println(page);
		  int curpage=Integer.parseInt(page);
		  //2. DB연동 
		  BusanDAO dao=new BusanDAO();
		  List<BusanListVO> list=dao.BusanFindList(word,curpage,"food");
		  int totalpage=dao.BusanFindTotalPage(word, "food");
		  
		   final int BLOCK=10;
		   int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		   int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		   
		   if(endPage>totalpage)
			   endPage=totalpage;
		  
		  request.setAttribute("curpage", curpage);
		  request.setAttribute("totalpage", totalpage);
		   request.setAttribute("startPage", startPage);
		   request.setAttribute("endPage", endPage);
		  request.setAttribute("list", list);
		  request.setAttribute("word", word);
		  //3. 결과값 모아서 request에 저장 
		  request.setAttribute("main_jsp", "../busan/food.jsp");
		  return "../main/main.jsp";
	}
	@RequestMapping("busan/tour_find.do")
	public String busan_tour_FindList(HttpServletRequest request,
			  HttpServletResponse response)
	{
		  try {
			  request.setCharacterEncoding("UTF-8");
		  }catch(Exception e) {}
		 
		  // DB연동 
		  //1. 요청값 받기
		  String page=request.getParameter("page");
		  String word=request.getParameter("word");
		  if(page==null)
			  page="1";
		  int curpage=Integer.parseInt(page);
		  //2. DB연동 
		  BusanDAO dao=new BusanDAO();
		  List<BusanListVO> list=dao.BusanFindList(word,curpage,"tour");
		  int totalpage=dao.BusanFindTotalPage(word, "tour");
		  
		   final int BLOCK=10;
		   int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		   int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		   
		   if(endPage>totalpage)
			   endPage=totalpage;
		  
		  request.setAttribute("curpage", curpage);
		  request.setAttribute("totalpage", totalpage);
		   request.setAttribute("startPage", startPage);
		   request.setAttribute("endPage", endPage);
		  request.setAttribute("list", list);
		  request.setAttribute("word", word);
		  //3. 결과값 모아서 request에 저장 
		  request.setAttribute("main_jsp", "../busan/busan_list.jsp");
		  return "../main/main.jsp";
	}
	@RequestMapping("busan/festival_find.do")
	public String busan_festival_FindList(HttpServletRequest request,
			  HttpServletResponse response)
	{
		  try {
			  request.setCharacterEncoding("UTF-8");
		  }catch(Exception e) {}
		 
		  // DB연동 
		  //1. 요청값 받기
		  String page=request.getParameter("page");
		  String word=request.getParameter("word");
		  if(page==null)
			  page="1";
		  int curpage=Integer.parseInt(page);
		  //2. DB연동 
		  BusanDAO dao=new BusanDAO();
		  List<BusanListVO> list=dao.BusanFindList(word,curpage,"festival");
		  int totalpage=dao.BusanFindTotalPage(word, "festival");
		  
		   final int BLOCK=10;
		   int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		   int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		   
		   if(endPage>totalpage)
			   endPage=totalpage;
		  
		  request.setAttribute("curpage", curpage);
		  request.setAttribute("totalpage", totalpage);
		   request.setAttribute("startPage", startPage);
		   request.setAttribute("endPage", endPage);
		  request.setAttribute("list", list);
		  request.setAttribute("word", word);
		  //3. 결과값 모아서 request에 저장 
		  request.setAttribute("main_jsp", "../busan/busan_list.jsp");
		  return "../main/main.jsp";
	}
	@RequestMapping("busan/activity_find.do")
	public String busan_activity_FindList(HttpServletRequest request,
			  HttpServletResponse response)
	{
		  try {
			  request.setCharacterEncoding("UTF-8");
		  }catch(Exception e) {}
		 
		  // DB연동 
		  //1. 요청값 받기
		  String page=request.getParameter("page");
		  String word=request.getParameter("word");
		  if(page==null)
			  page="1";
		  int curpage=Integer.parseInt(page);
		  //2. DB연동 
		  BusanDAO dao=new BusanDAO();
		  List<BusanListVO> list=dao.BusanFindList(word,curpage,"activity");
		  int totalpage=dao.BusanFindTotalPage(word, "activity");
		  
		   final int BLOCK=10;
		   int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		   int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		   
		   if(endPage>totalpage)
			   endPage=totalpage;
		  
		  request.setAttribute("curpage", curpage);
		  request.setAttribute("totalpage", totalpage);
		   request.setAttribute("startPage", startPage);
		   request.setAttribute("endPage", endPage);
		  request.setAttribute("list", list);
		  request.setAttribute("word", word);
		  //3. 결과값 모아서 request에 저장 
		  request.setAttribute("main_jsp", "../busan/busan_list.jsp");
		  return "../main/main.jsp";
	}
	

	
}