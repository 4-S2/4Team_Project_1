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
	// id와 이메일 확인후 맞으면 임시비번으로 변경, 메일전송은 모델에서
	   public String pwdFind(String id,String email,String temp) {
		   String res="";
		   try {
			   conn=dbconn.getConnection();
			   String sql="SELECT COUNT(*) FROM user_ "
					   + "WHERE id=?";
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, id);
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   int count=rs.getInt(1);
			   rs.close();
			   ps.close();
			   
			   if(count==0) {
				   res="NO";  // 아이디없음
			   }else {
				   sql="SELECT COUNT(*) FROM user_ WHERE id=? AND email=?";
				   // 이메일 확인
				   ps=conn.prepareStatement(sql);
				   ps.setString(1, id);
				   ps.setString(2, email);
				   rs=ps.executeQuery();
				   rs.next();
				   int co=rs.getInt(1);
				   rs.close();
				   ps.close();
				   if(co==1) {
					   res="SEND";
					   sql="UPDATE user_ SET password=? "
					   		+ "WHERE id=?";
					   ps=conn.prepareStatement(sql);
					   ps.setString(1, temp);
					   ps.setString(2, id);
					   ps.executeUpdate();
					   ps.close();
				   }else {
					   res="EMAILNO";
				   }
			   }
			   
		   }catch(Exception ex) {
			   ex.printStackTrace();
		   }finally {
			   dbconn.disConnection(conn, ps);
		   }
		   
		   return res;
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
   
