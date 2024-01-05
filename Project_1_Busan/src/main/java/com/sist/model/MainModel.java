package com.sist.model;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.dao.BusanDAO;
import com.sist.dao.*;
import com.sist.vo.*;

/*
 *    1. DispatcherServlet
 *       => WEB-INF => application에 있는 클래스명을 읽는다 
 *       => 대기 
 *       => init은 서버구동시 한번만 수행 
 *    2. 사용자 접속 : service()
 *       => 사용자가 URL전송 
 *          main/main.do 
 *       =>  전체 XML에 등록된 Model을 읽어서 
 *           => @RequestMapping을 찾아서 메소드 호출 
 */
public class MainModel {
  @RequestMapping("main/main.do")
  public String main_main(HttpServletRequest request,
        HttpServletResponse response)
  {      
     
      
      BusanDAO topdao = BusanDAO.newInstance();
      GoodsDAO gtopdao = GoodsDAO.newInstance();
        ExDAO exTopDao = ExDAO.newInstance();
        
        NoticeDAO ndao = NoticeDAO.newInstance();
        QnaBoardDAO qdao = QnaBoardDAO.newInstance();
        
        // 각 리스트 쿠키 번호만 잘라서 저장
      Cookie[] cookies = request.getCookies();
      List<BusanListVO> rcntList = new ArrayList<>();
      List<ExVO> eRcntList = new ArrayList<>();
      /*
       * List<BusanListVO> tRntList = new ArrayList<>(); List<BusanListVO> fRntList =
       * new ArrayList<>(); List<BusanListVO> aRntList = new ArrayList<>();
       * List<BusanListVO> fdRntList = new ArrayList<>(); List<BusanListVO> eRntList =
       * new ArrayList<>();
       */
     try {
      if (cookies != null) {
         for(int i = 0; i < 5; i++) {   
          for (Cookie c : cookies) {
              if (c.getName().startsWith("tour")) {
                  String value = c.getValue();
                  String[] tokens = value.split("\\|");

                  if (i < tokens.length) {
                      String token = tokens[i].trim(); // 공백을 제거합니다.
                      if (!token.isEmpty()) { // 빈 문자열이 아닌 경우에만 처리합니다.
                          int no = Integer.parseInt(token);
                          BusanListVO vo = topdao.busanDetailData(no, "tour");
                          vo.setCocate(1);
                          rcntList.add(vo);
                          System.out.println(i+"번째 출력:"+token);

                      }
                  }
              } else if (c.getName().startsWith("festival")) {
                  String value = c.getValue();
                  String[] tokens = value.split("\\|");

                  if (i < tokens.length) {
                      String token = tokens[i].trim(); // 공백을 제거합니다.
                      if (!token.isEmpty()) { // 빈 문자열이 아닌 경우에만 처리합니다.
                          System.out.println("festival"+token);
                          int no = Integer.parseInt(token);
                          BusanListVO vo = topdao.busanDetailData(no, "festival");
                          vo.setCocate(2);
                          rcntList.add(vo);
                          System.out.println(i+"번째 출력:"+token);
                      }
                  }
              } else if (c.getName().startsWith("activity")) {
                  String value = c.getValue();
                  String[] tokens = value.split("\\|");

                  if (i < tokens.length) {
                      String token = tokens[i].trim(); // 공백을 제거합니다.
                      if (!token.isEmpty()) { // 빈 문자열이 아닌 경우에만 처리합니다.
                          System.out.println("activity"+token);
                          int no = Integer.parseInt(token);
                          BusanListVO vo = topdao.busanDetailData(no, "activity");
                          vo.setCocate(3);
                          rcntList.add(vo);
                          System.out.println(i+"번째 출력:"+token);
                      }
                  }
              } else if (c.getName().startsWith("food")) {
                  String value = c.getValue();
                  String[] tokens = value.split("\\|");
               /*
                * for(String tokenss : tokens) { System.out.println(tokenss); }
                */
                  if (i < tokens.length) {
                      String token = tokens[i].trim(); // 공백을 제거합니다.
                      if (!token.isEmpty()) { // 빈 문자열이 아닌 경우에만 처리합니다.
                          System.out.println("food"+token);
                          int no = Integer.parseInt(token);
                          BusanListVO vo = topdao.busanDetailData(no, "food");
                          vo.setCocate(4);
                          rcntList.add(vo);
                          System.out.println(i+"번째 출력:"+token);
                      }
                  }
              }
          }
         }
      }
     }catch(Exception e) {
        e.printStackTrace();
     }
     
     /*if(cookies!=null) {
         for(Cookie c : cookies) {
            if(c.getName().startsWith("tour")) {
               String value = c.getValue();
               StringTokenizer st = new StringTokenizer(value, "|");
               
               while(st.hasMoreTokens()) {
                  int no = Integer.parseInt(st.nextToken());
                  BusanListVO vo = topdao.busanDetailData(no,"tour");
                  vo.setCocate(1);
                  rcntList.add(vo);
               }
            }else if(c.getName().startsWith("festival")) {
               String value = c.getValue();
               StringTokenizer st = new StringTokenizer(value, "|");
               
               while(st.hasMoreTokens()) {
                  int no = Integer.parseInt(st.nextToken());
                  BusanListVO vo = topdao.busanDetailData(no,"festival");
                  vo.setCocate(2);
                  rcntList.add(vo);
               }
            }else if(c.getName().startsWith("activity")) {
               String value = c.getValue();
               StringTokenizer st = new StringTokenizer(value, "|");
               
               while(st.hasMoreTokens()) {
                  int no = Integer.parseInt(st.nextToken());
                  BusanListVO vo = topdao.busanDetailData(no,"activity");
                  vo.setCocate(3);
                  rcntList.add(vo);
               }
            }else if(c.getName().startsWith("food")) {
               String value = c.getValue();
               StringTokenizer st = new StringTokenizer(value, "|");
               
               while(st.hasMoreTokens()) {
                  int no = Integer.parseInt(st.nextToken());
                  BusanListVO vo = topdao.busanDetailData(no, "food");
                  vo.setCocate(4);
                  rcntList.add(vo);
               }
            }else if(c.getName().startsWith("exhibition")) {
               String value = c.getValue();
               StringTokenizer st = new StringTokenizer(value, "|");
               
               while(st.hasMoreTokens()) {
                  int eno = Integer.parseInt(st.nextToken());
                  ExVO vo = exTopDao.exDetailData(eno);
                  vo.setCocate(5);
                  eRcntList.add(vo);
               }
            }
         }
      }*/

      /*
       * Collections.reverse(tRntList); Collections.reverse(fRntList);
       * Collections.reverse(aRntList); Collections.reverse(fdRntList);
       * Collections.reverse(eRntList);
       */
      
      Collections.reverse(rcntList);
      request.setAttribute("rcntList", rcntList);
      
      
      /*
       * request.setAttribute("tRntList", tRntList); request.setAttribute("fRntList",
       * fRntList); request.setAttribute("aRntList", aRntList);
       * request.setAttribute("fdRntList", fdRntList);
       * request.setAttribute("eRntList", eRntList);
       */
      
       // 추천 맛집 Top 3 
       List<BusanListVO> fdtoplist = topdao.findTop3("food");
       request.setAttribute("fdtoplist", fdtoplist);
       
      // 추천 특산물 Top 3
       List<GoodsVO> gtoplist = gtopdao.goodsfindTop3();
       request.setAttribute("gtoplist", gtoplist);
       
      // 추천 체험 Top 3 
       List<BusanListVO> atoplist = topdao.findTop3("activity");
       request.setAttribute("atoplist", atoplist);
       
      // 추천 축제 Top 3 
       List<BusanListVO> ftoplist = topdao.findTop3("festival");
       request.setAttribute("ftoplist", ftoplist);
       
       List<ExVO> exToplist = exTopDao.mainpage_exData();
       request.setAttribute("exToplist", exToplist);
       
       // 공지사항 nno 1-4번
       List<NoticeVO> nlist = ndao.noticefind4();
       request.setAttribute("nlist", nlist);
       
       // 묻고 답하기 qno 6,8,10,7번 
       List<QnaBoardVO> qlist = qdao.Qnafind4();
       request.setAttribute("qlist", qlist);
       
       
       request.setAttribute("main_jsp", "../main/home.jsp"); 
       return "../main/main.jsp";
       
     
  
  }
}