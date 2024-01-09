package com.sist.model;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.vo.*;
import com.sist.dao.ReserveDAO;

public class ReserveModel {
	@RequestMapping("reserve/diary.do")
	  public String diaryData(HttpServletRequest request,HttpServletResponse response)
	  {
		    String eno=request.getParameter("eno");
		    System.out.println("eno="+eno);
		    String strYear=request.getParameter("year");
		    String strMonth=request.getParameter("month");
		    Date date=new Date();
		    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-M-d");
		    String today=sdf.format(date);
		    StringTokenizer st=new StringTokenizer(today,"-");
		    String sy=st.nextToken();
		    String sm=st.nextToken();
		    String sd=st.nextToken();
		    
		    if(strYear==null)
		    	strYear=sy;
		    
		    if(strMonth==null)
		    	strMonth=sm;
		    
		    int year=Integer.parseInt(strYear);
		    int month=Integer.parseInt(strMonth);
		    int day=Integer.parseInt(sd);
		    // 요일 
		    String[] strWeek={"일","월","화","수","목","금","토"};
		    
		    Calendar cal=Calendar.getInstance();
		    cal.set(Calendar.YEAR,year);
		    cal.set(Calendar.MONTH,month-1);
		    cal.set(Calendar.DATE,1); // 1일자 
		    
		    int week=cal.get(Calendar.DAY_OF_WEEK);// 요일 구하기
		    int lastday=cal.getActualMaximum(Calendar.DATE);// 각달의 마지막 일 
		    
		    week=week-1;
		    
		    request.setAttribute("year", year);
		    request.setAttribute("month", month);
		    request.setAttribute("day", day);
		    request.setAttribute("week", week);
		    request.setAttribute("lastday", lastday);
		    request.setAttribute("strWeek", strWeek);
		    
		    // 오라클 데이터 읽기 
		    int[] rday=new int[32];
		    ReserveDAO dao=ReserveDAO.newInstance();
		    String r=dao.exReserveDay(Integer.parseInt(eno));
		    st=new StringTokenizer(r,",");
		    while(st.hasMoreTokens())
		    {
		    	int a=Integer.parseInt(st.nextToken());
		    	if(a>=day)
		    	{
		    		rday[a]=1;
		    	}
		    }
		    request.setAttribute("rday", rday);
		    
		  return "../reserve/diary.jsp";
	  }
	  @RequestMapping("reserve/ex_list.do")
	  public String ex_list(HttpServletRequest request,
			   HttpServletResponse response)
	  {
		  try
		  {
			  request.setCharacterEncoding("UTF-8");
		  }catch(Exception ex) {}
		
		  
		  ReserveDAO dao=ReserveDAO.newInstance();
		  List<ExVO> list=dao.exReserveData();
		  request.setAttribute("list", list);
		  return "../reserve/ex_list.jsp";
	  }
	  
	  
	  @RequestMapping("reserve/reserve_main.do")
	  public String reserve_main(HttpServletRequest request,HttpServletResponse response)
	  {
		  request.setAttribute("main_jsp", "../reserve/reserve_main.jsp");
		  return "../main/main.jsp";
	  }
	  @RequestMapping("reserve/inwon.do")
	  public String reserve_inwon(HttpServletRequest request,HttpServletResponse response)
	  {
		  return "../reserve/inwon.jsp";
	  }
	  
	  @RequestMapping("reserve/reserve_ok.do")
	  public String reserve_ok(HttpServletRequest request,HttpServletResponse response)
	  {
		  try
		  {
			  request.setCharacterEncoding("UTF-8");
		  }catch(Exception ex) {}
		  String eno=request.getParameter("eno");
		  String rday=request.getParameter("rday");
		  String inwon=request.getParameter("inwon");
		  // DAO연결 
		  /*System.out.println("eno="+eno);
		  System.out.println("rday="+rday);
		  System.out.println("rtime="+rtime);
		  System.out.println("inwon="+inwon);*/
		  HttpSession session=request.getSession();
		  String id=(String)session.getAttribute("id");
		  
		  ReserveVO vo=new ReserveVO();
		  vo.setEno(Integer.parseInt(eno));
		  vo.setId(id);
		  vo.setRday(rday);
		  vo.setInwon(inwon);
		  
		  ReserveDAO dao=ReserveDAO.newInstance();
		  dao.reserve_ok(vo);
		  System.out.println(rday);
		  System.out.println(id);
		  System.out.println(inwon);
		  return "redirect:../mypage/myReserv.do";
	  }
	  @RequestMapping("reserve/reserve_info.do")
	  public String reserve_info(HttpServletRequest request,
			  HttpServletResponse response)
	  {
		  String no=request.getParameter("no"); // 예약정보
		  String eno=request.getParameter("eno"); // 맛집 정보 읽기
		  // DataBase 
		  ReserveDAO dao=ReserveDAO.newInstance();
		  ReserveVO rvo=dao.reserveInfoData(Integer.parseInt(no));
		  ExVO evo=dao.reserveexInfoData(Integer.parseInt(eno));
		  request.setAttribute("evo", evo);
		  request.setAttribute("rvo", rvo);
		  return "../reserve/reserve_info.jsp";
	  }
}