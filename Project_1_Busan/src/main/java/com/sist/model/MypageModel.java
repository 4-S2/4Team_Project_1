package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;

import java.io.UnsupportedEncodingException;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.MemberVO;

import oracle.net.ns.SessionAtts;

public class MypageModel {
	// 마이페이지 메인 (회원정보수정)
	  @RequestMapping("mypage/main.do") 
	  public String mypage_main(HttpServletRequest request, HttpServletResponse response) {
		  HttpSession session=request.getSession(); 
		  String id=(String)session.getAttribute("id");
	  
		  MypageDAO dao=MypageDAO.newInstance(); MemberVO vo=dao.myprofile(id);
	  
		  request.setAttribute("vo", vo); 
		  request.setAttribute("mypage_jsp","editProfile.jsp"); 
		  request.setAttribute("main_jsp","../mypage/mypage_main.jsp"); 
		  
		  return "../main/main.jsp"; 
	  }
	 
	// 회원정보수정
	@RequestMapping("mypage/editProfile.do")
	public String mypage_editProfile(HttpServletRequest request, HttpServletResponse response)
	{
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		MypageDAO dao=MypageDAO.newInstance();
		MemberVO vo=dao.myprofile(id);
		
		request.setAttribute("vo", vo);
		request.setAttribute("mypage_jsp", "editProfile.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		return "../main/main.jsp";
	}
	
	// 예약내역
	@RequestMapping("mypage/myReserv.do")
	public String mypage_myReserv(HttpServletRequest request, HttpServletResponse response)
	{	
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		MypageDAO dao=MypageDAO.newInstance();
		/* MemberVO vo=dao.myprofile(id); */
		
		/* request.setAttribute("vo", vo); */
		request.setAttribute("mypage_jsp", "myReserv.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		return "../main/main.jsp";
	}
	
	// 구매내역
	@RequestMapping("mypage/myCart.do")
	public String mypage_myCart(HttpServletRequest request, HttpServletResponse response)
	{	
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		MypageDAO dao=MypageDAO.newInstance();
		/* MemberVO vo=dao.myprofile(id); */
		
		/* request.setAttribute("vo", vo); */
		request.setAttribute("mypage_jsp", "myCart.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		return "../main/main.jsp";
	}
	
	// 찜목록
	@RequestMapping("mypage/myJjim.do")
	public String mypage_myJjim(HttpServletRequest request, HttpServletResponse response)
	{	
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		MypageDAO dao=MypageDAO.newInstance();
		/* MemberVO vo=dao.myprofile(id); */
		
		/* request.setAttribute("vo", vo); */
		request.setAttribute("mypage_jsp", "myJjim.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		return "../main/main.jsp";
	}
	
	// 문의내역
	@RequestMapping("mypage/myqInquiry.do")
	public String mypage_myqInquiry(HttpServletRequest request, HttpServletResponse response)
	{	
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		MypageDAO dao=MypageDAO.newInstance();
		/* MemberVO vo=dao.myprofile(id); */
		
		/* request.setAttribute("vo", vo); */
		request.setAttribute("mypage_jsp", "myqInquiry.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		return "../main/main.jsp";
	}
	
	// 회원탈퇴
	@RequestMapping("mypage/unregister.do")
	public String mypage_unregister(HttpServletRequest request, HttpServletResponse response)
	{	
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		MypageDAO dao=MypageDAO.newInstance();
		/* MemberVO vo=dao.myprofile(id); */
		
		/* request.setAttribute("vo", vo); */
		request.setAttribute("mypage_jsp", "unregister.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		return "../main/main.jsp";
	}
}
