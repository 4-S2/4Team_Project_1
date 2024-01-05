package com.sist.model;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.dao.BusanDAO;
import com.sist.vo.BusanListVO;
import com.sist.vo.GoodsVO;

public class BusanDetailModel {
	public final int MAX_RECENT_COUNT = 5;
	
	@RequestMapping("busan/food_detail.do")
	public String busan_food_detail(HttpServletRequest request,
			  HttpServletResponse response)
	{
		  // DB연동 
		  //1. 요청값 받기
		  String no=request.getParameter("no");

		  BusanDAO dao=new BusanDAO();
		  BusanListVO vo=dao.busanDetailData(Integer.parseInt(no), "food");
		  List<BusanListVO> list=dao.busanRandomList("food");
		  // 쿠키 저장
		  Cookie[] cookies = request.getCookies();
			if(cookies==null) {
				Cookie cookie = new Cookie("food_recent", String.valueOf(no));
				cookie.setPath("/");
				cookie.setMaxAge(60*60*24);
				response.addCookie(cookie);
			}
			else {
				boolean hasCookie = false;
				for(Cookie c : cookies) {
					if(c.getName().equals("food_recent")) {
						// 중복 체크 => 꽉 찼는지 확인 후 제거 => 새로운 데이터 추가
						StringTokenizer st = new StringTokenizer(c.getValue(), "|");
						List<String> vals = new ArrayList<>();
						while(st.hasMoreTokens())
							vals.add(st.nextToken());

						boolean isDup = false;
						for(String val : vals) {
							if(val.equals(String.valueOf(no))) {
								isDup = true;
								break;
							}
						}
						
						if(!isDup) {
							int s = (vals.size() == MAX_RECENT_COUNT) ? 1 : 0; // 쿠키가 꽉 찼으면 앞 제거 
							String newValue = "";
							for(int i=s;i<vals.size();i++) {
								newValue = newValue + "|" +vals.get(i);
							}
							newValue = newValue + "|" + no;
							Cookie cookie = new Cookie("food_recent", newValue);
							cookie.setPath("/");
							cookie.setMaxAge(60*60*24);
							response.addCookie(cookie);
						}
						
						hasCookie = true;
						break;
					}
				}
				if(!hasCookie) {
					Cookie cookie = new Cookie("food_recent", String.valueOf(no));
					cookie.setPath("/");
					cookie.setMaxAge(60*60*24);
					response.addCookie(cookie);
				}
			}
		 
		  request.setAttribute("vo", vo);
		  request.setAttribute("cate","맛집");
		  request.setAttribute("tab","food");
		  request.setAttribute("vo", vo);
		  request.setAttribute("list", list);
		  //3. 결과값 모아서 request에 저장 
		  request.setAttribute("main_jsp", "../busan/busanList_detail.jsp");
		  return "../main/main.jsp";
	}
	@RequestMapping("busan/tour_detail.do")
	public String busan_tour_detail(HttpServletRequest request,
			  HttpServletResponse response)
	{
		  // DB연동 
		  //1. 요청값 받기
		  String no=request.getParameter("no");

		  BusanDAO dao = new BusanDAO();
		  BusanListVO vo = dao.busanDetailData(Integer.parseInt(no),"tour");
		  List<BusanListVO> list=dao.busanRandomList("tour");
		  
		  // 쿠키 저장
		  Cookie[] cookies = request.getCookies();
			if(cookies==null) {
				Cookie cookie = new Cookie("tour_recent", String.valueOf(no));
				cookie.setPath("/");
				cookie.setMaxAge(60*60*24);
				response.addCookie(cookie);
			}
			else {
				boolean hasCookie = false;
				for(Cookie c : cookies) {
					if(c.getName().equals("tour_recent")) {
						// 중복 체크 => 꽉 찼는지 확인 후 제거 => 새로운 데이터 추가
						StringTokenizer st = new StringTokenizer(c.getValue(), "|");
						List<String> vals = new ArrayList<>();
						while(st.hasMoreTokens())
							vals.add(st.nextToken());

						boolean isDup = false;
						for(String val : vals) {
							if(val.equals(String.valueOf(no))) {
								isDup = true;
								break;
							}
						}
						
						if(!isDup) {
							int s = (vals.size() == MAX_RECENT_COUNT) ? 1 : 0; // 쿠키가 꽉 찼으면 앞 제거 
							String newValue = "";
							for(int i=s;i<vals.size();i++) {
								newValue = newValue + "|" +vals.get(i);
							}
							newValue = newValue + "|" + no;
							Cookie cookie = new Cookie("tour_recent", newValue);
							cookie.setPath("/");
							cookie.setMaxAge(60*60*24);
							response.addCookie(cookie);
						}
						
						hasCookie = true;
						break;
					}
				}
				if(!hasCookie) {
					Cookie cookie = new Cookie("tour_recent", String.valueOf(no));
					cookie.setPath("/");
					cookie.setMaxAge(60*60*24);
					response.addCookie(cookie);
				}
			}
			
			request.setAttribute("cate","명소");
			request.setAttribute("vo", vo);
			request.setAttribute("list", list);
			request.setAttribute("tab","tour");
		  //3. 결과값 모아서 request에 저장 
		  request.setAttribute("main_jsp", "../busan/busanList_detail.jsp");
		  return "../main/main.jsp";
	}
	
