package com.sist.mail;
import java.util.*;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;



public class MailSender {
	private String style="<style>" + 
    		"body {" + 
    		"	  padding:1.5em;" + 
    		"	  background: #f5f5f5" + 
    		"	}" + 
    		"	table {" + 
    		"	  border: 1px #a39485 solid;" + 
    		"	  font-size: .9em;" + 
    		"	  box-shadow: 0 2px 5px rgba(0,0,0,.25);" + 
    		"	  width: 100%;" + 
    		"	  border-collapse: collapse;" + 
    		"	  border-radius: 5px;" + 
    		"	  overflow: hidden;" + 
    		"	}" + 
    		"	th {" + 
    		"	  text-align: left;" + 
    		"	}" + 
    		"	thead {" + 
    		"	  font-weight: bold;" + 
    		"	  color: #fff;" + 
    		"	  background: #73685d;" + 
    		"	}" + 
    		"	 td, th {" + 
    		"	  padding: 1em .5em;" + 
    		"	  vertical-align: middle;" + 
    		"	}" + 
    		"	 td {" + 
    		"	  border-bottom: 1px solid rgba(0,0,0,.1);" + 
    		"	  background: #000;" + 
    		"	}" + 
    		"	a {" + 
    		"	  color: #73685d;" + 
    		"	}" + 
    		"	 @media all and (max-width: 768px) {" + 
    		"	  table, thead, tbody, th, td, tr {" + 
    		"	    display: block;" + 
    		"	  }" + 
    		"	  th {" + 
    		"	    text-align: right;" + 
    		"	  }" + 
    		"	  table {" + 
    		"	    position: relative; " + 
    		"	    padding-bottom: 0;" + 
    		"	    border: none;" + 
    		"	    box-shadow: 0 0 10px rgba(0,0,0,.2);" + 
    		"	  }" + 
    		"	  thead {" + 
    		"	    float: left;" + 
    		"	    white-space: nowrap;" + 
    		"	  }" + 
    		"	  tbody {" + 
    		"	    overflow-x: auto;" + 
    		"	    overflow-y: hidden;" + 
    		"	    position: relative;" + 
    		"	    white-space: nowrap;" + 
    		"	  }" + 
    		"	  tr {" + 
    		"	    display: inline-block;" + 
    		"	    vertical-align: top;" + 
    		"	  }" + 
    		"	  th {" + 
    		"	    border-bottom: 1px solid #a39485;" + 
    		"	  }" + 
    		"	  td {" + 
    		"	    border-bottom: 1px solid #e5e5e5;" + 
    		"	  }" + 
    		"	  }" + 
    		"</style>";

	/*
	 * public static void main(String[] args) { MailManager m=new MailManager();
	 * MemberVO vo=new MemberVO(); m.naverMailSend(vo, 1); }
	 */
	public static void main(String[] args) {
		MailSender s=new MailSender();
		s.naverMailSend();
	}
	public void naverMailSend() {
		
		 String host = "smtp.naver.com"; // 네이버일 경우 네이버 계정, gmail경우 gmail 계정 
	     String user = "ksssk96@naver.com"; // 패스워드 
	     String password = "akak852312";      // SMTP 서버 정보를 설정한다. 
	     Properties props = new Properties(); 
	     props.put("mail.smtp.host", host); 
	     props.put("mail.smtp.port", 587); 
	     props.put("mail.smtp.auth", "true"); 
	     Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator(){ 
	    	 protected PasswordAuthentication getPasswordAuthentication() 
	    	 { 
	    		 return new PasswordAuthentication(user, password); 
	    	 } 
	     }); 
	     try { 
	        	MimeMessage message = new MimeMessage(session); 
	              message.setFrom(new InternetAddress(user)); 
	              message.addRecipient(Message.RecipientType.TO, new InternetAddress("ksssk96@naver.com")); // 메일 제목 
	              message.setSubject("예약 내역입니다!!"); // 메일 내용
	              
	              String html="<html>"
	            		     +"<head>"
	            		     +style
	            		     +"</head>"
	            		     +"<table>"
	            		     +"<thead>"
	            		     +"<tr>"
	            		     +"<th width=15%>예약번호</th>"
	            		     +"<td width=85%>1</td>"
	            		     +"</tr>"
	            		     +"<tr>"
	            		     +"<th>아이디</th>"
	            		     +"<td>hong</td>"
	            		     +"</tr>"
	            		     +"<tr>"
	            		     +"<th>맛집명</th>"
	            		     +"<td>승일참치</td>"
	            		     +"</tr>"
	            		     +"<tr>"
	            		     +"<th></th>"
	            		     +"<td><img src=\"https://www.menupan.com/restaurant/restimg/007/zzmenuimg/j10371733_z.jpg\" width=200 height=200></td>"
	            		     +"</tr>"
	            		     +"<tr>"
	            		     +"<th>전화</th>"
	            		     +"<td>02)2203-3044</td>"
	            		     +"</tr>"
	            		     +"<tr>"
	            		     +"<th>주소</th>"
	            		     +"<td>서울 송파구 송파동 58-18 성우빌딩 2층</td>"
	            		     +"</tr>"
	            		     +"<tr>"
	            		     +"<th>예약일</th>"
	            		     +"<td>2024년 01월 09일</td>"
	            		     +"</tr>"
	            		     +"<tr>"
	            		     +"<th>인원</th>"
	            		     +"<td>5명</td>"
	            		     +"</tr>"
	            		     +"<body>"
	            		     +"</body>"
	            		     +"</html>";
	              		     
	              message.setContent(html,"text/html;charset=UTF-8"); // send the message 
	              Transport.send(message); 
	              System.out.println("Success Message Send"); 
	         } catch (MessagingException e) 
	          {
	        	 e.printStackTrace();
	          }
	     }
}