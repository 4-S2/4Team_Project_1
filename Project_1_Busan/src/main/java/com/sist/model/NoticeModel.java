package com.sist.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;

public class NoticeModel {
   @RequestMapping("board/notice.do")
   public String busan_tourList(HttpServletRequest request,
           HttpServletResponse response)
   {
        // DB연동 
        //1. 요청값 받기
        String page=request.getParameter("page");
        if(page==null)
           page="1";
        int curpage=Integer.parseInt(page);
        //2. DB연동 
        NoticeDAO dao=new NoticeDAO();
        List<NoticeVO> list=dao.noticeListData(curpage);
        int totalpage=dao.noticeListTotalPage();
        
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
        //3. 결과값 모아서 request에 저장 
        request.setAttribute("main_jsp", "../board/notice.jsp");
        return "../main/main.jsp";
   }
}