package com.sist.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.dao.QnaBoardDAO;
import com.sist.vo.QnaBoardVO;

public class QnaBoardModel {
	@RequestMapping("board/qnaboard.do")
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
	        QnaBoardDAO dao=QnaBoardDAO.newInstance();
	        List<QnaBoardVO> list=dao.QnaListData(curpage);
	        int count=dao.qnaboardRowCount();
	        int totalpage=(int)(Math.ceil(count/12.0));
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
}
