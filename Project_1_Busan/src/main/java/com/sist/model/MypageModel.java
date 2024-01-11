package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;

import java.io.PrintWriter;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.BusanListVO;
import com.sist.vo.CartVO;
import com.sist.vo.FoodReserveVO;
import com.sist.vo.JjimVO;
import com.sist.vo.MemberVO;
import com.sist.vo.QnaBoardVO;
import com.sist.vo.ReserveInfoVO;


public class MypageModel {
	// 마이페이지 메인 (회원정보수정)
	  @RequestMapping("mypage/main.do") 
	  public String mypage_main(HttpServletRequest request, HttpServletResponse response) {
		  HttpSession session=request.getSession(); 
		  String id=(String)session.getAttribute("id");
	  
		  MypageDAO dao=MypageDAO.newInstance(); 
		  MemberVO vo=dao.myprofile(id);
		  
			String telNo1= vo.getPhone().substring(0,3);
			String telNo2= vo.getPhone().substring(3,7);
			String telNo3= vo.getPhone().substring(7,11);
			request.setAttribute("vo", vo);
			request.setAttribute("telNo1", telNo1);
			request.setAttribute("telNo2", telNo2);
			request.setAttribute("telNo3", telNo3);
		  request.setAttribute("mypage_jsp","editProfile.jsp"); 
		  request.setAttribute("main_jsp","../mypage/mypage_main.jsp"); 
		  
		  return "../main/main.jsp"; 
	  }
	 
