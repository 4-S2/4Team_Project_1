package com.sist.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.ReplyDAO;
import com.sist.vo.ReviewReplyVO;

public class ReplyModel {
	@RequestMapping("busan/review_reply.do")
	public String review_reply(HttpServletRequest request,
			HttpServletResponse response)
	{
		String rno=request.getParameter("rno");
		System.out.println(rno);
		request.setAttribute("rno", rno);
		return "../busan/reply.jsp";
	}
	@RequestMapping("busan/reply.do")
	public String reserve_main(HttpServletRequest request,
			HttpServletResponse response)
	{
		String rno=request.getParameter("rno");
		System.out.println(rno);
		ReplyDAO dao=ReplyDAO.newInstance();
		List<ReviewReplyVO> list=dao.replyListData(Integer.parseInt(rno));
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		request.setAttribute("id", id);
		request.setAttribute("list", list);
		request.setAttribute("rno", rno);
		return "../busan/reply_list.jsp";
	}
	@RequestMapping("busan/reply_insert.do")
	public String reply_insert(HttpServletRequest request,
			HttpServletResponse response)
	{
		try {
			request.setCharacterEncoding("UTF-8");
		}catch(Exception e) {}
		String rno=request.getParameter("rno");
		System.out.println(rno);
		String cont=request.getParameter("cont");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		ReviewReplyVO vo=new ReviewReplyVO();
		vo.setCont(cont);
		vo.setId(id);
		vo.setRno(Integer.parseInt(rno));
		
		ReplyDAO dao=ReplyDAO.newInstance();
		dao.replyInsertData(vo);
		 return "redirect:../busan/reply.do?rno=" + rno;
	}
	@RequestMapping("busan/reply_delete.do")
	public String reply_delete(HttpServletRequest request,
			HttpServletResponse response)
	{

		String rrno=request.getParameter("rrno");
		String rno=request.getParameter("rno");
		System.out.println(rrno);
		
		ReplyDAO dao=ReplyDAO.newInstance();
		dao.replyDeleteData(Integer.parseInt(rrno));
		return "redirect:../busan/reply.do?rno=" + rno;
	}
	@RequestMapping("busan/reply_update.do")
	public String reply_update(HttpServletRequest request,
			HttpServletResponse response)
	{
		try {
			request.setCharacterEncoding("UTF-8");
		}catch(Exception e) {}
		String rrno=request.getParameter("rrno");
		String rno=request.getParameter("rno");
		String cont=request.getParameter("cont");
		
		ReviewReplyVO vo=new ReviewReplyVO();
		vo.setCont(cont);
		vo.setRrno(Integer.parseInt(rrno));
		ReplyDAO dao=ReplyDAO.newInstance();
		dao.replyupdateData(vo);
		return "redirect:../busan/reply.do?rno=" + rno;
	}
	
	@RequestMapping("busan/reply_reReply.do")
	public String reply_reReply(HttpServletRequest request,
			HttpServletResponse response)
	{
		try {
			request.setCharacterEncoding("UTF-8");
		}catch(Exception e) {}
		String rno=request.getParameter("rno");
		String rrno=request.getParameter("rrno");
		String gid=request.getParameter("gid");
		System.out.println(rrno);
		String cont=request.getParameter("cont");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		ReviewReplyVO vo=new ReviewReplyVO();
		vo.setCont(cont);
		vo.setId(id);
		vo.setRoot(Integer.parseInt(rrno));
		vo.setRno(Integer.parseInt(rno));
		vo.setGroup_id(Integer.parseInt(gid));
		
		ReplyDAO dao=ReplyDAO.newInstance();
		dao.reReplyInsertData(vo);
		 return "redirect:../busan/reply.do?rno=" + rno;
	}
	
}
