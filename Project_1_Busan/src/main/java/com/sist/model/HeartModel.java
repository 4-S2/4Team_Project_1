package com.sist.model;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.HeartDAO;

public class HeartModel {
   @RequestMapping("busan/heart.do")
	public void busan_Heart(HttpServletRequest request, HttpServletResponse response)
	{
	   try {
		   request.setCharacterEncoding("UTF-8");
	   }catch(Exception e) {e.printStackTrace();}
	   String no=request.getParameter("no");
	   String cateno=request.getParameter("cateno");
	   HttpSession session=request.getSession();
	   String id=(String)session.getAttribute("id");
	   HeartDAO dao=HeartDAO.newInstance();
	   String res=dao.heartUpdate(id, Integer.parseInt(cateno), Integer.parseInt(no));
	   
	   try {
		   PrintWriter out=response.getWriter();
		   out.write(res);
	   }catch(Exception e) {e.printStackTrace();}
	}
   

   @RequestMapping("busan/ex_heart.do")
 	public void ex_busan_Heart(HttpServletRequest request, HttpServletResponse response)
 	{
 	   try {
 		   request.setCharacterEncoding("UTF-8");
 		   
 	   }catch(Exception e) {e.printStackTrace();}
 	   String eno=request.getParameter("eno");
 	   String cateno=request.getParameter("cateno");
 	   System.out.println(eno+" "+"cateno");
 	   HttpSession session=request.getSession();
 	   String id=(String)session.getAttribute("id");
 	   HeartDAO dao=HeartDAO.newInstance();
 	   String res=dao.heartUpdate(id, Integer.parseInt(cateno), Integer.parseInt(eno));
 	   
 	   try {
 		   PrintWriter out=response.getWriter();
 		   out.write(res);
 	   }catch(Exception e) {e.printStackTrace();}
 	}

   
    
}
