package com.sist.mail;
import java.util.*;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.sist.vo.*;
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
    		"	  background: #fff;" + 
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
	
	public static void main(String[] args) {
	//  임시비번용 랜덤수 발생
	/*
	 * Random rand=new Random(); int x = rand.nextInt(9000) + 1000; // 4자리수
	 * 1000~9999 String t=x+""; SendMailer s=new SendMailer();
	 * s.naverMailSend("pkpphn@naver.com",t);
	 */
	}
	
	public void naverMailSend(String toEmail, String tempPwd) {
		// 수신이메일, 임시비번
		String host="smtp.naver.com"; // 네이버일 경우 네이버 계정, gmail경우 gamil계정
		String user="ksssk96@naver.com";
		String password="LJNRZL6YY7VR";
		Properties props=new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 587);
		props.put("mail.smtp.auth", true);
		Session session=Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		
		
		
		try {
			MimeMessage message=new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress("ksssk96@gmail.com"));
			// 보낼이메일주소 매개변수
			message.setSubject("[Busan Tour]임시 비밀번호 발송 안내."); // 메일 제목
			// 메일내용
			
			
			
			String html="<html>"
       		     +"<head>"
       		     +"</head>"
       		     +"<body>"
       		     +"<h3>'Busan Tour' 임시 비밀번호 <b>'"+tempPwd+"'</b>"
       		     +"입니다.</h3>"
       		     +"<h3>로그인 후 비밀번호 변경을 권장합니다.</h3>"
       		     +"</body>"
       		     +"</html>";
			
			message.setContent(html,"text/html;charset=UTF-8"); // send the message
			Transport.send(message);
			System.out.println("Message Send Success!");
		}catch(MessagingException e) {
			e.printStackTrace();
		}
	}
}