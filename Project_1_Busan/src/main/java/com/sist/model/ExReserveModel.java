package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import java.util.*;
import java.text.*;
public class ExReserveModel {
  @RequestMapping("reserve/ex_reserve.do")
  public String reserve_date(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  String today=new SimpleDateFormat("yyyy-M-d").format(new Date());
	  StringTokenizer st=new StringTokenizer(today,"-");
	  int year=Integer.parseInt(st.nextToken());
	  int month=Integer.parseInt(st.nextToken());
	  int day=Integer.parseInt(st.nextToken());
	  String[] strWeek={"일","월","화","수","목","금","토"};
	  
	  // 요일 / 마지막 날 
	  Calendar cal=Calendar.getInstance();
	  cal.set(Calendar.YEAR, year);
	  cal.set(Calendar.MONTH, month-1);
	  cal.set(Calendar.DATE, 1);
	  int week=cal.get(Calendar.DAY_OF_WEEK);
	  week=week-1;
	  
	  int lastday=cal.getActualMaximum(Calendar.DATE);
	  
	  
	  request.setAttribute("main_jsp", "../reserve/ex_reserve.jsp");
	  return "../main/main.jsp";
  }
}