	// 회원정보수정
	@RequestMapping("mypage/editProfile.do")
	public void mypage_editProfile(HttpServletRequest request, HttpServletResponse response)
	{
        response.setContentType("text/html;charset=UTF-8");
        
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		try
		{
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		String pwd=request.getParameter("pwd");
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String postcode=request.getParameter("postcode");
		String addr=request.getParameter("addr");
		String daddr=request.getParameter("daddr");
		String phone=request.getParameter("phone");
		
		MemberVO vo=new MemberVO();
		vo.setId(id);
		vo.setPwd(pwd);
		vo.setName(name);
		vo.setEmail(email);
		vo.setPostcode(postcode);
		vo.setAddr(addr);
		vo.setDetail_addr(daddr);
		vo.setPhone(phone);
		
		MypageDAO dao=MypageDAO.newInstance();
		int success=dao.editProfile(vo);
		System.out.println(success);
		try
		{
			PrintWriter out=response.getWriter();
			if(success==1)
			{
				out.write("success");
			}
			else
			{
				out.write("fail");
			}
		}catch(Exception ex) 
		{
			ex.printStackTrace();
		}
	}
	
	// 예약내역 => 목록
	@RequestMapping("mypage/myReserv.do")
	public String mypage_myReserv(HttpServletRequest request, HttpServletResponse response)
	{	
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		MypageDAO dao=MypageDAO.newInstance();
		
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		
	    // 탭에 대한 정보를 파라미터로 받아옴 (예: tab=1, tab=2 등)
		String tab = request.getParameter("tab");
		if(tab==null)
			tab="1";
	    
	    int startPage, endPage, totalpage;
		
		  if ("2".equals(tab)) {
		        // 전시회
		        totalpage = dao.reservationRowCount(id);
		        final int BLOCK = 5;
		        startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
		        endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;
		        if (endPage > totalpage) endPage = totalpage;
		        
		        List<ReserveInfoVO> rlist = dao.myExReserveList(id,curpage);
		        
				request.setAttribute("curpage", curpage);
				request.setAttribute("totalpage", totalpage);
				request.setAttribute("startPage", startPage);
				request.setAttribute("endPage", endPage);
				request.setAttribute("rlist", rlist);
		    } else if ("1".equals(tab)) {
		        // 맛집
		        totalpage = dao.fdreservationRowCount(id);
		        final int BLOCK = 5;
		        startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
		        endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;
		        if (endPage > totalpage) endPage = totalpage;
		        
		        List<FoodReserveVO> flist = dao.myFdReserveList(id, curpage);
		        
				request.setAttribute("curpage", curpage);
				request.setAttribute("totalpage", totalpage);
				request.setAttribute("startPage", startPage);
				request.setAttribute("endPage", endPage);
		        request.setAttribute("flist", flist);
		    }
		
		int rSize = dao.TotalresCount(id);
		request.setAttribute("rSize",rSize);  
		request.setAttribute("mypage_jsp", "myReserv.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		return "../main/main.jsp";
	}
	
	// 예약내역 => 맛집상세
	@RequestMapping("mypage/myReserv_foodDetail.do")
	public String mypage_myReserv_foodDetail(HttpServletRequest request, HttpServletResponse response)
	{	
		String rno=request.getParameter("rno");
		
		MypageDAO dao=MypageDAO.newInstance();
		
		FoodReserveVO vo=dao.myFdReserveDetail(rno);
		request.setAttribute("vo", vo);
		return "../mypage/myReserv_fdDetail.jsp";
	}
	
	// 예약내역 => 전시상세
	@RequestMapping("mypage/myReserv_exDetail.do")
	public String mypage_myReserv_exDetail(HttpServletRequest request, HttpServletResponse response)
	{	
		String no=request.getParameter("no");
		MypageDAO dao=MypageDAO.newInstance();
		
		ReserveInfoVO vo=dao.myExReserveDetail(no);
		request.setAttribute("vo", vo);
		return "../mypage/myReserv_exDetail.jsp";
	}
	
	// 맛집예약 취소
	@RequestMapping("admin/admin_Reserve_cancel.do")
	public String stateChange2(HttpServletRequest request, HttpServletResponse response) {
		String rno=request.getParameter("rrno");
		
		MypageDAO dao=MypageDAO.newInstance();
		dao.fdReserve_cc(Integer.parseInt(rno));
		
		return "redirect:../mypage/myReserv.do";
	}
	
	// 전시회예약 취소
	@RequestMapping("mypage/ex_Reserve_cancel.do")
	public String ex_Reserve_cancel(HttpServletRequest request, HttpServletResponse response) {
		String nno=request.getParameter("nno");
		
		MypageDAO dao=MypageDAO.newInstance();
		dao.exReserve_cc(Integer.parseInt(nno));
		
		return "redirect:../mypage/myReserv.do?tab=2";
	}
	
	 
	// 장바구니
	@RequestMapping("mypage/myCart.do")
	public String mypage_myCart(HttpServletRequest request, HttpServletResponse response)
	{	
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		MypageDAO dao=MypageDAO.newInstance();
		List<CartVO> list = dao.myCartData(id);
		int total = dao.myCartTotal(id);
		
		request.setAttribute("list", list);
		request.setAttribute("total", total);
		request.setAttribute("mypage_jsp", "myCart.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		return "../main/main.jsp";
	}
	
	// 구매내역
	@RequestMapping("mypage/myPurchase.do")
	public String mypage_myPurchase(HttpServletRequest request, HttpServletResponse response)
	{	
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		
		MypageDAO dao=MypageDAO.newInstance();
		List<CartVO> list = dao.myBuyData(id, curpage);
		int total = dao.myBuyTotal(id);
		
        int totalpage = dao.myBuyTotalPage(id);
        final int BLOCK = 5;
        int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
        int endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;
        if (endPage > totalpage) endPage = totalpage;
        
        System.out.println(list.size());
        System.out.println(total);
        System.out.println(totalpage);
        request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("list", list);
		request.setAttribute("total", total);
		request.setAttribute("mypage_jsp", "myPurchase.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		return "../main/main.jsp";
	}
	
	// 장바구니 개수 변경
	@RequestMapping("mypage/mypage_mycart_chg.do")
	public String mypage_mycart_chg(HttpServletRequest request, HttpServletResponse response) {
		String cno=request.getParameter("cno");
		String amount=request.getParameter("amount");
		
		MypageDAO dao=MypageDAO.newInstance();
		dao.mycart_chg(Integer.parseInt(cno),Integer.parseInt(amount));
			
		return "redirect:../mypage/myCart.do";
	}
	
	// 찜목록
	@RequestMapping("mypage/myJjim.do")
	public String mypage_myJjim(HttpServletRequest request, HttpServletResponse response)
	{	
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		MypageDAO dao=MypageDAO.newInstance();
		
		List<JjimVO> tlist = dao.busanjjimListData(id, "tour",1);
		List<JjimVO> fdlist = dao.busanjjimListData(id, "food",4);
		List<JjimVO> flist = dao.busanjjimListData(id, "festival",2);
		List<JjimVO> alist = dao.busanjjimListData(id, "activity",3);
		List<JjimVO> elist = dao.exjjimListData(id);
		
		int tSize = tlist.size();
		int fdSize = fdlist.size();
		int fSize = flist.size();
		int aSize = alist.size();
		int eSize = elist.size();
		int totalJjim = tSize+fdSize+fSize+aSize+eSize;
		  
		request.setAttribute("tlist",tlist); 
		request.setAttribute("fdlist",fdlist);
		request.setAttribute("flist",flist); 
		request.setAttribute("alist",alist);
		request.setAttribute("elist",elist);		
		request.setAttribute("totalJjim",totalJjim);
		request.setAttribute("mypage_jsp", "myJjim.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		return "../main/main.jsp";
	}
	
	// 찜 취소
	 @RequestMapping("mypage/myjjim_cancel.do")
		public void myjjim_cancel(HttpServletRequest request, HttpServletResponse response)
		{
		   try {
			   request.setCharacterEncoding("UTF-8");
		   }catch(Exception e) {e.printStackTrace();}
		   HttpSession session=request.getSession();
		   String id=(String)session.getAttribute("id");
		   
		   String jno=request.getParameter("jno");
		   
		   MypageDAO dao=MypageDAO.newInstance();
		   String res=dao.jjimCancel(id, Integer.parseInt(jno));
		   
		   try {
			   PrintWriter out=response.getWriter();
			   out.write(res);
		   }catch(Exception e) {e.printStackTrace();}
		}
	
	// 문의내역
	@RequestMapping("mypage/myInquiry.do")
	public String mypage_myqInquiry(HttpServletRequest request, HttpServletResponse response)
	{	
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		MypageDAO dao=MypageDAO.newInstance();
		List<QnaBoardVO> list = dao.getAllQnas(id);
		int inqSize = list.size();
		
		int totalpage=dao.QnasTotalPage(id);
		
		final int BLOCK=10;
		int startpage=((curpage-1)/BLOCK)*BLOCK+1;
		int endpage=((curpage-1)/BLOCK)*BLOCK+BLOCK;
		if(totalpage<endpage) {
			endpage=totalpage;
		}
		
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startpage);
		request.setAttribute("endPage", endpage);
		request.setAttribute("inqSize", inqSize); 
		request.setAttribute("list", list); 
		request.setAttribute("mypage_jsp", "myInquiry.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("mypage/myInquiry_answer.do")
	public String mypage_myqInquiry_answer(HttpServletRequest request, HttpServletResponse response)
	{	
		String gid=request.getParameter("gid");
		String qno=request.getParameter("qno");
		
		request.setAttribute("mypage_jsp", "myacc_delete.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		return "../main/main.jsp";
	}
	
	// 회원탈퇴
	@RequestMapping("mypage/myacc_delete.do")
	public String mypage_myacc_delete(HttpServletRequest request, HttpServletResponse response)
	{	
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		MypageDAO dao=MypageDAO.newInstance();
		
		request.setAttribute("mypage_jsp", "myacc_delete.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		return "../main/main.jsp";
	}
	
	// 회원탈퇴 확인
	@RequestMapping("mypage/myacc_delete_ok.do")
	public void mypage_myacc_delete_ok(HttpServletRequest request, HttpServletResponse response)
	{
		String pwd=request.getParameter("pwd");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");

		MypageDAO dao=MypageDAO.newInstance();
		String result=dao.memberDeleteOk(id, pwd);
		System.out.println(result);
		if(result.equals("OK"))
		{
			session.invalidate();
		}
		try
		{
			PrintWriter out=response.getWriter();
			out.print(result);
		}catch(Exception ex) {}
	}
}