	@RequestMapping("busan/festival_detail.do")
	public String busan_festival_detail(HttpServletRequest request,
			  HttpServletResponse response)
	{
		  // DB연동 
		  //1. 요청값 받기
		  String no=request.getParameter("no");

		  BusanDAO dao = new BusanDAO();
		  BusanListVO vo = dao.busanDetailData(Integer.parseInt(no),"festival");
		  List<BusanListVO> list=dao.busanRandomList("festival");
		  
		  // 쿠키 저장
		  Cookie[] cookies = request.getCookies();
			if(cookies==null) {
				Cookie cookie = new Cookie("festival_recent", String.valueOf(no));
				cookie.setPath("/");
				cookie.setMaxAge(60*60*24);
				response.addCookie(cookie);
			}
			else {
				boolean hasCookie = false;
				for(Cookie c : cookies) {
					if(c.getName().equals("festival_recent")) {
						// 중복 체크 => 꽉 찼는지 확인 후 제거 => 새로운 데이터 추가
						StringTokenizer st = new StringTokenizer(c.getValue(), "|");
						List<String> vals = new ArrayList<>();
						while(st.hasMoreTokens())
							vals.add(st.nextToken());

						boolean isDup = false;
						for(String val : vals) {
							if(val.equals(String.valueOf(no))) {
								isDup = true;
								break;
							}
						}
						
						if(!isDup) {
							int s = (vals.size() == MAX_RECENT_COUNT) ? 1 : 0; // 쿠키가 꽉 찼으면 앞 제거 
							String newValue = "";
							for(int i=s;i<vals.size();i++) {
								newValue = newValue + "|" +vals.get(i);
							}
							newValue = newValue + "|" + no;
							Cookie cookie = new Cookie("festival_recent", newValue);
							cookie.setPath("/");
							cookie.setMaxAge(60*60*24);
							response.addCookie(cookie);
						}
						
						hasCookie = true;
						break;
					}
				}
				if(!hasCookie) {
					Cookie cookie = new Cookie("festival_recent", String.valueOf(no));
					cookie.setPath("/");
					cookie.setMaxAge(60*60*24);
					response.addCookie(cookie);
				}
			}
		  
		  request.setAttribute("cate","축제");
		  request.setAttribute("vo", vo);
		  request.setAttribute("list", list);
		  request.setAttribute("tab","festival");
		  
		  //3. 결과값 모아서 request에 저장 
		  request.setAttribute("main_jsp", "../busan/busanList_detail.jsp");
		  return "../main/main.jsp";
	}
	
	@RequestMapping("busan/activity_detail.do")
	public String busan_activity_detail(HttpServletRequest request,
			  HttpServletResponse response)
	{
		  // DB연동 
		  //1. 요청값 받기
		  String no=request.getParameter("no");

		  BusanDAO dao = new BusanDAO();
		  BusanListVO vo = dao.busanDetailData(Integer.parseInt(no),"activity");
		  List<BusanListVO> list=dao.busanRandomList("activity");
		  // 쿠키 저장
		  Cookie[] cookies = request.getCookies();
			if(cookies==null) {
				Cookie cookie = new Cookie("activity_recent", String.valueOf(no));
				cookie.setPath("/");
				cookie.setMaxAge(60*60*24);
				response.addCookie(cookie);
			}
			else {
				boolean hasCookie = false;
				for(Cookie c : cookies) {
					if(c.getName().equals("activity_recent")) {
						// 중복 체크 => 꽉 찼는지 확인 후 제거 => 새로운 데이터 추가
						StringTokenizer st = new StringTokenizer(c.getValue(), "|");
						List<String> vals = new ArrayList<>();
						while(st.hasMoreTokens())
							vals.add(st.nextToken());

						boolean isDup = false;
						for(String val : vals) {
							if(val.equals(String.valueOf(no))) {
								isDup = true;
								break;
							}
						}
						
						if(!isDup) {
							int s = (vals.size() == MAX_RECENT_COUNT) ? 1 : 0; // 쿠키가 꽉 찼으면 앞 제거 
							String newValue = "";
							for(int i=s;i<vals.size();i++) {
								newValue = newValue + "|" +vals.get(i);
							}
							newValue = newValue + "|" + no;
							Cookie cookie = new Cookie("activity_recent", newValue);
							cookie.setPath("/");
							cookie.setMaxAge(60*60*24);
							response.addCookie(cookie);
						}
						
						hasCookie = true;
						break;
					}
				}
				if(!hasCookie) {
					Cookie cookie = new Cookie("activity_recent", String.valueOf(no));
					cookie.setPath("/");
					cookie.setMaxAge(60*60*24);
					response.addCookie(cookie);
				}
			}
		  
		  request.setAttribute("cate","체험");
		  request.setAttribute("vo", vo);
		  request.setAttribute("list", list);
		  request.setAttribute("tab","activity");
		  
		  //3. 결과값 모아서 request에 저장 
		  request.setAttribute("main_jsp", "../busan/busanList_detail.jsp");
		  return "../main/main.jsp";
	}
}
