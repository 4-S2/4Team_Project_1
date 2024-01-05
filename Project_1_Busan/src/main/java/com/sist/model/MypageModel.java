package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;

import java.io.PrintWriter;
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
	  
		  MypageDAO dao=MypageDAO.newInstance(); 
		  MemberVO vo=dao.myprofile(id);
		  
			String telNo1= vo.getPhone().substring(0,3);
			String telNo2= vo.getPhone().substring(3,7);
			String telNo3= vo.getPhone().substring(7,11);
			request.setAttribute("vo", vo);
			request.setAttribute("telNo1", telNo1);
			request.setAttribute("telNo2", telNo2);
			request.setAttribute("telNo3", telNo3);
		  request.setAttribute("mypage_jsp","editProfile.jsp"); 
		  request.setAttribute("main_jsp","../mypage/mypage_main.jsp"); 
		  
		  return "../main/main.jsp"; 
	  }
	 
	// 회원정보수정
	@RequestMapping("mypage/editProfile.do")
	public void mypage_editProfile(HttpServletRequest request, HttpServletResponse response)
	{
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		try
		{
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		String pwd=request.getParameter("pwd");
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String postcode=request.getParameter("postcode");
		String addr=request.getParameter("addr");
		String daddr=request.getParameter("daddr");
		String phone=request.getParameter("phone");
		
		MemberVO vo=new MemberVO();
		vo.setId(id);
		vo.setPwd(pwd);
		vo.setName(name);
		vo.setEmail(email);
		vo.setPostcode(postcode);
		vo.setAddr(addr);
		vo.setDetail_addr(daddr);
		vo.setPhone(phone);
		
		MypageDAO dao=MypageDAO.newInstance();
		int success=dao.editProfile(vo);

		try
		{
			PrintWriter out=response.getWriter();
			if(success==1)
			{
				out.write("success");
			}
			else
			{
				out.write("fail");
			}
		}catch(Exception ex) 
		{
			ex.printStackTrace();
		}
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
	@RequestMapping("mypage/myInquiry.do")
	public String mypage_myqInquiry(HttpServletRequest request, HttpServletResponse response)
	{	
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		MypageDAO dao=MypageDAO.newInstance();
		/* MemberVO vo=dao.myprofile(id); */
		
		/* request.setAttribute("vo", vo); */
		request.setAttribute("mypage_jsp", "myInquiry.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		return "../main/main.jsp";
	}
	
	// 회원탈퇴
	@RequestMapping("mypage/myacc_delete.do")
	public String mypage_myacc_delete(HttpServletRequest request, HttpServletResponse response)
	{	
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		MypageDAO dao=MypageDAO.newInstance();
		/* MemberVO vo=dao.myprofile(id); */
		
		/* request.setAttribute("vo", vo); */
		request.setAttribute("mypage_jsp", "myacc_delete.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		return "../main/main.jsp";
	}
	
	// 회원탈퇴 확인
	@RequestMapping("mypage/myacc_delete_ok.do")
	public void mypage_myacc_delete_ok(HttpServletRequest request, HttpServletResponse response)
	{
		String pwd=request.getParameter("pwd");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");

		MypageDAO dao=MypageDAO.newInstance();
		String result=dao.myaccDeleteOk(id, pwd);
		if(result.equals("OK"))
		{
			session.invalidate();
		}
		try
		{
			PrintWriter out=response.getWriter();
			out.print(result);
		}catch(Exception ex) {}
	}
}
