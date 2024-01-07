package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;

import java.io.PrintWriter;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.JjimVO;
import com.sist.vo.MemberVO;
import com.sist.vo.QnaBoardVO;
public class AdminModel {
	AdminDAO dao=AdminDAO.newInstance();
	
	// 회원 관리
	@RequestMapping("admin/admin_main.do")
	public String admin_main(HttpServletRequest request,HttpServletResponse response) {
/*		HttpSession session = request.getSession();
		if(session.getAttribute("id")==null) {
			return "redirect:../main/main.do";
		}

		String user_id = (String)session.getAttribute("id");
		
		if(user_id.equals("admin")) {
			List<ReserveVO> list=dao.admin_booking_list();
			request.setAttribute("list", list);
			request.setAttribute("admin_jsp", "../admin/admin_booking.jsp");
			request.setAttribute("main_jsp", "../admin/admin_main.jsp");
			return "../jsp/main/main.jsp";
		}

		return "redirect:../main/main.do";*/
		System.out.println(12345);
		List<MemberVO> mlist = dao.memberListData();
		
		
		request.setAttribute("mlist", mlist);
		request.setAttribute("admin_jsp", "admin_member.jsp");
		request.setAttribute("main_jsp", "../admin/admin_main.jsp");
		return "../main/main.jsp";
	}
}
