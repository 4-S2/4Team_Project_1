package com.sist.model;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;
public class ExListModel {
	final int MAX_RECENT_COUNT = 5;
	// => if : => 
	@RequestMapping("busan/ex.do")
	public String busan_ex(HttpServletRequest request,
			  HttpServletResponse response)
	{
		  // DB연동 
		  //1. 요청값 받기
		  String eno=request.getParameter("eno");
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
		   request.setAttribute("eno", eno);
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
		  List<ExVO> vo1=dao.exRecomendListData();
			/*
			 * // 쿠키 저장 Cookie[] cookies = request.getCookies(); if(cookies==null) { Cookie
			 * cookie = new Cookie("exhibition_recent", String.valueOf(eno));
			 * cookie.setPath("/"); cookie.setMaxAge(60*60*24); response.addCookie(cookie);
			 * } else { boolean hasCookie = false; for(Cookie c : cookies) {
			 * if(c.getName().equals("exhibition_recent")) { // 중복 체크 => 꽉 찼는지 확인 후 제거 =>
			 * 새로운 데이터 추가 StringTokenizer st = new StringTokenizer(c.getValue(), "|");
			 * List<String> vals = new ArrayList<>(); while(st.hasMoreTokens())
			 * vals.add(st.nextToken());
			 * 
			 * boolean isDup = false; for(String val : vals) {
			 * if(val.equals(String.valueOf(eno))) { isDup = true; break; } }
			 * 
			 * if(!isDup) { int s = (vals.size() == MAX_RECENT_COUNT) ? 1 : 0; // 쿠키가 꽉 찼으면
			 * 앞 제거 String newValue = ""; for(int i=s;i<vals.size();i++) { newValue =
			 * newValue + "|" +vals.get(i); } newValue = newValue + "|" + eno; Cookie cookie
			 * = new Cookie("exhibition_recent", newValue); cookie.setPath("/");
			 * cookie.setMaxAge(60*60*24); response.addCookie(cookie); }
			 * 
			 * hasCookie = true; break; } } if(!hasCookie) { Cookie cookie = new
			 * Cookie("exhibition_recent", String.valueOf(eno)); cookie.setPath("/");
			 * cookie.setMaxAge(60*60*24); response.addCookie(cookie); } }
			 */
		  request.setAttribute("vo", vo);
		  request.setAttribute("vo1", vo1);
		  request.setAttribute("eno", eno);
		    
		  //3. 결과값 모아서 request에 저장 
		  request.setAttribute("main_jsp", "../busan/ex_detail.jsp");
		  return "../main/main.jsp";
	}
	
	@RequestMapping("busan/ex_reserve.do")
	public String ex_reserve(HttpServletRequest request, HttpServletResponse response) {
	    // reserve/ex_reserve.do 요청 처리 메소드
	    String eno = request.getParameter("eno");
	    String date = request.getParameter("date");
	    String formattedDate = "";
	    if (date == null)
	        date = "";
	    if (!date.equals("")) {
	        DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	        DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일 (E)", Locale.KOREAN);
	        LocalDate dateStr = LocalDate.parse(date, inputFormatter);
	        formattedDate = dateStr.format(outputFormatter);
	    }

	    String inwon = request.getParameter("inwon");
	    int people = Integer.parseInt(inwon);
	    HttpSession session = request.getSession();
	    String id = (String) session.getAttribute("id");
	    String name = (String) session.getAttribute("name");

	    ExDAO dao = ExDAO.newInstance();
	    ExVO vo = dao.exDetailData(Integer.parseInt(eno));
	    if (vo.getPoster() == null)
	        vo.setPoster(vo.getPoster());

	    MemberDAO mdao = MemberDAO.newInstance();
	    MemberVO mvo = mdao.memberSearch(id);

	    request.setAttribute("mvo", mvo);
	    request.setAttribute("id", id);
	    request.setAttribute("name", name);
	    request.setAttribute("date", formattedDate);
	    request.setAttribute("inwon", people);
	    request.setAttribute("vo", vo);
	    request.setAttribute("main_jsp", "../busan/ex_reserve.jsp");

	    return "../main/main.jsp";
	}

	
	

	
	
	
}