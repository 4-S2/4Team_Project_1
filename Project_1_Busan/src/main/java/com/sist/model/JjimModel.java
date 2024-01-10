package com.sist.model;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.JjimDAO;

public class JjimModel {
   @RequestMapping("busan/jjim.do")
	public void busan_jjim(HttpServletRequest request, HttpServletResponse response)
	{
	   try {
		   request.setCharacterEncoding("UTF-8");
	   }catch(Exception e) {e.printStackTrace();}
	   String no=request.getParameter("no");
	   String cateno=request.getParameter("cateno");
	   HttpSession session=request.getSession();
	   String id=(String)session.getAttribute("id");
	   JjimDAO dao=JjimDAO.newInstance();
	   String res=dao.jjimUpdate(id, Integer.parseInt(cateno), Integer.parseInt(no));
	   
	   try {
		   PrintWriter out=response.getWriter();
		   out.write(res);
	   }catch(Exception e) {e.printStackTrace();}
	}
   
   @RequestMapping("busan/jjim.do")
	public void ex_busan_jjim(HttpServletRequest request, HttpServletResponse response)
	{
	   try {
		   request.setCharacterEncoding("UTF-8");
	   }catch(Exception e) {e.printStackTrace();}
	   String eno=request.getParameter("eno");
	   String cateno=request.getParameter("cateno");
	   HttpSession session=request.getSession();
	   String id=(String)session.getAttribute("id");
	   JjimDAO dao=JjimDAO.newInstance();
	   String res=dao.ex_jjimUpdate(id, Integer.parseInt(cateno), Integer.parseInt(eno));
	   
	   try {
		   PrintWriter out=response.getWriter();
		   out.write(res);
	   }catch(Exception e) {e.printStackTrace();}
	}
    
}
