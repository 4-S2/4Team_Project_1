package com.sist.model;
import java.util.*;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.MemberVO;
import com.sist.mail.*;

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
    public void member_login_ok(HttpServletRequest request, HttpServletResponse response) {
        // 문자 인코딩 설정
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        // 요청으로부터 ID와 비밀번호 가져오기
        String id = request.getParameter("id");
        String pwd = request.getParameter("password");

        // DAO 인스턴스 생성 및 로그인 메소드 호출
        MemberDAO dao = MemberDAO.newInstance();
        MemberVO vo = dao.memberLogin(id, pwd);

        try {
            PrintWriter out = response.getWriter();

            if (vo.getMsg().equals("OK")) {
                // 세션에 사용자 정보 저장
                HttpSession session = request.getSession();
                session.setAttribute("id", vo.getId());
                session.setAttribute("name", vo.getName());
                session.setAttribute("admin", vo.getAdmin());
                session.setAttribute("address", vo.getAddr());
                session.setAttribute("detail_address", vo.getDetail_addr());
                session.setAttribute("postal_code", vo.getPostcode());
                // ... 기타 세션 정보 설정 ...

                // 로그인 성공 시, 성공 메시지 전송
                out.print("Login Success");
            } else {
                // 로그인 실패 시, 실패 메시지 전송
                out.print("Login Failed");
            }
        } catch(IOException e) {
            e.printStackTrace();
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
    
    // 아이디 찾기 요청 매핑
    @RequestMapping("member/find_id.do")
    public String member_find_id(HttpServletRequest request, HttpServletResponse response) {
        // 아이디 찾기 관련 로직 처리
        
    	request.setAttribute("main_jsp", "../member/find_id.jsp");
    	return "../main/main.jsp";
    }

    // 아이디 찾기 결과 처리 요청 매핑
	@RequestMapping("member/idfind_ok.do")
	public void memberIdFindOk(HttpServletRequest request,HttpServletResponse response)
	{
		String email=request.getParameter("email");
		//DAO 연동
		MemberDAO dao = MemberDAO.newInstance();
		String res = dao.memeberId_EmailFind(email);
		try
		{
			// Ajax에 값을 전송 => NO, s***
			PrintWriter out = response.getWriter();
			out.println(res);
		}catch(Exception ex) {}
	}
    

    @RequestMapping("member/find_password.do")
    public String member_password_id(HttpServletRequest request, HttpServletResponse response) {
        // 아이디 찾기 관련 로직 처리
        
    	request.setAttribute("main_jsp", "../member/find_password.jsp");
    	return "../main/main.jsp";
    }
    
    // 비밀번호 찾기 결과 처리 요청 매핑
    @RequestMapping("member/find_password_ok.do")
	  public void member_pwdfindok(HttpServletRequest request,
			  HttpServletResponse response) {

		  String id=request.getParameter("id");
		  String email=request.getParameter("email");
		  Random rand=new Random();
		  int x = rand.nextInt(9000) + 1000; 
		  String t=x+"";
		  MemberDAO dao=MemberDAO.newInstance();
		  String res=dao.pwdFind(id,email,t);
		  if(res.equals("SEND")) {
			  MailSender msd=new MailSender();
			  msd.naverMailSend(email, t);
		  }
		  
		  try {
			  PrintWriter out=response.getWriter();
			  out.write(res);
		  }catch(Exception ex) {
			  ex.printStackTrace();
		  }
	  }
    
    
    
}