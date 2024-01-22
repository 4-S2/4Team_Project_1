package com.sist.model;

import java.io.*;
import java.nio.file.Files;
import java.text.*;
import java.util.*;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;
public class ReviewModel{
	
	@RequestMapping("busan/review.do")
	public String review_list(HttpServletRequest request, HttpServletResponse response){
		
		//1. 페이지 받기
		String page=request.getParameter("page");
		String no=request.getParameter("no");
		String cateno = request.getParameter("cateno");
		if(page==null) {
			page="1";
		}
        int curpage=Integer.parseInt(page);
        
        // 2. 데이터베이스 연결
        ReviewDAO dao=ReviewDAO.newInstance();
		List<ReviewVO> rlist=dao.reviewListData(curpage,Integer.parseInt(cateno),Integer.parseInt(no));
		
		int count=dao.ReviewRowCount();
		int totalpage=(int)(Math.ceil(count/10.0));
		count=count-((curpage*10)-10);
		
		/*
		 * final int BLOCK=5; int startPage=((curpage-1)/BLOCK*BLOCK)+1; int
		 * endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		 * 
		 * if(endPage>totalpage) {endPage=totalpage;}
		 */
		request.setAttribute("no", no);
        request.setAttribute("curpage", curpage);
        request.setAttribute("count", count);
        request.setAttribute("totalpage", totalpage);
        request.setAttribute("rlist", rlist);
        request.setAttribute("today", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
        request.setAttribute("main_jsp", "../busan/review.jsp");
		return "../busan/review.jsp";
	}
	
	 
	@RequestMapping("busan/review_detail.do")
    public String board_detail(HttpServletRequest request, HttpServletResponse response) {
		String no=request.getParameter("no");
		String rno=request.getParameter("rno");
		ReviewDAO dao=ReviewDAO.newInstance();
		ReviewVO rvo=dao.reviewDetailData(Integer.parseInt(rno));
		request.setAttribute("rvo", rvo);
		request.setAttribute("rno", rno);
		request.setAttribute("no", no);
		
		request.setAttribute("main_jsp", "../board/review.jsp");
		return "../main/main.jsp";
    }
	
	
	// 추가
	@RequestMapping("busan/review_insert.do")
	public String review_insert(HttpServletRequest request, HttpServletResponse response){   
		String no=request.getParameter("no");
		request.setAttribute("no", no);
		return "../busan/review_insert.jsp";
	}
	
	
	    
	@RequestMapping("busan/review_insert_ok.do")
	public String review_insert_ok(HttpServletRequest request, HttpServletResponse response) {
	    try {
	        request.setCharacterEncoding("UTF-8");

	        
	        //String currentDirectory = System.getProperty("user.dir");

	        
	        //String path="/Users/yoonsaiyoung/Desktop/download";
	        String path = "C:\\download";
	        //String path = currentDirectory + File.separator + "upload";
	        File downloadDirectory = new File(path);
	        if (!downloadDirectory.exists()) {
	            downloadDirectory.mkdirs();
	        }

	        String enctype = "UTF-8";
	        int max_size = 1024 * 1024 * 500;

	        MultipartRequest mr = new MultipartRequest(request, path, max_size, enctype, new DefaultFileRenamePolicy());
	        String score = mr.getParameter("score");
	        String cateno = mr.getParameter("cateno");
	        String cont = mr.getParameter("cont");
	        String no = mr.getParameter("no");
	        String password = mr.getParameter("password");
	        String upload = mr.getFilesystemName("upload");

	        HttpSession session = request.getSession();
	        String id = (String) session.getAttribute("id");

	        System.out.println(score);
	        System.out.println(cateno);
	        System.out.println(id);
	        System.out.println(cont);
	        System.out.println(no);
	        System.out.println(password);

	        // 파일 저장 경로
	        String filePath = path + File.separator + upload;
	        System.out.println(filePath);

	        // 파일의 길이 얻기
	        long fileLength = new File(filePath).length();

	        // 파일을 바이트 배열로 읽어오기
	        byte[] fileBytes = Files.readAllBytes(new File(filePath).toPath());

	        // 바이트 배열을 Base64로 인코딩하여 문자열로 변환
	        String encodedString = Base64.getEncoder().encodeToString(fileBytes);

	        ReviewVO rvo = new ReviewVO();
	        rvo.setScore(Integer.parseInt(score));
	        rvo.setCateno(Integer.parseInt(cateno));
	        rvo.setId(id);
	        rvo.setCont(cont);
	        rvo.setPassword(password);
	        rvo.setNo(Integer.parseInt(no));
	        rvo.setImg(encodedString); // 인코딩된 문자열 저장

	        // 데이터베이스 연결
	        ReviewDAO dao = ReviewDAO.newInstance();
	        dao.reviewInsert(rvo);

	    } catch (Exception ex) {
	        ex.printStackTrace();
	    }

	    String no = request.getParameter("no");
	    return "../store/goods_detail.do?gno=" + no;
	}
	

	
	// 삭제
	@RequestMapping("busan/review_delete_ok.do")
	public void review_delete(HttpServletRequest request, HttpServletResponse response) {
		
		String gno=request.getParameter("gno");
		String rno=request.getParameter("rno");
		//String password=request.getParameter("password");
		ReviewDAO dao=ReviewDAO.newInstance();
		String result=dao.reviewDeleteData(Integer.parseInt(rno));
		//String result=dao.reviewDelete(Integer.parseInt(rno), password);
		
		request.setAttribute("gno", gno);
		
		try {
			PrintWriter out=response.getWriter();
			out.write(result);
		}catch(Exception ex) {}
	}
	
	// 수정
	@RequestMapping("busan/review_update.do")
	public String review_update(HttpServletRequest request, HttpServletResponse response) {
		
		String gno=request.getParameter("gno");
		String rno=request.getParameter("rno");
		ReviewDAO dao=ReviewDAO.newInstance();
		ReviewVO rvo=new ReviewVO();
		request.setAttribute("rvo", rvo);
		request.setAttribute("main_jsp", "../busan/review_update.jsp");
		return "../busan/review_update.jsp";
	}
	
	@RequestMapping("busan/review_update_ok.do")
	public void review_update_ok(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		
		String gno=request.getParameter("gno");
		String rno=request.getParameter("rno");
		String score=request.getParameter("score");
		String cont=request.getParameter("cont");
		String img=request.getParameter("img");
		String password=request.getParameter("password");
		
		ReviewVO rvo=new ReviewVO();
		rvo.setRno(Integer.parseInt(rno));
		rvo.setScore(Integer.parseInt(score));
		rvo.setCont(cont);
		rvo.setImg(img);
		rvo.setPassword(password);
	   
		ReviewDAO dao=ReviewDAO.newInstance();
		String res=dao.reviewUpdate(rvo);
		try {
			PrintWriter out=response.getWriter();
			out.write(res);
		} catch(Exception ex) {}
	}
	
}