package com.sist.model;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.dao.QnaBoardDAO;
import com.sist.vo.QnaBoardVO;

public class QnaBoardModel {
	@RequestMapping("board/qnaboard.do")
	   public String qnaboard_list(HttpServletRequest request,
	           HttpServletResponse response)
	   {
	        // DB연동 
	        //1. 요청값 받기
	        String page=request.getParameter("page");
	        if(page==null)
	           page="1";
	        int curpage=Integer.parseInt(page);
	        //2. DB연동 
	        QnaBoardDAO dao=QnaBoardDAO.newInstance();
	        List<QnaBoardVO> list=dao.QnaListData(curpage);
	        int count=dao.qnaboardRowCount();
	        int totalpage=(int)(Math.ceil(count/10.0));
	        count=count-((curpage*10)-10);
	        
	         final int BLOCK=5;
	         int startPage=((curpage-1)/BLOCK*BLOCK)+1;
	         int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
	         
	         if(endPage>totalpage)
	            endPage=totalpage;
	        
	        request.setAttribute("curpage", curpage);
	        request.setAttribute("count", count);
	        request.setAttribute("totalpage", totalpage);
	        request.setAttribute("startPage", startPage);
	        request.setAttribute("endPage", endPage);
	        request.setAttribute("list", list);
	        //3. 결과값 모아서 request에 저장 
	        request.setAttribute("main_jsp", "../board/qnaboard.jsp");
	        return "../main/main.jsp";
	   }
	@RequestMapping("board/qnaboard_find.do")
	   public String qnaboard_find(HttpServletRequest request,
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
	        QnaBoardDAO dao=QnaBoardDAO.newInstance();
	        List<QnaBoardVO> list=dao.QnaFindListData(curpage, word);
	        int count=list.size();
	        int totalpage=(int)(Math.ceil(count/10.0));
	        count=count-((curpage*10)-10);
	        
	         final int BLOCK=5;
	         int startPage=((curpage-1)/BLOCK*BLOCK)+1;
	         int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
	         
	         if(endPage>totalpage)
	            endPage=totalpage;
	        
	        request.setAttribute("curpage", curpage);
	        request.setAttribute("count", count);
	        request.setAttribute("totalpage", totalpage);
	        request.setAttribute("startPage", startPage);
	        request.setAttribute("endPage", endPage);
	        request.setAttribute("list", list);
	        //3. 결과값 모아서 request에 저장 
	        request.setAttribute("main_jsp", "../board/qnaboard.jsp");
	        return "../main/main.jsp";
	   }
	@RequestMapping("board/qnaboard_detail.do")
	   public String qnaboard_detail(HttpServletRequest request,
	           HttpServletResponse response)
	   {
	        // DB연동 
	        //1. 요청값 받기
	        String qno=request.getParameter("qno");
	        
	        QnaBoardDAO dao=QnaBoardDAO.newInstance();
	        QnaBoardVO vo=dao.QnaDetailData(Integer.parseInt(qno));
	        
	        request.setAttribute("vo", vo);
	        request.setAttribute("main_jsp", "../board/qnaboard_detail.jsp");
	        return "../main/main.jsp";
	   }
	@RequestMapping("board/qnaboard_insert.do")
	   public String qnaboard_insert(HttpServletRequest request,
	           HttpServletResponse response)
	   {
		request.setAttribute("main_jsp", "../board/qnaboard_insert.jsp");
        return "../main/main.jsp";
	   }
	@RequestMapping("board/qnaboard_insert_ok.do")
	   public String qnaboard_insert_ok(HttpServletRequest request,
	           HttpServletResponse response)
	   {
	        try {
	        	request.setCharacterEncoding("UTF-8");
	        }catch(Exception e) {}
	        String name=request.getParameter("name");
	        String subject=request.getParameter("subject");
	        String cont=request.getParameter("cont");
	        String pwd=request.getParameter("pwd");
	        
	        QnaBoardVO vo=new QnaBoardVO();
	        vo.setName(name);
	        vo.setSubject(subject);
	        vo.setPwd(pwd);
	        vo.setCont(cont);
	        QnaBoardDAO dao=QnaBoardDAO.newInstance();
	        dao.QnaInsertData(vo);
	        
	        return "redirect:../board/qnaboard.do";
	   }
	@RequestMapping("board/qnaboard_update.do")
	   public String qnaboard_update(HttpServletRequest request,
	           HttpServletResponse response)
	   {
		// DB연동 
        //1. 요청값 받기
        String qno=request.getParameter("qno");
        
        QnaBoardDAO dao=QnaBoardDAO.newInstance();
        QnaBoardVO vo=dao.QnaDetailData(Integer.parseInt(qno));
        
        request.setAttribute("vo", vo);
        request.setAttribute("main_jsp", "../board/qnaboard_update.jsp");
        return "../main/main.jsp";

	   }
	@RequestMapping("board/qnaboard_update_ok.do")
	   public void qnaboard_update_ok(HttpServletRequest request,
	           HttpServletResponse response)
	   {

		try {
        	request.setCharacterEncoding("UTF-8");
        }catch(Exception e) {}
         String qno=request.getParameter("qno");
         String name=request.getParameter("name");
         String subject=request.getParameter("subject");
         String cont=request.getParameter("cont");
         String pwd=request.getParameter("pwd");
         QnaBoardVO vo=new QnaBoardVO();
         vo.setQno(Integer.parseInt(qno));
	     vo.setName(name);
	     vo.setSubject(subject);
	     vo.setPwd(pwd);
	     vo.setCont(cont);
     
         QnaBoardDAO dao=QnaBoardDAO.newInstance();
         String res=dao.boardUpdate(vo);
         
         
         try {
        	 PrintWriter out=response.getWriter();
        	 out.write(res);
         }catch(Exception e) {}

	   }
	@RequestMapping("board/qnaboard_delete.do")
	   public void qnaboard_delete(HttpServletRequest request,
	           HttpServletResponse response)
	   {

      String qno=request.getParameter("qno");
      String pwd=request.getParameter("pwd");
      
      QnaBoardDAO dao=QnaBoardDAO.newInstance();
      String result=dao.QnaDeleteData(Integer.parseInt(qno), pwd);
      
      
      try {
     	 PrintWriter out=response.getWriter();
     	 out.write(result);
      }catch(Exception e) {}

	   }
}
