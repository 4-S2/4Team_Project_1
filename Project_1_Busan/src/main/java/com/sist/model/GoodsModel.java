package com.sist.model;

import java.io.PrintWriter;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;

public class GoodsModel {
	@RequestMapping("store/goods.do")
	public String goods_list(HttpServletRequest request, HttpServletResponse response) {
		// 요청값 받기
		String page=request.getParameter("page");
		if(page==null) {
			page="1";
		}
		int curpage=Integer.parseInt(page);
		  
		// DB연동 
		GoodsDAO dao=GoodsDAO.newInstance();
		List<GoodsVO> list=dao.goodsListData(curpage);
		int totalpage=dao.goodsListTotalPage();
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		   
		if(endPage>totalpage) {
			endPage=totalpage;
		}
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("list", list);
		  
		// 결과값 request에 저장
		request.setAttribute("main_jsp", "../store/goods.jsp");
		return "../main/main.jsp";
	}
	
	
	@RequestMapping("store/goods_find.do")
	public String goods_find(HttpServletRequest request, HttpServletResponse response) {
		try {
			  request.setCharacterEncoding("UTF-8");
		} catch(Exception ex) {}
		
		String page=request.getParameter("page");
		String word=request.getParameter("word");
		String sort=request.getParameter("sort");
		if(word==null) {
			word="";
		}
		if(page==null) {
			page="1";
		}
		if(sort==null||sort.equals("")) {
			sort="gno";
		}
		System.out.println(page);
		System.out.println(word);
		
		int curpage=Integer.parseInt(page);
		
		GoodsDAO dao=GoodsDAO.newInstance();
		List<GoodsVO> list=dao.goodsFindList(word, curpage, sort);
		int totalpage=dao.goodsFindTotalPage(word);
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		   
		if(endPage>totalpage) {
			endPage=totalpage;
		}
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("list", list);
		request.setAttribute("word", word);
		request.setAttribute("sort", sort);

		request.setAttribute("main_jsp", "../store/goods.jsp");
		return "../main/main.jsp";
	}
	
	
	@RequestMapping("store/goods_detail.do")
	public String goods_detail(HttpServletRequest request, HttpServletResponse response) {
		String gno=request.getParameter("gno");

		GoodsDAO dao=GoodsDAO.newInstance();
		GoodsVO vo=dao.goodsDetailData(Integer.parseInt(gno));
		 
		List<GoodsVO> list=dao.goodsRandomList();
		request.setAttribute("list", list);
		
		String price=vo.getPrice();
		price=price.replaceAll("[^0-9]","");
		
		vo.setPrice(price);
		request.setAttribute("vo", vo); 
		request.setAttribute("main_jsp", "../store/goods_detail.jsp");
		return "../main/main.jsp";
	}
	
	
	
	
	
	// 장바구니
	@RequestMapping("store/goods_cart.do")
	public void cart_insert(HttpServletRequest request, HttpServletResponse response) {
		String result="no";
		
		try {
			String gno=request.getParameter("gno");
			String price=request.getParameter("price");
			String count=request.getParameter("count");
			
			HttpSession session=request.getSession();
			String id=(String)session.getAttribute("id");
			
			CartVO vo=new CartVO();
			
			vo.setGno(Integer.parseInt(gno));
			vo.setId(id);
			vo.setPrice(Integer.parseInt(price));
			vo.setAmount(Integer.parseInt(count));
			
			GoodsDAO dao=GoodsDAO.newInstance();
            result=dao.cartGoodsInsert(vo);
            
		} catch(Exception ex) {
			
			ex.printStackTrace();
		}
		
		try {
			PrintWriter out=response.getWriter();
			out.write(result);
		} catch(Exception ex) {}
	}
	
	
	@RequestMapping("store/goods_buy.do")
	  public static void cart_buy_insert(HttpServletRequest request, HttpServletResponse response){
		  String result="";
			 
		  try {
			  String gno=request.getParameter("gno");
			  String price=request.getParameter("price");
			  String count=request.getParameter("count");
			  HttpSession session=request.getSession();
			  String id=(String)session.getAttribute("id");
			  CartVO vo=new CartVO();
			  vo.setAmount(Integer.parseInt(count));
			  vo.setGno(Integer.parseInt(gno));
			  vo.setId(id);
			  vo.setPrice(Integer.parseInt(price));
			  
			  // 상품을 구매 목록에 추가
			  GoodsDAO dao=GoodsDAO.newInstance();
			  dao.cartGoodsBuyInsert(vo);
            
			  result="yes";
		  } catch(Exception ex) {
			  result="no";
			  ex.printStackTrace();
		  }
		  
		  try{
			  PrintWriter out=response.getWriter();
			  out.write(result);
		  } catch(Exception ex) {}
	  }

	
	  // 장바구니 삭제
	  @RequestMapping("store/cart_delete.do")
	  public String cart_delete(HttpServletRequest request, HttpServletResponse response) {
		  String gno=request.getParameter("gno");
		  
		  // DB연동 
		  GoodsDAO dao=GoodsDAO.newInstance();
		  dao.cartGoodsDelete(Integer.parseInt(gno));
		  return "redirect:../mypage/myCart.do";
	  }
	
	
	  @RequestMapping("store/cart_buy_update.do")
	  public String cart_buy_update(HttpServletRequest request, HttpServletResponse response) {
		  String gno=request.getParameter("gno");
		  // DB연동
		   
		  GoodsDAO dao=GoodsDAO.newInstance();
	      dao.cartGoodsBuyUpdate(Integer.parseInt(gno));
		  return "redirect:../mypage/myCart.do";
	  }
	  
	  
}
