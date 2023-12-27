package com.sist.model;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.MemberVO;

public class MemberModel {
    @RequestMapping("member/join.do")
    public String member_join(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("main_jsp", "../member/join.jsp");
        return "../main/main.jsp";
    }

  
    @RequestMapping("member/idcheck.do")
    public String member_idcheck(HttpServletRequest request,
  		  HttpServletResponse response)
    {
  	  return "../member/idcheck.jsp";
    }
    

    @RequestMapping("member/idcheck_ok.do")
    public void member_idcheck_ok(HttpServletRequest request,
  		  HttpServletResponse response)
    {
  	  String id=request.getParameter("id");
  	  MemberDAO dao=MemberDAO.newInstance();
  	  int count=dao.memberIdCheck(id);
  	  System.out.println("ID check:"+count);
  	  try
  	  {
  		  // Ajax로 값을 전송 
  		  PrintWriter out=response.getWriter();
  		  out.write(String.valueOf(count));
  	  }catch(Exception ex){}
    }
    
    @RequestMapping("member/join_ok.do")
    public String member_join_ok(HttpServletRequest request,
  		  HttpServletResponse response)
    {
  	  try
  	  {
  		  request.setCharacterEncoding("UTF-8");
  	  }catch(Exception ex) {}
  	  String id=request.getParameter("id");
  	  String pwd=request.getParameter("pwd");
  	  String name=request.getParameter("name");
  	  String email=request.getParameter("email");
  	  String post=request.getParameter("post");
  	  
  	  String addr=request.getParameter("addr1");
  	  String Detail_addr=request.getParameter("addr2");
  	  String phone=request.getParameter("phone");
  	 
  	 
  	  
  	  MemberVO vo=new MemberVO();
  	  vo.setId(id);
  	  vo.setPwd(pwd);
  	  vo.setName(name);
  	  vo.setEmail(email);
  	  vo.setPostcode(post);
  	  vo.setAddr(addr);
  	  vo.setDetail_addr(Detail_addr);
  	  vo.setPhone(phone);
  	 
  	  
  	  MemberDAO dao=MemberDAO.newInstance();
  	  // 회원 가입되는 메소드 호출 
  	  dao.memberInsert(vo);
  	  return "redirect:../main/main.do";
    }
    @RequestMapping("member/login.do")
    public void member_login(HttpServletRequest request,
  		  HttpServletResponse response)
    {
  	  String id=request.getParameter("id");
  	  String pwd=request.getParameter("pwd");
  	  
  	  MemberDAO dao=MemberDAO.newInstance();
  	  MemberVO vo=dao.memberLogin(id, pwd);
  	  if(vo.getMsg().equals("OK"))
  	  {
  		  // 세션에 저장 
  		  HttpSession session=
  				  request.getSession();
  		  session.setAttribute("id", vo.getId());
  		  session.setAttribute("name", vo.getName());
  		  session.setAttribute("admin", vo.getAdmin());
  	  }
  	  
  	  // ajax로 전송 
  	  try
  	  {
  		  PrintWriter out=response.getWriter();
  		  out.write(vo.getMsg());
  	  }catch(Exception ex) {}
    }
    @RequestMapping("member/logout.do")
    public String member_logout(HttpServletRequest request,
  		  HttpServletResponse response)
    {
  	  HttpSession session=request.getSession();
  	  session.invalidate();
  	  return "redirect:../main/main.do";
    }
    
    
}