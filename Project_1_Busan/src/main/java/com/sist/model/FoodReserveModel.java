package com.sist.model;

import java.util.*;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.BusanDAO;
import com.sist.dao.FoodReserveDAO;
import com.sist.vo.BusanListVO;
import com.sist.vo.FoodReserveVO;

public class FoodReserveModel {
	@RequestMapping("reserve/foodreserve_main.do")
	public String reserve_main(HttpServletRequest request,
			HttpServletResponse response)
	{
		String no=request.getParameter("no");
		System.out.println(no);
		return "../reserve/foodreserve_main.jsp";
	}
	@RequestMapping("reserve/food_date.do")
	public String food_date(HttpServletRequest request,
			HttpServletResponse response)
	{
		String no=request.getParameter("no");
		System.out.println(no);
		SimpleDateFormat sf=new SimpleDateFormat("yyyy-M-d");
		String today=sf.format(new Date());
		StringTokenizer st=new StringTokenizer(today,"-");
		String y=st.nextToken();
		String m=st.nextToken();
		String d=st.nextToken();

		int year=Integer.parseInt(y);
		int month=Integer.parseInt(m);
		int day=Integer.parseInt(d);

		String[] strWeek= {"일","월","화","수","목","금","토"};
		Calendar cal=Calendar.getInstance();
		cal.set(Calendar.YEAR, year);
		cal.set(Calendar.MONTH, month-1); //
		cal.set(Calendar.DATE, 1); //시작일 설정

		//요일 구하기
		int week=cal.get(Calendar.DAY_OF_WEEK); //1~7
		int lastday=cal.getActualMaximum(Calendar.DATE);
		week=week-1;//배열인덱스로 쓰려면 0~6 

		request.setAttribute("year", year);
		request.setAttribute("month", month);
		request.setAttribute("day", day);
		request.setAttribute("week", week);
		request.setAttribute("lastday", lastday);
		request.setAttribute("strWeek", strWeek);

		//예약 가능한 날짜
		FoodReserveDAO dao=FoodReserveDAO.newInstance();
		String rdays=dao.reserveDays(Integer.parseInt(no));
		int rday[]=new int[32];
		st=new StringTokenizer(rdays,",");
		while(st.hasMoreTokens())
		{
			int a=Integer.parseInt(st.nextToken());
			if(a>=day)
			{
				rday[a]=1; //오늘보다 큰 날짜는 예약 가능 1
			}
		}
		request.setAttribute("rday", rday);
		return "../reserve/food_date.jsp";
	}
	@RequestMapping("reserve/food_title.do")
	public void food_title(HttpServletRequest request,
			HttpServletResponse response)
	{
		// DB연동 
		//1. 요청값 받기
		String no=request.getParameter("no");

		BusanDAO dao=new BusanDAO();
		BusanListVO vo=dao.busanDetailData(Integer.parseInt(no), "food");
		String title=vo.getTitle();

		try {
			PrintWriter pw=response.getWriter();
			pw.write(URLEncoder.encode(title,"UTF-8"));
		}catch(Exception e) {e.printStackTrace();}
	}
	@RequestMapping("reserve/food_time.do")
	public String food_time(HttpServletRequest request,
			HttpServletResponse response)
	{
		String day=request.getParameter("day");
		System.out.println(day);
		FoodReserveDAO dao=FoodReserveDAO.newInstance();
		String rtime=dao.reserveDateTime(Integer.parseInt(day));
		System.out.println(rtime);
		StringTokenizer st=new StringTokenizer(rtime,",");
		List<String> list=new ArrayList<String>();
		while(st.hasMoreTokens())
		{
			int ftno=Integer.parseInt(st.nextToken());
			System.out.println(ftno);
			String time=dao.reserveTime(ftno);
			System.out.println(time);
			list.add(time);

		}
		request.setAttribute("list", list);
		return "../reserve/food_time.jsp";
	}

	@RequestMapping("reserve/food_inwon.do")
	public String food_inwon(HttpServletRequest request,
			HttpServletResponse response)
	{
		return "../reserve/food_inwon.jsp";
	}


	@RequestMapping("reserve/food_reserve_ok.do")
	public void food_reserve_ok(HttpServletRequest request,
			HttpServletResponse response)
	{
		try {
			request.setCharacterEncoding("UTF-8");
		}catch(Exception e) {}
		String no=request.getParameter("fno");
		String rday=request.getParameter("rday");
		String rtime=request.getParameter("rtime");
		String rinwon=request.getParameter("rinwon");
		System.out.println(no+" "+rday+" "+rtime+" "+rinwon);
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		FoodReserveVO vo=new FoodReserveVO();
		vo.setFno(Integer.parseInt(no));
		vo.setDay(rday);
		vo.setId(id);
		vo.setInwon(Integer.parseInt(rinwon));
		vo.setTime(rtime);
		FoodReserveDAO dao=FoodReserveDAO.newInstance();
		dao.reserveInsertData(vo);
		
		
	}
}
