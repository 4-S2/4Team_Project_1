package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;

public class FoodReserveModel {
	@RequestMapping("reserve/foodreserve_main.do")
	  public String reserve_main(HttpServletRequest request,
			  HttpServletResponse response)
	  {
		  String no=request.getParameter("no");
		  System.out.println(no);
		  return "../reserve/foodreserve_main.jsp";
	  }
	
}
