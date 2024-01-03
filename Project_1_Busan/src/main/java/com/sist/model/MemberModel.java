package com.sist.model;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.MemberVO;

public class MemberModel {
    @RequestMapping("member/join.do")
    public String member_join(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("main_jsp", "../member/join.jsp");
        return "../main/main.jsp";
    }

  
    @RequestMapping("member/idcheck.do")
    public String member_idcheck(HttpServletRequest request,
  		  HttpServletResponse response)
    {
  	  return "../member/idcheck.jsp";
    }
    

    @RequestMapping("member/idcheck_ok.do")
    public void member_idcheck_ok(HttpServletRequest request,
  		  HttpServletResponse response)
    {
  	  String id=request.getParameter("id");
  	  MemberDAO dao=MemberDAO.newInstance();
  	  int count=dao.memberIdCheck(id);
  	  System.out.println("ID check:"+count);
  	  try
  	  {
  		  // Ajax로 값을 전송 
  		  PrintWriter out=response.getWriter();
  		  out.write(String.valueOf(count));
  	  }catch(Exception ex){}
    }
    
    @RequestMapping("member/join_ok.do")
    public String member_join_ok(HttpServletRequest request,
  		  HttpServletResponse response)
    {
  	  try
  	  {
  		  request.setCharacterEncoding("UTF-8");
  	  }catch(Exception ex) {}
  	  String id=request.getParameter("id");
  	  String pwd=request.getParameter("password");
  	  String email=request.getParameter("email");
  	  String name=request.getParameter("name");
  	  String phone=request.getParameter("phone");
  	  String postcode=request.getParameter("postal_code"); 
  	  String addr=request.getParameter("address");
  	  String Detail_addr=request.getParameter("detail_address");
  	  
  	 
  	 
  	  
  	  MemberVO vo=new MemberVO();
  	  vo.setId(id);
  	  vo.setPwd(pwd);
  	  vo.setEmail(email);
  	  vo.setName(name);
  	  vo.setPhone(phone);
  	  vo.setPostcode(postcode);
  	  vo.setAddr(addr);
  	  vo.setDetail_addr(Detail_addr);
  	  
  	 
  	  
  	  MemberDAO dao=MemberDAO.newInstance();
  	  // 회원 가입되는 메소드 호출 
  	  dao.memberInsert(vo);
  	  
  	 MemberVO loginVO = dao.memberLogin(id, pwd);
     if (loginVO.getMsg().equals("OK")) {
         // 세션에 사용자 정보 저장
         HttpSession session = request.getSession();
         session.setAttribute("id", loginVO.getId());
         session.setAttribute("email", loginVO.getEmail());
         session.setAttribute("name", loginVO.getName());
         session.setAttribute("phone", loginVO.getPhone());
         session.setAttribute("postcode", loginVO.getPostcode());
         session.setAttribute("addr", loginVO.getAddr());
         session.setAttribute("detail_addr", loginVO.getDetail_addr());
         session.setAttribute("admin", loginVO.getAdmin());
         // ... 기타 필요한 세션 정보 설정 ...

         // 로그인 상태 유지 및 메인 페이지로 리디렉션
         return "redirect:../main/main.do";
     } else {
         // 로그인 실패 시 처리 (예: 오류 페이지로 리디렉션)
         return "redirect:../member/login_main.do";
     }
    }
    
    
    @RequestMapping("member/login_main.do")
    public String member_login_main(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("main_jsp", "../member/login_main.jsp");
        return "../main/main.jsp";
    }
    
    @RequestMapping("member/login_ok.do")
    public String member_login_ok(HttpServletRequest request, HttpServletResponse response) {

        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String id = request.getParameter("id");
        String pwd = request.getParameter("password");

        MemberDAO dao = MemberDAO.newInstance();
        MemberVO vo = dao.memberLogin(id, pwd);
        if (vo.getMsg().equals("OK")) {
            // 세션에 저장 
            HttpSession session = request.getSession();
            session.setAttribute("id", vo.getId());
            session.setAttribute("name", vo.getName());
            session.setAttribute("admin", vo.getAdmin());
            session.setAttribute("address", vo.getAddr());
            session.setAttribute("detail_address", vo.getDetail_addr());
            session.setAttribute("postal_code", vo.getPostcode());

            // 로그인 성공 시 메인 페이지로 리디렉션
            return "redirect:../main/main.do";
        } else {
            // 로그인 실패 시 다시 로그인 페이지로
            return "../member/login_main.do";
        }
    }
    
    
    


    @RequestMapping("member/logout.do")
    public String member_logout(HttpServletRequest request,
  		  HttpServletResponse response)
    {
  	  HttpSession session=request.getSession();
  	  session.invalidate();
  	  return "redirect:../main/main.do";
    }
    
    
}