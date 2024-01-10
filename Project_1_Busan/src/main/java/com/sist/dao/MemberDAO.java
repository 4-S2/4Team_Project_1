package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.vo.*;
import com.sist.dbcp.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.net.*;

public class MemberDAO {
   private Connection conn;
   private PreparedStatement ps;
   private CreateDBCPConnection dbconn=
		     new CreateDBCPConnection();
   private static MemberDAO dao;
   
   public static MemberDAO newInstance()
   {
	   if(dao==null)
		   dao=new MemberDAO();
	   return dao;
   }
   // ID중복체크 
   public int memberIdCheck(String id)
   {
	   int count=0;
	   try
	   {
		   conn=dbconn.getConnection();
		   String sql="SELECT COUNT(*) FROM user_ "
				     +"WHERE id=?";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, id);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   count=rs.getInt(1);
		   rs.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   dbconn.disConnection(conn, ps);
	   }
	   return count;
   }
   public void memberInsert(MemberVO vo)
   {
	   try
	   {
		   conn=dbconn.getConnection();
		   String sql = "INSERT INTO user_ VALUES(?,?,?,?,?,?,?,?,'n')";
	        ps = conn.prepareStatement(sql);
	        ps.setString(1, vo.getId());
	        ps.setString(2, vo.getPwd());
	        ps.setString(3, vo.getEmail());
	        ps.setString(4, vo.getName());
	        ps.setString(5, vo.getPhone());
	        ps.setString(6, vo.getPostcode());
	        ps.setString(7, vo.getAddr());
	        ps.setString(8, vo.getDetail_addr());
	        
		
		     ps.executeUpdate();
		   // save(vo)
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   dbconn.disConnection(conn, ps);
	   } 
   }
   public MemberVO memberLogin(String id, String pwd) {
	    MemberVO vo = new MemberVO();
	    try {
	        conn = dbconn.getConnection();
	        String sql = "SELECT id,password, email, name, phone, postcode, addr, detail_addr , admin "
	                   + "FROM user_ "
	                   + "WHERE id=?";
	        ps = conn.prepareStatement(sql);
	        ps.setString(1, id);
	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {
	            String db_id = rs.getString("id");
	            String db_pwd = rs.getString("password");
	            String db_email = rs.getString("email");
	            String name = rs.getString("name");
	            String phone = rs.getString("phone");
	            String postcode = rs.getString("postcode");
	            String addr = rs.getString("addr");
	            String detail_addr = rs.getString("detail_addr");
	            String admin =rs.getString("admin");

	            vo.setId(db_id);
	            vo.setEmail(db_email);
	            vo.setName(name);
	            vo.setPhone(phone);
	            vo.setPostcode(postcode);
	            vo.setAddr(addr);
	            vo.setDetail_addr(detail_addr);
	            vo.setAdmin(admin);

	            

	            if (db_pwd.equals(pwd)) {
	                vo.setMsg("OK");
	            } else {
	                vo.setMsg("NOPWD");
	            }
	        } else {
	            vo.setMsg("NOID");
	        }

	        rs.close();
	    } catch (Exception ex) {
	        ex.printStackTrace();
	    } finally {
	        dbconn.disConnection(conn, ps);
	    }
	    return vo;
	}
   
   public String memeberId_EmailFind(String email)
   {
	   String result="";
	   try
	   {
		   conn=dbconn.getConnection();
		   String sql="SELECT COUNT(*) FROM user_ "
		   		+ "WHERE email=?";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, email);
		   ResultSet rs = ps.executeQuery();
		   rs.next();
		   int count=rs.getInt(1);
		   rs.close();
		   if(count==0) // email이 없는 상태
		   {
			   result="NO";
		   }
		   else // email이 존재
		   {
			   sql="SELECT RPAD(SUBSTR(id,1,1),LENGTH(id),'*') "
			   		+ "FROM user_ "
			   		+ "WHERE email=?";
			   //s***
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, email);
			   rs = ps.executeQuery();
			   rs.next();
			   result=rs.getString(1);
			   rs.close();
			   
		   }
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   dbconn.disConnection(conn, ps);
	   }
	   return result;
   }
   public String memberPasswordFind(String id,String email)
   {
	   String result="";
	   try
	   {
		   conn=dbconn.getConnection();
		   String sql="SELECT COUNT(*) FROM user_ "
		   		+ "WHERE id=? AND email=?";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, id);
		   ps.setString(2, email);
		   ResultSet rs = ps.executeQuery();
		   rs.next();
		   int count =rs.getInt(1);
		   rs.close();
		   if(count ==0)
		   {
			   result="NO";
		   }
		   else
		   {
			   sql="SELECT RPAD(SUBSTR(password,1,1),LENGTH(password),'*') "
			   		+ "FROM user_ "
			   		+ "WHERE id=? AND email=?";
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, id);
			   ps.setString(2, email);
			   rs=ps.executeQuery();
			   rs.next();
			   result=rs.getString(1);
			   rs.close();
		   }
			   
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
		  
	   }
	   finally
	   {
		   dbconn.disConnection(conn, ps);
	   }
	   return result;
   }
	public String memberPasswordPhoneFind(String id,String phone)
	{
		String result="";
		try
		{
			conn=dbconn.getConnection();
			String sql="SELECT COUNT(*) FROM user_ "
					+ "WHERE id=? AND phone=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, phone);
			ResultSet rs = ps.executeQuery();
			rs.next();
			int count =rs.getInt(1);
			rs.close();
			if(count ==0)
			{
				result="NO";
			}
			else
			{
				sql="SELECT RPAD(SUBSTR(password,1,1),LENGTH(password),'*') "
						+ "FROM user_ "
						+ "WHERE id=? AND phone=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, id);
				ps.setString(2, phone);
				rs=ps.executeQuery();
				rs.next();
				result=rs.getString(1);
				rs.close();
			}
			
		}catch(Exception ex)
		{
			ex.printStackTrace();
			
		}
		finally
		{
			dbconn.disConnection(conn, ps);
		}
		return result;
	}
	public boolean sendPasswordToEmail(String id, String email, String pwd) {
	    boolean sent = false;

	     String host = "smtp.naver.com"; // 네이버일 경우 네이버 계정, gmail경우 gmail 계정 
	     String user = ""; // 패스워드 
	     String password = "";      // SMTP 서버 정보를 설정한다. 
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
	              message.addRecipient(Message.RecipientType.TO, new InternetAddress("ksssk96@gmail.com"));
	              // 메일 제목 
	              message.setSubject("Busan Tour 비밀번호 확인"); // 메일 내용
	              
	              String html="<html><head>"+
	                     "<body>"
	            		  +id+"님의 비밀번호는 '"+pwd+"'입니다."
	            		  +"</body></html>";
	              		     
	              message.setContent(html,"text/html;charset=UTF-8"); // send the message 
	              Transport.send(message); 
	              System.out.println("Success Message Send"); 
	         } catch (MessagingException e) 
	          {
	        	 e.printStackTrace();
	          }

	    return sent;
	}

	public String getOriginalPassword(String id, String email) {
	    try {
	        conn = dbconn.getConnection();
	        String sql = "SELECT password FROM user_ WHERE id=? AND email=?";
	        ps = conn.prepareStatement(sql);
	        ps.setString(1, id);
	        ps.setString(2, email);
	        ResultSet rs = ps.executeQuery();
	        if(rs.next()) {
	            return rs.getString("password");
	        }
	        rs.close();
	    } catch(Exception ex) {
	        ex.printStackTrace();
	    } finally {
	        dbconn.disConnection(conn, ps);
	    }
	    return null; // 일치하는 사용자가 없으면 null 반환
	}
	
	// 사용자 조회
	public MemberVO memberSearch(String id) {
		MemberVO vo = new MemberVO();
		
		try {
			conn = dbconn.getConnection();
			String sql = "SELECT email, postcode, addr, detail_addr, phone "
						+"FROM user_ "
						+"WHERE id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			rs.next();
			vo.setEmail(rs.getString(1));
			vo.setPostcode(rs.getString(2));
			vo.setAddr(rs.getString(3));
			vo.setDetail_addr(rs.getString(4));
			vo.setPhone(rs.getString(5));
			rs.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			dbconn.disConnection(conn, ps);
		}
		
		return vo;
	}

}
   
