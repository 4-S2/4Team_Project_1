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
	
	// 회원 관리 => 회원정보목록
	@RequestMapping("admin/main.do")
	public String admin_main(HttpServletRequest request,HttpServletResponse response) {
		  try { request.setCharacterEncoding("UTF-8"); 
		  	}catch (Exception e) {}
		  HttpSession session=request.getSession();
			String id=(String)session.getAttribute("id");
		
		  //관리자 예외처리 
		  if(session.getAttribute("id")==null) {
			  return "redirect:../main/main.do"; 
		  }
		  String admin = (String)session.getAttribute("admin"); 
		  if(admin.equals("y")) {
			  String page=request.getParameter("page");
			  if(page==null)
				  page="1";
			  int curpage=Integer.parseInt(page);
			  
			  List<MemberVO> mlist = dao.memberListData(curpage);
			  int mSize = mlist.size();
			  
			  int totalpage=dao.memberListTotalPage();
			  System.out.println(totalpage);
			  
				final int BLOCK=10;
				int startPage=((curpage-1)/BLOCK)*BLOCK+1;
				int endPage=((curpage-1)/BLOCK)*BLOCK+BLOCK;
				if(totalpage<endPage) 
					endPage=totalpage;
				
			  
			  request.setAttribute("curpage", curpage);
			  request.setAttribute("totalpage", totalpage);
			  request.setAttribute("startPage", startPage);
			  request.setAttribute("endPage", endPage);
			  request.setAttribute("mSize", mSize); 
			  request.setAttribute("mlist", mlist);
			  request.setAttribute("admin_jsp", "../admin/admin_member.jsp");
			  request.setAttribute("main_jsp", "../admin/admin_main.jsp"); 
			  return "../main/main.jsp"; 
		  } 
		  return "redirect:../main/main.do"; 
	}
	
	// 회원정보 상세
	@RequestMapping("admin/member_detail.do")
	public String memberDetail(HttpServletRequest request, HttpServletResponse response) {
		String id=request.getParameter("id");
		MemberVO vo=dao.memberDetailData(id);
		request.setAttribute("vo", vo);
		return "../admin/admin_member_detail.jsp";
	}
	
	// 회원정보 수정
	@RequestMapping("admin/member_detail_edit.do")
	public void memberModify(HttpServletRequest request, HttpServletResponse response) {
		try {
	        response.setContentType("text/html;charset=UTF-8");
		}catch (Exception e) {}
			MemberVO vo=new MemberVO();
			vo.setId(request.getParameter("id"));
			vo.setName(request.getParameter("name"));
			vo.setEmail(request.getParameter("email"));
			vo.setPostcode(request.getParameter("postcode"));
			vo.setAddr(request.getParameter("addr"));
			vo.setDetail_addr(request.getParameter("daddr"));
			vo.setPhone(request.getParameter("phone"));
			vo.setAdmin(request.getParameter("admin"));
		
		int success=dao.adEditProfile(vo);
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
	
	//회원 탈퇴
	@RequestMapping("admin/member_delete.do")
	public void member_delete(HttpServletRequest request, HttpServletResponse response) {
		String id=request.getParameter("id");
		int success= dao.memberDeleteOk(id);
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
	
//----------------------
	// 예약 목록
	@RequestMapping("admin/admin_reserv.do")
	public String admin_reserv(HttpServletRequest request,HttpServletResponse response) {
			String page=request.getParameter("page");
			if(page==null)
				page="1";
			int curpage=Integer.parseInt(page);
			
		    // 탭에 대한 정보를 파라미터로 받아옴 (예: tab=1, tab=2 등)
			String tab = request.getParameter("tab");
			if(tab==null)
				tab="1";
		    
		    int startPage=0, endPage=0, totalpage=0;
			
			  if ("2".equals(tab)) {
			        // 전시회
			        totalpage = dao.adreservationRowCount();
			        final int BLOCK = 5;
			        startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
			        endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;
			        if (endPage > totalpage) endPage = totalpage;
			        
			        List<ReserveInfoVO> rlist = dao.adExReserveList(curpage);
			        
					request.setAttribute("rlist", rlist);
			    } else if ("1".equals(tab)) {
			        // 맛집
			        totalpage = dao.adfdreservationRowCount();
			        final int BLOCK = 5;
			        startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
			        endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;
			        if (endPage > totalpage) endPage = totalpage;
			        
			        List<FoodReserveVO> flist = dao.adFdReserveList(curpage);
			        
			        request.setAttribute("flist", flist);
			    }
			
			int rSize = dao.adTotalresCount();
			request.setAttribute("rSize",rSize);  
		  
			request.setAttribute("curpage", curpage);
			request.setAttribute("totalpage", totalpage);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("admin_jsp", "../admin/admin_reserv.jsp");
			request.setAttribute("main_jsp", "../admin/admin_main.jsp");
			return "../main/main.jsp";
	}
	
	// 맛집 예약 승인
	@RequestMapping("admin/admin_fReserve_ok.do")
	public String stateChange3(HttpServletRequest request, HttpServletResponse response) {
		String rno=request.getParameter("rno");
		String rstate=request.getParameter("rstate");
		
		dao.admin_fdReserve_ok(Integer.parseInt(rno),Integer.parseInt(rstate));
		
		return "redirect:../admin/admin_reserv.do";
	}
	
	// 전시회 예약 승인
	@RequestMapping("admin/admin_exReserve_ok.do")
	public String stateChange2(HttpServletRequest request, HttpServletResponse response) {
		String no=request.getParameter("no");
		String rs=request.getParameter("rs");
		
		dao.admin_exReserve_ok(Integer.parseInt(no),Integer.parseInt(rs));
		
		return "redirect:../admin/admin_reserv.do?tab=2";
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
	@RequestMapping("admin/goodsDelete.do")
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
