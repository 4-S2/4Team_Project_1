package com.sist.model;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.dao.GoodsDAO;
import com.sist.vo.GoodsVO;

public class GoodsModel {
	@RequestMapping("store/goods.do")
	public String store_goods_list(HttpServletRequest request, HttpServletResponse response) {
		// 요청값 받기
		String page=request.getParameter("page");
		if(page==null) {
			page="1";
		}
		int curpage=Integer.parseInt(page);
		  
		// DB연동 
		GoodsDAO dao=new GoodsDAO();
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
	public String store_goods_find(HttpServletRequest request, HttpServletResponse response) {
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
		if(sort==null||sort=="") {
			sort="gno";
		}
		System.out.println(page);
		System.out.println(word);
		int curpage=Integer.parseInt(page);
		
		GoodsDAO dao=new GoodsDAO();
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
	public String store_goods_detail(HttpServletRequest request, HttpServletResponse response) {
		String gno=request.getParameter("gno");

		GoodsDAO dao=new GoodsDAO();
		GoodsVO vo=dao.goodsDetailData(Integer.parseInt(gno));
		 
		List<GoodsVO> list=dao.goodsRandomList();
		request.setAttribute("list", list);
		
		request.setAttribute("vo", vo); 
		request.setAttribute("main_jsp", "../store/goods_detail.jsp");
		return "../main/main.jsp";
	}

	
	

}
