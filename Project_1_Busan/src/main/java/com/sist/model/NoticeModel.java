package com.sist.model;

import java.util.List;
import java.util.concurrent.atomic.AtomicIntegerArray;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;

public class NoticeModel {
   @RequestMapping("board/notice.do")
   public String notice_list(HttpServletRequest request,
           HttpServletResponse response)
   {
        // DB연동 
        //1. 요청값 받기
        String page=request.getParameter("page");
        if(page==null)
           page="1";
        int curpage=Integer.parseInt(page);
        //2. DB연동 
        NoticeDAO dao=NoticeDAO.newInstance();
        List<NoticeVO> list=dao.noticeListData(curpage);
        int count=dao.noticeListRowCount();
        int totalpage=(int)(Math.ceil(count/10.0));
        count=count-((curpage*10)-10);
        
         final int BLOCK=5;
         int startPage=((curpage-1)/BLOCK*BLOCK)+1;
         int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
         
         if(endPage>totalpage)
            endPage=totalpage;
        
        request.setAttribute("curpage", curpage);
        request.setAttribute("totalpage", totalpage);
        request.setAttribute("startPage", startPage);
        request.setAttribute("endPage", endPage);
        request.setAttribute("list", list);
        request.setAttribute("count", count);
        //3. 결과값 모아서 request에 저장 
        request.setAttribute("main_jsp", "../board/notice.jsp");
        return "../main/main.jsp";
   }
   @RequestMapping("board/notice_find.do")
   public String notice_find(HttpServletRequest request,
           HttpServletResponse response)
   {
        try {
        	request.setCharacterEncoding("UTF-8");
        }catch(Exception e) {}
        String page=request.getParameter("page");
        String word=request.getParameter("word");
        if(page==null)
           page="1";
        int curpage=Integer.parseInt(page);
        //2. DB연동 
        NoticeDAO dao=NoticeDAO.newInstance();
        List<NoticeVO> list=dao.noticeFindData(curpage, word);
        int count=dao.noticeListFindRowCount(word);
        int totalpage=(int)(Math.ceil(count/10.0));
        count=count-((curpage*10)-10);
        // 30개 30-10 =20
        // 30-(2*10)-10 => 30 20 10
         final int BLOCK=5;
         int startPage=((curpage-1)/BLOCK*BLOCK)+1;
         int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
         
         if(endPage>totalpage)
            endPage=totalpage;
        
        request.setAttribute("curpage", curpage);
        request.setAttribute("totalpage", totalpage);
        request.setAttribute("startPage", startPage);
        request.setAttribute("endPage", endPage);
        request.setAttribute("list", list);
        request.setAttribute("count", count);
        //3. 결과값 모아서 request에 저장 
        request.setAttribute("main_jsp", "../board/notice.jsp");
        return "../main/main.jsp";
   }
   @RequestMapping("board/notice_detail.do")
   public String notice_detail(HttpServletRequest request,
           HttpServletResponse response)
   {
        // DB연동 
	    String nno=request.getParameter("nno");
        //1. 요청값 받기
        NoticeDAO dao=NoticeDAO.newInstance();
        NoticeVO vo=dao.noticeDetailData(Integer.parseInt(nno));
        
        
        request.setAttribute("vo", vo);
        request.setAttribute("nno", nno);
        //3. 결과값 모아서 request에 저장 
        request.setAttribute("main_jsp", "../board/notice_detail.jsp");
        return "../main/main.jsp";
   }
   
   @RequestMapping("board/notice_insert.do")
   public String notice_insert(HttpServletRequest request,
           HttpServletResponse response)
   {
        
        request.setAttribute("main_jsp", "../board/notice_insert.jsp");
        return "../main/main.jsp";
   }
   
   @RequestMapping("board/notice_insert_ok.do")
	public String notice_insert_ok(HttpServletRequest request, HttpServletResponse response)
	{
		try {
			request.setCharacterEncoding("UTF-8");
			
		}catch(Exception e) {}
		String ntitle=request.getParameter("ntitle");
		String ncont=request.getParameter("ncont");
		/* String pwd=request.getParameter("pwd"); */
		
		NoticeVO vo=new NoticeVO();
		vo.setNtitle(ntitle);
		vo.setNcont(ncont);
		/* vo.setPwd(pwd); */
		
		NoticeDAO dao=NoticeDAO.newInstance();
		dao.noticeInsert(vo);
		
		return "redirect:../board/notice.do";
	}
   @RequestMapping("board/notice_delete.do")
	public String notice_delete(HttpServletRequest request, HttpServletResponse response)
	{
	   String nno=request.getParameter("nno");
		
		NoticeDAO dao=NoticeDAO.newInstance();
		dao.noticeDeleteData(Integer.parseInt(nno));
		return "redirect:../board/notice.do";
	}
   @RequestMapping("board/notice_update.do")
	public String notice_update(HttpServletRequest request, HttpServletResponse response)
	{
	   // DB연동 
	   String nno=request.getParameter("nno");
       //1. 요청값 받기
	   NoticeDAO dao=NoticeDAO.newInstance();
       NoticeVO vo=dao.noticeDetailData(Integer.parseInt(nno));
       request.setAttribute("vo", vo);
       request.setAttribute("nno", nno);
       //3. 결과값 모아서 request에 저장 
       request.setAttribute("main_jsp", "../board/notice_update.jsp");
       return "../main/main.jsp";
	}
   @RequestMapping("board/notice_update_ok.do")
	public String notice_update_ok(HttpServletRequest request, HttpServletResponse response)
	{
	   try {
			request.setCharacterEncoding("UTF-8");
			
		}catch(Exception e) {}
	    String nno=request.getParameter("nno");
		String ntitle=request.getParameter("ntitle");
		String ncont=request.getParameter("ncont");
		
		NoticeVO vo=new NoticeVO();
		vo.setNno(Integer.parseInt(nno));
		vo.setNtitle(ntitle);
		vo.setNcont(ncont);
		
		NoticeDAO dao=NoticeDAO.newInstance();
		dao.noticeUpdateData(vo);
		
		return "redirect:../board/notice_detail.do?nno="+nno;
	}
}