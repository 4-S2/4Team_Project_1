package com.sist.model;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
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
	        	
	        	//String path="C:\\Users\\"+System.getProperty("user.name")+"\\Downloads";
	        	request.setCharacterEncoding("UTF-8");
	 		   //String path="c:\\download";
	           String path = "C:\\download";
	           File downloadDirectory = new File(path);
	           if (!downloadDirectory.exists()) {
	               downloadDirectory.mkdirs();
	           }
	 		   String enctype="UTF-8";
	 		   int max_size=1024*1024*500;
	 		   MultipartRequest mr=
	 				   new MultipartRequest(request,path,max_size,enctype,
	 						   new DefaultFileRenamePolicy());
	 		   
	 		    String name=mr.getParameter("name");
			    String subject=mr.getParameter("subject");
			    String cont=mr.getParameter("cont");
			    String pwd=mr.getParameter("pwd");
			    String filename=mr.getFilesystemName("upload");
		        
		        HttpSession session=request.getSession();
		        String id=(String) session.getAttribute("id");
	            if(id==null) 
	            	id="";
	            
		        QnaBoardVO vo=new QnaBoardVO();
		        vo.setName(name);
				   vo.setCont(cont);
				   vo.setSubject(subject);
				   vo.setPwd(pwd);
				   vo.setId(id);
				   if(filename==null)
				   {
					   vo.setFilename("");
					   vo.setFilesize(0);
				   }
				   else
				   {
					   File file=new File(path+"\\"+filename);
					   vo.setFilename(filename);
					   vo.setFilesize((int)file.length());
				   }
		        QnaBoardDAO dao=QnaBoardDAO.newInstance();
		        dao.QnaInsertData(vo);
	        }catch(Exception e) {}
	        
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
      QnaBoardVO vo=dao.QnaDetailData(Integer.parseInt(qno));
      System.out.println(vo.getFilesize());
      if(vo.getFilesize()>0)
      {
    	  try
		   {   
    		   String filePath = "c:\\download\\" + vo.getFilename();
    		   System.out.println(filePath);
			   File file=new File(filePath);
			   file.delete();

		   }catch(Exception ex){}
      }
      
      try {
     	 PrintWriter out=response.getWriter();
     	 out.write(result);
      }catch(Exception e) {}

	   }
	@RequestMapping("board/download.do")
	   public void qnaboard_download(HttpServletRequest request,
	           HttpServletResponse response)
	   {
		try {
        	request.setCharacterEncoding("UTF-8");
        }catch(Exception e) {}
        String fn=request.getParameter("fn");
        
        try {
        	File file=new File("c:\\download\\"+fn);
        	response.setHeader("Content-Disposition","Attachment;filename="+URLEncoder.encode(fn, "UTF-8"));
        	response.setContentLength((int)file.length());
        	
        	BufferedInputStream bis=new BufferedInputStream(new FileInputStream(file));
        	BufferedOutputStream bos=new BufferedOutputStream(response.getOutputStream());
        	
        	byte[] buffer=new byte[1024];
        	int i=0;
        	while((i=bis.read(buffer,0,1024))!=-1)
        	{
        		bos.write(buffer,0,i);
        	}
        	bis.close();
        	bos.close();
        }catch(Exception e)
        {
        	e.printStackTrace();
        }

	   }
	
}
