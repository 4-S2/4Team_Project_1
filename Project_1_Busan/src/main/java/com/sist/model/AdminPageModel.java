package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;

import java.io.PrintWriter;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;
public class AdminPageModel {
	 AdminDAO dao=AdminDAO.newInstance(); 
	
	// 회원 관리
	@RequestMapping("admin/main.do")
	public String admin_main(HttpServletRequest request,HttpServletResponse response) throws Exception {
		System.out.println("관리자모델 실행");
/*		HttpSession session = request.getSession();
		if(session.getAttribute("id")==null) {
			return "redirect:../main/main.do";
		}

		String user_id = (String)session.getAttribute("id");
		
		if(user_id.equals("admin")) {
			List<ReserveVO> list=dao.admin_booking_list();
			request.setAttribute("list", list);
			request.setAttribute("admin_jsp", "../admin/admin_booking.jsp");
			request.setAttribute("main_jsp", "../admin/admin_main.jsp");
			return "../jsp/main/main.jsp";
		}

		return "redirect:../main/main.do";*/
		
/*
 * try { request.setCharacterEncoding("UTF-8"); } catch (Exception e) {}
 * System.out.println("관리자모델 실행");
 */
		request.setAttribute("admin_jsp", "../admin/admin_member.jsp");
		request.setAttribute("main_jsp", "../admin/admin_main.jsp");
		return "../main/main.jsp";
		//관리자 예외처리
		/*HttpSession session = request.getSession();
		if(session.getAttribute("id")==null) {
			return "redirect:../main/main.do";
		}
		String admin = (String)session.getAttribute("admin");
		if(admin.equals("y")) {
			List<MemberVO> mlist = dao.memberListData();
		  
			request.setAttribute("mlist", mlist);
			request.setAttribute("admin_jsp", "../admin/admin_member.jsp");
			request.setAttribute("main_jsp", "../admin/admin_main.jsp");
			return "../main/main.jsp";
		}
		return "redirect:../main/main.do";*/
	}
	
	//회원 탈퇴
	@RequestMapping("admin/member_delete.do")
	public void member_delete(HttpServletRequest request, HttpServletResponse response) {
		String id=request.getParameter("id");
		dao.memberDeleteOk(id);
	}
	
	// 특산물 리스트
	@RequestMapping("admin/admin_goods.do")
	public String admin_goods(HttpServletRequest request,HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {}
		
		String page=request.getParameter("page");
		String search=request.getParameter("search");
		if(search==null)
			search="";
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		AdminDAO dao=AdminDAO.newInstance();
		List<GoodsVO> list=dao.adGoodsListData(curpage, search);
		int totalpage=dao.adGoodsTotalPage(search);
		
		final int BLOCK=10;
		int startpage=((curpage-1)/BLOCK)*BLOCK+1;
		int endpage=((curpage-1)/BLOCK)*BLOCK+BLOCK;
		if(totalpage<endpage) {
			endpage=totalpage;
		}
		
		request.setAttribute("search", search);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		
		request.setAttribute("list", list);
		request.setAttribute("admin_jsp", "../admin/admin_goods.jsp");
		request.setAttribute("main_jsp", "../admin/admin_main.jsp");
		return "../main/main.jsp";
	}
	
	// 특산물 상세
	@RequestMapping("admin/admin_goods_detail.do")
	public String admin_goods_detail(HttpServletRequest request, HttpServletResponse response) {
		String gno=request.getParameter("gno");
		
		GoodsVO vo=dao.adGoodsDetailData(Integer.parseInt(gno));
		
		request.setAttribute("vo", vo);
		return "../admin/admin_goods_detail.jsp";
	}
				
	// 특산물 수정
	@RequestMapping("admin/admin_goods_edit.do")
	public void admin_goods_edit(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html;charset=UTF-8");
        
		try
		{
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		int gno = Integer.parseInt(request.getParameter("gno"));
		String gname=request.getParameter("gname");
		String poster=request.getParameter("poster");
		String origin=request.getParameter("origin");
		String manufacturer=request.getParameter("manufacturer");
		String price=request.getParameter("price");
		String dimage=request.getParameter("dimage");
		
		GoodsVO vo=new GoodsVO();
		vo.setGno(gno);
		vo.setGname(gname);
		vo.setPoster(poster);
		vo.setOrigin(origin);
		vo.setManufacturer(manufacturer);
		vo.setPrice(price);
		vo.setDimage(dimage);
		
		int success=dao.adGoodsUpdate(vo);
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
	
	// 특산물 삭제
	@RequestMapping("adminpage/goodsDelete.do")
	public void goodsDelete(HttpServletRequest request, HttpServletResponse response) {
		String gno=request.getParameter("gno");
		
		int success=dao.adGoodsDelete(Integer.parseInt(gno));
		try
		{
			PrintWriter out=response.getWriter();
			if(success==2) //order, goods 수정
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
}
