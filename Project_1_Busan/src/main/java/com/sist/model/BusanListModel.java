package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;

import java.io.UnsupportedEncodingException;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.BusanListVO;

import oracle.jdbc.driver.parser.util.Array;
import oracle.net.ns.SessionAtts;
public class BusanListModel {
	
	@RequestMapping("busan/food.do")
	public String busan_foodList(HttpServletRequest request,
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
		  List<BusanListVO> list=dao.BusanListData(curpage,"food");
		  HeartDAO hdao=HeartDAO.newInstance();
		  JjimDAO jdao=JjimDAO.newInstance();
		  List<Integer> hlist=new ArrayList<>();
		  for(BusanListVO a:list)
		  {
			  int hcount=hdao.heartTotalCount(4, a.getNo());
			  a.setHeart(hcount);
			  System.out.println(a.getJjim());
		  }
		  
		  int totalpage=dao.BusanListTotalPage("food");
		  
		   final int BLOCK=10;
		   int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		   int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		   
		   if(endPage>totalpage)
			   endPage=totalpage;
		  
		  request.setAttribute("tab","food");
		  request.setAttribute("curpage", curpage);
		  request.setAttribute("totalpage", totalpage);
		  request.setAttribute("startPage", startPage);
		  request.setAttribute("endPage", endPage);
		  request.setAttribute("list", list);
		  //3. 결과값 모아서 request에 저장 
		  request.setAttribute("main_jsp", "../busan/food.jsp");
		  return "../main/main.jsp";
	}

	@RequestMapping("busan/food_find.do")
	public String busan_food_tagfind(HttpServletRequest request,
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
		  String sort=request.getParameter("sort");
		  if(word==null)
			  word="";
		  if(tag==null||tag.equals("전체"))
			  tag="";
		  if(page==null)
			  page="1";
		  if(sort==null||sort=="")
			  sort="no";
		  System.out.println(page);
		  System.out.println(word);
		  System.out.println(tag);
		  int curpage=Integer.parseInt(page);
		  //2. DB연동 
		  BusanDAO dao=new BusanDAO();
		  List<BusanListVO> list=dao.foodFindList(word,curpage,tag,sort);
		  HeartDAO hdao=HeartDAO.newInstance();
		  JjimDAO jdao=JjimDAO.newInstance();
		  List<Integer> hlist=new ArrayList<>();
		  for(BusanListVO a:list)
		  {
			  int hcount=hdao.heartTotalCount(4, a.getNo());
			  a.setHeart(hcount);
		  }
		  int totalpage=dao.foodFindTotalPage(word, tag);
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
		  request.setAttribute("tag", tag);
		  request.setAttribute("word", word);
		  request.setAttribute("sort", sort);
		  //3. 결과값 모아서 request에 저장 
		  request.setAttribute("main_jsp", "../busan/food.jsp");
		  return "../main/main.jsp";
	}
	@RequestMapping("busan/tour.do")
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
		  String sort=request.getParameter("sort");
		  if(word==null)
			  word="";
		  if(page==null)
			  page="1";
		  if(sort==null||sort=="")
			  sort="no";
		  int curpage=Integer.parseInt(page);
		  //2. DB연동 
		  BusanDAO dao=new BusanDAO();
		  List<BusanListVO> list=dao.BusanFindList(word,curpage,"tour",sort);
		  HeartDAO hdao=HeartDAO.newInstance();
		  JjimDAO jdao=JjimDAO.newInstance();
		  List<Integer> hlist=new ArrayList<>();
		  for(BusanListVO a:list)
		  {
			  int hcount=hdao.heartTotalCount(1, a.getNo());
			  a.setHeart(hcount);
		  }
		  int totalpage=dao.BusanFindTotalPage(word, "tour");
		  
		   final int BLOCK=10;
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
		  request.setAttribute("word", word);
		  request.setAttribute("sort", sort);
		  //3. 결과값 모아서 request에 저장 
		  request.setAttribute("main_jsp", "../busan/busan_list.jsp");
		  return "../main/main.jsp";
	}
	@RequestMapping("busan/festival.do")
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
		  String sort=request.getParameter("sort");
		  if(word==null)
			  word="";
		  if(page==null)
			  page="1";
		  if(sort==null||sort=="")
			  sort="no";
		  int curpage=Integer.parseInt(page);
		  //2. DB연동 
		  BusanDAO dao=new BusanDAO();
		  List<BusanListVO> list=dao.BusanFindList(word,curpage,"festival",sort);
		  HeartDAO hdao=HeartDAO.newInstance();
		  JjimDAO jdao=JjimDAO.newInstance();
		  List<Integer> hlist=new ArrayList<>();
		  for(BusanListVO a:list)
		  {
			  int hcount=hdao.heartTotalCount(2, a.getNo());
			  a.setHeart(hcount);
		  }
		  int totalpage=dao.BusanFindTotalPage(word, "festival");
		  
		   final int BLOCK=10;
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
		  request.setAttribute("word", word);
		  request.setAttribute("sort", sort);
		  //3. 결과값 모아서 request에 저장 
		  request.setAttribute("main_jsp", "../busan/busan_list.jsp");
		  return "../main/main.jsp";
	}
	@RequestMapping("busan/activity.do")
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
		  String sort=request.getParameter("sort");
		  if(word==null)
			  word="";
		  if(page==null)
			  page="1";
		  if(sort==null||sort=="")
			  sort="no";
		  int curpage=Integer.parseInt(page);
		  //2. DB연동 
		  BusanDAO dao=new BusanDAO();
		  List<BusanListVO> list=dao.BusanFindList(word,curpage,"activity",sort);
		  HeartDAO hdao=HeartDAO.newInstance();
		  JjimDAO jdao=JjimDAO.newInstance();
		  List<Integer> hlist=new ArrayList<>();
		  for(BusanListVO a:list)
		  {
			  int hcount=hdao.heartTotalCount(3, a.getNo());
			  a.setHeart(hcount);
		  }
		  int totalpage=dao.BusanFindTotalPage(word, "activity");
		  
		   final int BLOCK=10;
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
		  request.setAttribute("word", word);
		  request.setAttribute("sort", sort);
		  //3. 결과값 모아서 request에 저장 
		  request.setAttribute("main_jsp", "../busan/busan_list.jsp");
		  return "../main/main.jsp";
	}
	

	
}